/*
 * Copyright (c) 2019 ETH Zürich, Educational Development and Technology (LET)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

package ch.ethz.seb.sebserver.webservice.servicelayer.lms.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.event.EventListener;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.stereotype.Service;

import ch.ethz.seb.sebserver.gbl.Constants;
import ch.ethz.seb.sebserver.gbl.async.AsyncService;
import ch.ethz.seb.sebserver.gbl.model.Page;
import ch.ethz.seb.sebserver.gbl.model.exam.QuizData;
import ch.ethz.seb.sebserver.gbl.model.institution.LmsSetup;
import ch.ethz.seb.sebserver.gbl.model.institution.LmsSetupTestResult;
import ch.ethz.seb.sebserver.gbl.profile.WebServiceProfile;
import ch.ethz.seb.sebserver.gbl.util.Result;
import ch.ethz.seb.sebserver.webservice.servicelayer.client.ClientCredentialService;
import ch.ethz.seb.sebserver.webservice.servicelayer.client.ClientCredentials;
import ch.ethz.seb.sebserver.webservice.servicelayer.dao.FilterMap;
import ch.ethz.seb.sebserver.webservice.servicelayer.dao.LmsSetupDAO;
import ch.ethz.seb.sebserver.webservice.servicelayer.lms.LmsAPIService;
import ch.ethz.seb.sebserver.webservice.servicelayer.lms.LmsAPITemplate;

@Lazy
@Service
@WebServiceProfile
public class LmsAPIServiceImpl implements LmsAPIService {

    private static final Logger log = LoggerFactory.getLogger(LmsAPIServiceImpl.class);

    private final AsyncService asyncService;
    private final LmsSetupDAO lmsSetupDAO;
    private final ClientCredentialService clientCredentialService;
    private final ClientHttpRequestFactory clientHttpRequestFactory;
    private final String[] openEdxAlternativeTokenRequestPaths;

    private final Map<CacheKey, LmsAPITemplate> cache = new ConcurrentHashMap<>();

    public LmsAPIServiceImpl(
            final AsyncService asyncService,
            final LmsSetupDAO lmsSetupDAO,
            final ClientCredentialService clientCredentialService,
            final ClientHttpRequestFactory clientHttpRequestFactory,
            @Value("${sebserver.lms.openedix.api.token.request.paths}") final String alternativeTokenRequestPaths) {

        this.asyncService = asyncService;
        this.lmsSetupDAO = lmsSetupDAO;
        this.clientCredentialService = clientCredentialService;
        this.clientHttpRequestFactory = clientHttpRequestFactory;

        this.openEdxAlternativeTokenRequestPaths = (alternativeTokenRequestPaths != null)
                ? StringUtils.split(alternativeTokenRequestPaths, Constants.LIST_SEPARATOR)
                : null;
    }

    /** Listen to LmsSetupChangeEvent to release an affected LmsAPITemplate from cache
     *
     * @param event the event holding the changed LmsSetup */
    @EventListener
    public void notifyLmsSetupChange(final LmsSetupChangeEvent event) {
        final LmsSetup lmsSetup = event.getLmsSetup();
        if (lmsSetup == null) {
            return;
        }

        log.debug("LmsSetup changed. Update cache by removeing eventually used references");

        this.cache.remove(new CacheKey(lmsSetup.getModelId(), 0));
    }

    @Override
    public Result<Page<QuizData>> requestQuizDataPage(
            final int pageNumber,
            final int pageSize,
            final String sort,
            final FilterMap filterMap) {

        return getAllQuizzesFromLMSSetups(filterMap)
                .map(LmsAPIService.quizzesSortFunction(sort))
                .map(LmsAPIService.quizzesToPageFunction(sort, pageNumber, pageSize));
    }

    /** Collect all QuizData from all affecting LmsSetup.
     * If filterMap contains a LmsSetup identifier, only the QuizData from that LmsSetup is collected.
     * Otherwise QuizData from all active LmsSetup of the current institution are collected.
     *
     * @param filterMap the FilterMap containing either an LmsSetup identifier or an institution identifier
     * @return list of QuizData from all affecting LmsSetup */
    private Result<List<QuizData>> getAllQuizzesFromLMSSetups(final FilterMap filterMap) {

        return Result.tryCatch(() -> {
            // case 1. if lmsSetupId is available only get quizzes from specified LmsSetup
            final Long lmsSetupId = filterMap.getLmsSetupId();
            if (lmsSetupId != null) {
                return getLmsAPITemplate(lmsSetupId)
                        .flatMap(template -> template.getQuizzes(filterMap))
                        .getOrThrow();
            }

            // case 2. get quizzes from all LmsSetups of specified institution
            final Long institutionId = filterMap.getInstitutionId();
            return new ArrayList<>(this.lmsSetupDAO.all(institutionId, true)
                    .getOrThrow()
                    .stream()
                    .map(this::getLmsAPITemplate)
                    .flatMap(Result::onErrorLogAndSkip)
                    .map(template -> template.getQuizzes(filterMap))
                    .flatMap(Result::onErrorLogAndSkip)
                    .flatMap(List::stream)
                    .collect(Collectors.toSet()));
        });
    }

    @Override
    public Result<LmsAPITemplate> getLmsAPITemplate(final String lmsSetupId) {

        log.debug("Get LmsAPITemplate for id: {}", lmsSetupId);

        return Result.tryCatch(() -> {
            return this.lmsSetupDAO
                    .byModelId(lmsSetupId)
                    .getOrThrow();
        })
                .flatMap(this::getLmsAPITemplate);
    }

    @Override
    public LmsSetupTestResult testAdHoc(final LmsSetup lmsSetup) {
        final ClientCredentials lmsCredentials = this.clientCredentialService.encryptClientCredentials(
                lmsSetup.lmsAuthName,
                lmsSetup.lmsAuthSecret,
                lmsSetup.lmsRestApiToken);

        return createLmsSetupTemplate(lmsSetup, lmsCredentials).testLmsSetup();
    }

    private Result<LmsAPITemplate> getLmsAPITemplate(final LmsSetup lmsSetup) {
        return Result.tryCatch(() -> {
            LmsAPITemplate lmsAPITemplate = getFromCache(lmsSetup);
            if (lmsAPITemplate == null) {

                lmsAPITemplate = createLmsSetupTemplate(lmsSetup);
                this.cache.put(new CacheKey(lmsSetup.getModelId(), System.currentTimeMillis()), lmsAPITemplate);
                return lmsAPITemplate;

            } else {
                log.debug("Get cached LmsAPITemplate with id: {}", lmsSetup.getModelId());
                return lmsAPITemplate;
            }
        });
    }

    private LmsAPITemplate getFromCache(final LmsSetup lmsSetup) {
        // first cleanup the cache by removing old instances
        final long currentTimeMillis = System.currentTimeMillis();
        new ArrayList<>(this.cache.keySet())
                .stream()
                .filter(key -> key.creationTimestamp - currentTimeMillis > Constants.DAY_IN_MILLIS)
                .forEach(key -> this.cache.remove(key));
        // get from cache
        return this.cache.get(new CacheKey(lmsSetup.getModelId(), 0));

    }

    private LmsAPITemplate createLmsSetupTemplate(final LmsSetup lmsSetup) {

        log.debug("Create new LmsAPITemplate for id: {}", lmsSetup.getModelId());

        final ClientCredentials credentials = this.lmsSetupDAO
                .getLmsAPIAccessCredentials(lmsSetup.getModelId())
                .getOrThrow();

        return createLmsSetupTemplate(lmsSetup, credentials);
    }

    private LmsAPITemplate createLmsSetupTemplate(final LmsSetup lmsSetup, final ClientCredentials credentials) {
        switch (lmsSetup.lmsType) {
            case MOCKUP:
                return new MockupLmsAPITemplate(
                        lmsSetup,
                        credentials,
                        this.clientCredentialService);
            case OPEN_EDX:
                return new OpenEdxLmsAPITemplate(
                        this.asyncService,
                        lmsSetup,
                        credentials,
                        this.clientCredentialService,
                        this.clientHttpRequestFactory,
                        this.openEdxAlternativeTokenRequestPaths);
            default:
                throw new UnsupportedOperationException("No support for LMS Type: " + lmsSetup.lmsType);
        }
    }

    private static final class CacheKey {
        final String lmsSetupId;
        final long creationTimestamp;
        final int hash;

        CacheKey(final String lmsSetupId, final long creationTimestamp) {
            this.lmsSetupId = lmsSetupId;
            this.creationTimestamp = creationTimestamp;
            final int prime = 31;
            int result = 1;
            result = prime * result + ((lmsSetupId == null) ? 0 : lmsSetupId.hashCode());
            this.hash = result;
        }

        @Override
        public int hashCode() {
            return this.hash;
        }

        @Override
        public boolean equals(final Object obj) {
            if (this == obj)
                return true;
            if (obj == null)
                return false;
            if (getClass() != obj.getClass())
                return false;
            final CacheKey other = (CacheKey) obj;
            if (this.lmsSetupId == null) {
                if (other.lmsSetupId != null)
                    return false;
            } else if (!this.lmsSetupId.equals(other.lmsSetupId))
                return false;
            return true;
        }
    }
}
