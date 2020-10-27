/*
 * Copyright (c) 2020 ETH Zürich, Educational Development and Technology (LET)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

package ch.ethz.seb.sebserver.gui.content;

import java.util.List;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.stream.Collectors;

import org.eclipse.rap.rwt.RWT;
import org.eclipse.rap.rwt.client.service.UrlLauncher;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import ch.ethz.seb.sebserver.gbl.Constants;
import ch.ethz.seb.sebserver.gbl.model.Domain;
import ch.ethz.seb.sebserver.gbl.model.EntityKey;
import ch.ethz.seb.sebserver.gbl.model.sebconfig.ConfigCreationInfo;
import ch.ethz.seb.sebserver.gbl.model.sebconfig.SEBClientConfig;
import ch.ethz.seb.sebserver.gbl.model.sebconfig.SEBClientConfig.ConfigPurpose;
import ch.ethz.seb.sebserver.gbl.profile.GuiProfile;
import ch.ethz.seb.sebserver.gbl.util.Tuple;
import ch.ethz.seb.sebserver.gbl.util.Utils;
import ch.ethz.seb.sebserver.gui.form.FormBuilder;
import ch.ethz.seb.sebserver.gui.form.FormHandle;
import ch.ethz.seb.sebserver.gui.service.i18n.LocTextKey;
import ch.ethz.seb.sebserver.gui.service.page.ModalInputDialogComposer;
import ch.ethz.seb.sebserver.gui.service.page.PageContext;
import ch.ethz.seb.sebserver.gui.service.page.PageService;
import ch.ethz.seb.sebserver.gui.service.page.impl.ModalInputDialog;
import ch.ethz.seb.sebserver.gui.service.page.impl.PageAction;
import ch.ethz.seb.sebserver.gui.service.remote.download.DownloadService;
import ch.ethz.seb.sebserver.gui.service.remote.download.SEBClientConfigDownload;
import ch.ethz.seb.sebserver.gui.service.remote.webservice.api.seb.clientconfig.GetClientConfigs;

@Lazy
@Component
@GuiProfile
public class ExamCreateClientConfigPopup {

    private static final LocTextKey TITLE_KEY = new LocTextKey("sebserver.exam.form.export.config.popup.title");
    private static final LocTextKey CONFIG_NAME_KEY = new LocTextKey("sebserver.exam.form.export.config.name");
    private static final LocTextKey CONFIG_TEXT_KEY = new LocTextKey("sebserver.exam.form.export.config.popup.text");
    private static final LocTextKey NO_CONFIG_TEXT_KEY =
            new LocTextKey("sebserver.exam.form.export.config.popup.noconfig");

    private final PageService pageService;
    private final DownloadService downloadService;
    private final String downloadFileName;

    public ExamCreateClientConfigPopup(
            final PageService pageService,
            final DownloadService downloadService,
            @Value("${sebserver.gui.seb.exam.config.download.filename}") final String downloadFileName) {

        this.pageService = pageService;
        this.downloadService = downloadService;
        this.downloadFileName = downloadFileName;
    }

    public Function<PageAction, PageAction> exportFunction() {

        return action -> {

            final ModalInputDialog<FormHandle<?>> dialog =
                    new ModalInputDialog<FormHandle<?>>(
                            action.pageContext().getParent().getShell(),
                            this.pageService.getWidgetFactory())
                                    .setLargeDialogWidth();

            final CreationFormContext creationFormContext = new CreationFormContext(
                    this.pageService,
                    action.pageContext());

            final Predicate<FormHandle<?>> doCreate = formHandle -> doCreate(
                    this.pageService,
                    action.pageContext(),
                    action.getEntityKey(),
                    formHandle);

            dialog.open(
                    TITLE_KEY,
                    doCreate,
                    Utils.EMPTY_EXECUTION,
                    creationFormContext);

            return action;
        };
    }

    private boolean doCreate(
            final PageService pageService,
            final PageContext pageContext,
            final EntityKey examKey,
            final FormHandle<?> formHandle) {

        if (formHandle == null) {
            return true;
        }

        final UrlLauncher urlLauncher = RWT.getClient().getService(UrlLauncher.class);
        final String modelId = formHandle.getForm().getFieldValue(Domain.SEB_CLIENT_CONFIGURATION.ATTR_ID);
        final String downloadURL = this.downloadService.createDownloadURL(
                modelId,
                examKey.modelId,
                SEBClientConfigDownload.class,
                this.downloadFileName);
        urlLauncher.openURL(downloadURL);

        return true;
    }

    private final class CreationFormContext implements ModalInputDialogComposer<FormHandle<?>> {

        private final PageService pageService;
        private final PageContext pageContext;

        protected CreationFormContext(
                final PageService pageService,
                final PageContext pageContext) {

            this.pageService = pageService;
            this.pageContext = pageContext;
        }

        @Override
        public Supplier<FormHandle<?>> compose(final Composite parent) {

            final List<Tuple<String>> configs = this.pageService.getRestService().getBuilder(GetClientConfigs.class)
                    .withQueryParam(SEBClientConfig.FILTER_ATTR_ACTIVE, Constants.TRUE_STRING)
                    .call()
                    .getOrThrow()
                    .stream()
                    .filter(config -> config.configPurpose == ConfigPurpose.START_EXAM)
                    .map(config -> new Tuple<>(config.getModelId(), config.name))
                    .collect(Collectors.toList());

            if (configs.isEmpty()) {
                final Label text = this.pageService
                        .getWidgetFactory()
                        .labelLocalized(parent, NO_CONFIG_TEXT_KEY);
                text.setData(RWT.MARKUP_ENABLED, true);
                return null;
            } else {

                final Label text = this.pageService
                        .getWidgetFactory()
                        .labelLocalized(parent, CONFIG_TEXT_KEY);
                text.setData(RWT.MARKUP_ENABLED, true);

                final FormHandle<ConfigCreationInfo> formHandle = this.pageService.formBuilder(
                        this.pageContext.copyOf(parent))
                        .readonly(false)
                        .addField(FormBuilder.singleSelection(
                                Domain.SEB_CLIENT_CONFIGURATION.ATTR_ID,
                                CONFIG_NAME_KEY,
                                configs.get(0)._1,
                                () -> configs))

                        .build();
                return () -> formHandle;
            }
        }
    }

}
