INSERT IGNORE INTO institution VALUES
    (1, 'ETH Zürich', 'ethz', null, null, 1)
    ;

INSERT IGNORE INTO user VALUES 
    (1, 1, 'super-admin', 'super-admin', 'super-admin', '$2a$08$c2GKYEYoUVXH1Yb8GXVXVu66ltPvbZgLMcVSXRH.LgZNF/YeaYB8m', 'super-admin@nomail.nomail', 'en', 'UTC', 1)
    ;
    
INSERT IGNORE INTO user_role VALUES
    (1, 1, 'SEB_SERVER_ADMIN'),
    (2, 1, 'INSTITUTIONAL_ADMIN'),
    (3, 1, 'EXAM_ADMIN'),
    (4, 1, 'EXAM_SUPPORTER')
    ;
    
INSERT IGNORE INTO seb_client_configuration VALUES
    (1, 1, 'test', '2019-07-02 09:22:50', 'test', '20faa63098beb54053d228d078d9471a6b35bde8cf2e91a879789e721e54c6535660d8d69e4670484a87977a', null, 1)
    ;
    
INSERT IGNORE INTO lms_setup VALUES
    (1, 1, 'test', 'MOCKUP', 'http://', 'test-user', 'test-user', null, 'NONE', null, null, 1)
    ;
    
INSERT IGNORE INTO seb_client_configuration VALUES
    (1, 1, 'test', '2019-07-02 09:22:50', 'test', '98ac3c953abf5948d9d13c81cab580819ee2624c76d6d4147d4896a5b79f49956d382c08c93cb3b9ae350b32', null, 1)
    ;
    
INSERT IGNORE INTO exam VALUES
    (1, 1, 1, 'quiz1', 'super-admin', 'super-admin', 'MANAGED', null, null, 1),
    (2, 1, 1, 'quiz6', 'super-admin', 'super-admin', 'MANAGED', null, null, 1)
    ;
    
INSERT IGNORE INTO indicator VALUES
    (1, 2, 'LAST_PING', 'Ping', 'dcdcdc')
    ;
    
INSERT IGNORE INTO threshold VALUES
    (1, 1, 0.0000, '22b14c'),
    (2, 1, 2000.0000, 'ff7e00'),
    (3, 1, 5000.0000, 'ed1c24')
    ;

INSERT IGNORE INTO view VALUES
    (1, 'general', 4, 1),
    (2, 'user_interface', 12, 2),
    (3, 'browser', 12, 3),
    (4, 'down_upload', 12, 4),
    (5, 'exam', 12, 5),
    (6, 'applications', 12, 6), 
    (7, 'resources', 12, 7), 
    (8, 'network', 12, 8), 
    (9, 'security', 12, 9),
    (10, 'registry', 12, 10),
    (11, 'hooked_keys', 12, 11);
    
INSERT IGNORE INTO configuration_attribute VALUES
    (1, 'hashedAdminPassword', 'PASSWORD_FIELD', null, null, null, null, null),
    (2, 'allowQuit', 'CHECKBOX', null, null, null, null, 'true'),
    (3, 'ignoreExitKeys', 'CHECKBOX', null, null, null, null, 'false'),
    (4, 'hashedQuitPassword', 'PASSWORD_FIELD', null, null, null, null, null),
    (5, 'exitKey1', 'SINGLE_SELECTION', null, '0,1,2,3,4,5,6,7,8,9,10,11', 'ExitKeySequenceValidator', 'resourceLocTextKey=sebserver.examconfig.props.label.exitKey', '2'),
    (6, 'exitKey2', 'SINGLE_SELECTION', null, '0,1,2,3,4,5,6,7,8,9,10,11', 'ExitKeySequenceValidator', 'resourceLocTextKey=sebserver.examconfig.props.label.exitKey', '10'),
    (7, 'exitKey3', 'SINGLE_SELECTION', null, '0,1,2,3,4,5,6,7,8,9,10,11', 'ExitKeySequenceValidator', 'resourceLocTextKey=sebserver.examconfig.props.label.exitKey', '5'),
    
    (8, 'browserViewMode', 'RADIO_SELECTION', null, '0,1,2', null, null, '0'),
    (9, 'enableTouchExit', 'CHECKBOX', null, null, null, null, 'false'),
    (10, 'mainBrowserWindowWidth', 'COMBO_SELECTION', null, '50%,100%,800,1000', 'WindowsSizeValidator', null, '100%'),
    (11, 'mainBrowserWindowHeight', 'COMBO_SELECTION', null, '80%,100%,600,800', 'WindowsSizeValidator', null, '100%'),
    (12, 'mainBrowserWindowPositioning', 'SINGLE_SELECTION', null, '0,1,2', null, null, '1'),
    (13, 'enableBrowserWindowToolbar', 'CHECKBOX', null, null, null, null, 'false'),
    (14, 'hideBrowserWindowToolbar', 'CHECKBOX', null, null, null, null, 'false'),
    (15, 'showMenuBar', 'CHECKBOX', null, null, null, null, 'false'),
    (16, 'showTaskBar', 'CHECKBOX', null, null, null, null, 'true'),
    (17, 'taskBarHeight', 'COMBO_SELECTION', null, '40,60,80', 'IntegerTypeValidator', null, '40'),
    (18, 'showReloadButton', 'CHECKBOX', null, null, null, null, 'true'),
    (19, 'showTime', 'CHECKBOX', null, null, null, null, 'true'),
    (20, 'showInputLanguage', 'CHECKBOX', null, null, null, null, 'false'),
    (21, 'enableZoomPage', 'CHECKBOX', null, null, null, null, 'true'),
    (22, 'enableZoomText', 'CHECKBOX', null, null, null, null, 'true'),
    (23, 'zoomMode', 'RADIO_SELECTION', null, '0,1', null, null, '0'),
    (24, 'audioControlEnabled', 'CHECKBOX', null, null, null, null, 'false'),
    (25, 'audioMute', 'CHECKBOX', null, null, null, null, 'false'),
    (26, 'audioSetVolumeLevel', 'CHECKBOX', null, null, null, null, 'false'),
    (27, 'audioVolumeLevel', 'SLIDER', null, '0,100', null, null, '25'),
    (28, 'allowSpellCheck', 'CHECKBOX', null, null, null, null, 'false'),
    (29, 'allowDictionaryLookup', 'CHECKBOX', null, null, null, null, 'false'),
    (30, 'allowSpellCheckDictionary', 'MULTI_CHECKBOX_SELECTION', null, 'da-DK,en-AU,en-GB,en-US,es-ES,fr-FR,pt-PT,sv-SE,sv-FI', null, null, 'da-DK,en-AU,en-GB,en-US,es-ES,fr-FR,pt-PT,sv-SE,sv-FI'),
    
    (31, 'newBrowserWindowByLinkPolicy', 'RADIO_SELECTION', null, '0,1,2', null, null, '2'),
    (32, 'newBrowserWindowByLinkBlockForeign', 'CHECKBOX', null, null, null, null, 'false'),
    (33, 'newBrowserWindowByLinkWidth', 'COMBO_SELECTION', null, '50%,100%,800,1000', 'WindowsSizeValidator', null, '100%'),
    (34, 'newBrowserWindowByLinkHeight', 'COMBO_SELECTION', null, '80%,100%,600,800', 'WindowsSizeValidator', null, '100%'),
    (35, 'newBrowserWindowByLinkPositioning', 'SINGLE_SELECTION', null, '0,1,2', null, null, '2'),
    (36, 'enablePlugIns', 'CHECKBOX', null, null, null, null, 'true'),
    (37, 'enableJavaScript', 'CHECKBOX', null, null, null, null, 'true'),
    (38, 'enableJava', 'CHECKBOX', null, null, null, null, 'false'),
    (39, 'blockPopUpWindows', 'CHECKBOX', null, null, null, null, 'false'),
    (40, 'allowVideoCapture', 'CHECKBOX', null, null, null, null, 'false'),
    (41, 'allowAudioCapture', 'CHECKBOX', null, null, null, null, 'false'),
    (42, 'allowBrowsingBackForward', 'CHECKBOX', null, null, null, null, 'false'),
    (43, 'newBrowserWindowNavigation', 'CHECKBOX', null, null, null, null, 'true'),
    (44, 'browserWindowAllowReload', 'CHECKBOX', null, null, null, null, 'true'),
    (45, 'newBrowserWindowAllowReload', 'CHECKBOX', null, null, null, null, 'true'),
    (46, 'showReloadWarning', 'CHECKBOX', null, null, null, null, 'true'),
    (47, 'newBrowserWindowShowReloadWarning', 'CHECKBOX', null, null, null, null, 'false'),
    (48, 'removeBrowserProfile', 'CHECKBOX', null, null, null, null, 'false'),
    (49, 'removeLocalStorage', 'CHECKBOX', null, null, null, null, 'false'),
    (50, 'browserUserAgent', 'TEXT_FIELD', null, null, null, null, null),
    (51, 'browserUserAgentWinDesktopMode', 'RADIO_SELECTION', null, '0,1', null, null, '0'),
    (52, 'browserUserAgentWinDesktopModeCustom', 'TEXT_FIELD', null, null, null, null, null),
    (53, 'browserUserAgentWinTouchMode', 'RADIO_SELECTION', null, '0,1,2', null, null, '0'),
    (54, 'browserUserAgentWinTouchModeCustom', 'TEXT_FIELD', null, null, null, null, null),
    (55, 'browserUserAgentMac', 'RADIO_SELECTION', null, '0,1', null, null, '0'),
    (56, 'browserUserAgentMacCustom', 'TEXT_FIELD', null, null, null, null, null),
    (57, 'enableSebBrowser', 'CHECKBOX', null, null, null, null, 'true'),
    (58, 'browserWindowTitleSuffix', 'TEXT_FIELD', null, null, null, null, null),
    
    (59, 'allowDownUploads', 'CHECKBOX', null, null, null, null, 'true'),
    (60, 'downloadDirectoryWin', 'TEXT_FIELD', null, null, null, null, null),
    (61, 'downloadDirectoryOSX', 'TEXT_FIELD', null, null, null, null, null),
    (62, 'openDownloads', 'CHECKBOX', null, null, null, null, 'false'),
    (63, 'chooseFileToUploadPolicy', 'RADIO_SELECTION', null, '0,1,2', null, null, '0'),
    (64, 'downloadPDFFiles', 'CHECKBOX', null, null, null, null, 'true'),
    (65, 'allowPDFPlugIn', 'CHECKBOX', null, null, null, null, 'true'),
    (66, 'downloadAndOpenSebConfig', 'CHECKBOX', null, null, null, null, 'true'),
    
    (67, 'quitURL', 'TEXT_FIELD', null, null, null, null, null),
    (68, 'quitURLConfirm', 'CHECKBOX', null, null, null, null, 'true'),
    (69, 'restartExamUseStartURL', 'CHECKBOX', null, null, null, null, 'false'),
    (70, 'restartExamURL', 'TEXT_FIELD', null, null, null, null, null),
    (71, 'restartExamText', 'TEXT_FIELD', null, null, null, null, null),
    (72, 'restartExamPasswordProtected', 'CHECKBOX', null, null, null, null, 'true'),
    
    (73, 'permittedProcesses', 'TABLE',  null, null, null, null, null),
    (74, 'permittedProcesses.active', 'CHECKBOX', 73, null, null, null, 'true'),
    (75, 'permittedProcesses.os', 'SINGLE_SELECTION', 73, '0,1', null, null, '1'),
    (76, 'permittedProcesses.title', 'TEXT_FIELD', 73, null, null, null, ''),
    (77, 'permittedProcesses.description', 'TEXT_FIELD', 73, null, null, null, ''),
    (78, 'permittedProcesses.executable', 'TEXT_FIELD', 73, null, null, null, ''),
    (79, 'permittedProcesses.originalName', 'TEXT_FIELD', 73, null, null, null, ''),
    (80, 'permittedProcesses.allowedExecutables', 'TEXT_FIELD', 73, null, null, null, ''),
    (81, 'permittedProcesses.path', 'TEXT_FIELD', 73, null, null, null, ''),
    (82, 'permittedProcesses.arguments', 'INLINE_TABLE', 73, '1:active:CHECKBOX|4:argument:TEXT_FIELD', null, null, null),
    (85, 'permittedProcesses.identifier', 'TEXT_FIELD', 73, null, null, null, ''),
    (86, 'permittedProcesses.iconInTaskbar', 'CHECKBOX', 73, null, null, null, 'true'), 
    (87, 'permittedProcesses.autostart', 'CHECKBOX', 73, null, null, null, 'false'),
    (88, 'permittedProcesses.runInBackground', 'CHECKBOX', 73, null, null, null, 'false'),
    (89, 'permittedProcesses.allowUserToChooseApp', 'CHECKBOX', 73, null, null, null, 'false'),
    (90, 'permittedProcesses.strongKill', 'CHECKBOX', 73, null, null, null, 'false'),
    (91, 'allowSwitchToApplications', 'CHECKBOX', null, null, null, null, 'false'),
    (92, 'allowFlashFullscreen', 'CHECKBOX', null, null, null, null, 'false'),
    
    (93, 'prohibitedProcesses', 'TABLE',  null, null, null, null, null),
    (94, 'prohibitedProcesses.active', 'CHECKBOX', 93, null, null, null, 'true'),
    (95, 'prohibitedProcesses.os', 'SINGLE_SELECTION', 93, '0,1', null, null, '1'),
    (96, 'prohibitedProcesses.executable', 'TEXT_FIELD', 93, null, null, null, ''),
    (97, 'prohibitedProcesses.description', 'TEXT_FIELD', 93, null, null, null, ''),
    (98, 'prohibitedProcesses.originalName', 'TEXT_FIELD', 93, null, null, null, ''),
    (99, 'prohibitedProcesses.identifier', 'TEXT_FIELD', 93, null, null, null, ''),
    (100, 'prohibitedProcesses.strongKill', 'CHECKBOX', 93, null, null, null, 'false'),
    
    (200, 'URLFilterEnable', 'CHECKBOX', null, null, null, null, 'false'),
    (201, 'URLFilterEnableContentFilter', 'CHECKBOX', null, null, null, null, 'false'),
    (202, 'URLFilterRules', 'TABLE',  null, null, null, null, null),
    (203, 'URLFilterRules.active', 'CHECKBOX', 202, null, null, null, 'true'),
    (204, 'URLFilterRules.regex', 'CHECKBOX', 202, null, null, null, 'false'),
    (205, 'URLFilterRules.expression', 'TEXT_FIELD', 202, null, null, null, ''),
    (206, 'URLFilterRules.action', 'SINGLE_SELECTION', 202, '0,1', null, null, '0'),
    
    (210, 'proxySettingsPolicy', 'RADIO_SELECTION', null, '0,1', null, null, '0'),
    (220, 'proxies', 'COMPOSITE_TABLE', null, 'active,TABLE_ENTRY|autoDiscovery,autoConfiguration,http,https,ftp,socks,rtsp', null, null, null),
    (221, 'ExcludeSimpleHostnames', 'CHECKBOX', 220, null, null, 'showInView=true,createDefaultValue=true', 'false'),
    (222, 'ExceptionsList', 'TEXT_AREA', 220, null, null, 'showInView=true,createDefaultValue=true', null),
    (223, 'FTPPassive', 'CHECKBOX', 220, null, null, 'showInView=true,createDefaultValue=true', 'true'),
    (231, 'AutoDiscoveryEnabled', 'CHECKBOX', 220, null, null, 'groupId=autoDiscovery,createDefaultValue=true', 'false'),
    (233, 'AutoConfigurationEnabled', 'CHECKBOX', 220, null, null, 'groupId=autoConfiguration,createDefaultValue=true', 'false'),
    (234, 'AutoConfigurationURL', 'TEXT_FIELD', 220, null, null, 'groupId=autoConfiguration,createDefaultValue=true', null),
    (235, 'AutoConfigurationJavaScript', 'TEXT_AREA', 220, null, null, 'groupId=autoConfiguration,createDefaultValue=true', null),
    (236, 'HTTPEnable', 'CHECKBOX', 220, null, null, 'groupId=http,createDefaultValue=true', 'false'),
    (237, 'HTTPProxy', 'TEXT_FIELD', 220, null, null, 'groupId=http,createDefaultValue=true', null),
    (238, 'HTTPPort', 'INTEGER', 220, null, null, 'groupId=http,createDefaultValue=true', '80'),
    (239, 'HTTPRequiresPassword', 'CHECKBOX', 220, null, null, 'groupId=http,createDefaultValue=true', 'false'),
    (240, 'HTTPUsername', 'TEXT_FIELD', 220, null, null, 'groupId=http,createDefaultValue=true', null),
    (241, 'HTTPPassword', 'TEXT_FIELD', 220, null, null, 'groupId=http,createDefaultValue=true', null),
    (242, 'HTTPSEnable', 'CHECKBOX', 220, null, null, 'groupId=https,createDefaultValue=true', 'false'),
    (243, 'HTTPSProxy', 'TEXT_FIELD', 220, null, null, 'groupId=https,createDefaultValue=true', null),
    (244, 'HTTPSPort', 'INTEGER', 220, null, null, 'groupId=https,createDefaultValue=true', '443'),
    (245, 'HTTPSRequiresPassword', 'CHECKBOX', 220, null, null, 'groupId=https,createDefaultValue=true', 'false'),
    (246, 'HTTPSUsername', 'TEXT_FIELD', 220, null, null, 'groupId=https,createDefaultValue=true', null),
    (247, 'HTTPSPassword', 'TEXT_FIELD', 220, null, null, 'groupId=https,createDefaultValue=true', null),
    (248, 'FTPEnable', 'CHECKBOX', 220, null, null, 'groupId=ftp,createDefaultValue=true', 'false'),
    (249, 'FTPProxy', 'TEXT_FIELD', 220, null, null, 'groupId=ftp,createDefaultValue=true', null),
    (250, 'FTPPort', 'INTEGER', 220, null, null, 'groupId=ftp,createDefaultValue=true', '21'),
    (251, 'FTPRequiresPassword', 'CHECKBOX', 220, null, null, 'groupId=ftp,createDefaultValue=true', 'false'),
    (252, 'FTPUsername', 'TEXT_FIELD', 220, null, null, 'groupId=ftp,createDefaultValue=true', null),
    (253, 'FTPPassword', 'TEXT_FIELD', 220, null, null, 'groupId=ftp,createDefaultValue=true', null),
    (254, 'SOCKSEnable', 'CHECKBOX', 220, null, null, 'groupId=socks,createDefaultValue=true', 'false'),
    (255, 'SOCKSProxy', 'TEXT_FIELD', 220, null, null, 'groupId=socks,createDefaultValue=true', null),
    (256, 'SOCKSPort', 'INTEGER', 220, null, null, 'groupId=socks,createDefaultValue=true', '1080'),
    (257, 'SOCKSRequiresPassword', 'CHECKBOX', 220, null, null, 'groupId=socks,createDefaultValue=true', 'false'),
    (258, 'SOCKSUsername', 'TEXT_FIELD', 220, null, null, 'groupId=socks,createDefaultValue=true', null),
    (259, 'SOCKSPassword', 'TEXT_FIELD', 220, null, null, 'groupId=socks,createDefaultValue=true', null),
    (260, 'RTSPEnable', 'CHECKBOX', 220, null, null, 'groupId=rtsp,createDefaultValue=true', 'false'),
    (261, 'RTSPProxy', 'TEXT_FIELD', 220, null, null, 'groupId=rtsp,createDefaultValue=true', null),
    (262, 'RTSPPort', 'INTEGER', 220, null, null, 'groupId=rtsp,createDefaultValue=true', '554'),
    (263, 'RTSPRequiresPassword', 'CHECKBOX', 220, null, null, 'groupId=rtsp,createDefaultValue=true', 'false'),
    (264, 'RTSPUsername', 'TEXT_FIELD', 220, null, null, 'groupId=rtsp,createDefaultValue=true', null),
    (265, 'RTSPPassword', 'TEXT_FIELD', 220, null, null, 'groupId=rtsp,createDefaultValue=true', null),
    
        
    (300, 'sebServicePolicy', 'RADIO_SELECTION', null, '0,1,2', null, null, '2'),
    (301, 'kioskMode', 'RADIO_SELECTION', null, '0,1,2', null, null, '0'),
    (302, 'allowVirtualMachine', 'CHECKBOX', null, null, null, null, 'false'),
    (303, 'allowScreenSharing', 'CHECKBOX', null, null, null, null, 'false'),
    (304, 'enablePrivateClipboard', 'CHECKBOX', null, null, null, null, 'true'),
    (305, 'enableLogging', 'CHECKBOX', null, null, null, null, 'false'),
    (306, 'logDirectoryWin', 'TEXT_FIELD', null, null, null, null, ''),
    (307, 'logDirectoryOSX', 'TEXT_FIELD', null, null, null, null, 'NSTemporaryDirectory'),
    (308, 'minMacOSVersion', 'SINGLE_SELECTION', null, '0,1,2,3,4,5,6,7', null, null, '0'),
    (309, 'enableAppSwitcherCheck', 'CHECKBOX', null, null, null, null, 'true'),
    (310, 'forceAppFolderInstall', 'CHECKBOX', null, null, null, null, 'true'),
    (311, 'allowUserAppFolderInstall', 'CHECKBOX', null, null, null, null, 'false'),
    (312, 'allowSiri', 'CHECKBOX', null, null, null, null, 'false'),
    (313, 'detectStoppedProcess', 'CHECKBOX', null, null, null, null, 'true'),
    (314, 'allowDisplayMirroring', 'CHECKBOX', null, null, null, null, 'false'),
    (315, 'allowedDisplaysMaxNumber', 'COMBO_SELECTION', null, '1,2,3', null, null, '1'),
    (316, 'allowedDisplayBuiltin', 'CHECKBOX', null, null, null, null, 'true'),
    (317, 'logLevel', 'SINGLE_SELECTION', null, '0,1,2,3,4', null, null, '1'),
    
    (400, 'insideSebEnableSwitchUser', 'CHECKBOX', null, null, null, null, 'false'),
    (401, 'insideSebEnableLockThisComputer', 'CHECKBOX', null, null, null, null, 'false'),
    (402, 'insideSebEnableChangeAPassword', 'CHECKBOX', null, null, null, null, 'false'),
    (403, 'insideSebEnableStartTaskManager', 'CHECKBOX', null, null, null, null, 'false'),
    (404, 'insideSebEnableLogOff', 'CHECKBOX', null, null, null, null, 'false'),
    (405, 'insideSebEnableShutDown', 'CHECKBOX', null, null, null, null, 'false'),
    (406, 'insideSebEnableEaseOfAccess', 'CHECKBOX', null, null, null, null, 'false'),
    (407, 'insideSebEnableVmWareClientShade', 'CHECKBOX', null, null, null, null, 'false'),
    (408, 'insideSebEnableNetworkConnectionSelector', 'CHECKBOX', null, null, null, null, 'false'),
    
    (500, 'enableEsc', 'CHECKBOX', null, null, null, null, 'false'),
    (501, 'enablePrintScreen', 'CHECKBOX', null, null, null, null, 'false'),
    (502, 'enableCtrlEsc', 'CHECKBOX', null, null, null, null, 'false'),
    (503, 'enableAltEsc', 'CHECKBOX', null, null, null, null, 'false'),
    (504, 'enableAltTab', 'CHECKBOX', null, null, null, null, 'true'),
    (505, 'enableAltF4', 'CHECKBOX', null, null, null, null, 'false'),
    (506, 'enableStartMenu', 'CHECKBOX', null, null, null, null, 'false'),
    (507, 'enableRightMouse', 'CHECKBOX', null, null, null, null, 'false'),
    (508, 'enableAltMouseWheel', 'CHECKBOX', null, null, null, null, 'false'),
    
    (509, 'enableF1', 'CHECKBOX', null, null, null, null, 'false'),
    (510, 'enableF2', 'CHECKBOX', null, null, null, null, 'false'),
    (511, 'enableF3', 'CHECKBOX', null, null, null, null, 'false'),
    (512, 'enableF4', 'CHECKBOX', null, null, null, null, 'false'),
    (513, 'enableF5', 'CHECKBOX', null, null, null, null, 'false'),
    (514, 'enableF6', 'CHECKBOX', null, null, null, null, 'false'),
    (515, 'enableF7', 'CHECKBOX', null, null, null, null, 'false'),
    (516, 'enableF8', 'CHECKBOX', null, null, null, null, 'false'),
    (517, 'enableF9', 'CHECKBOX', null, null, null, null, 'false'),
    (518, 'enableF10', 'CHECKBOX', null, null, null, null, 'false'),
    (519, 'enableF11', 'CHECKBOX', null, null, null, null, 'false'),
    (520, 'enableF12', 'CHECKBOX', null, null, null, null, 'false'),
    
    (1000, 'originatorVersion', 'TEXT_FIELD', null, null, null, null, 'SEB_Server_0.3.0'),
    (1001, 'sebConfigPurpose', 'RADIO_SELECTION', null, '0,1', null, null, '0')

    ;
INSERT IGNORE INTO orientation VALUES 
    (1, 1, 0, 1, null, 1, 1, 1, 2, 'LEFT'),
    (2, 2, 0, 1, null, 1, 3, 1, 1, 'LEFT'),
    (3, 3, 0, 1, null, 1, 4, 1, 1, 'LEFT'),
    (4, 4, 0, 1, null, 1, 5, 1, 2, 'LEFT'),
    (5, 5, 0, 1, 'exitSequence', 2, 1, 1, 1, 'NONE'),
    (6, 6, 0, 1, 'exitSequence', 2, 2, 1, 1, 'NONE'),
    (7, 7, 0, 1, 'exitSequence', 2, 3, 1, 1, 'NONE'),

    (8, 8, 0, 2, 'browserViewMode', 0, 0, 3, 3, 'NONE'),
    (9, 9, 0, 2, 'browserViewMode', 3, 2, 4, 1, 'NONE'),
    (10, 10, 0, 2, 'winsize', 1, 4, 2, 1, 'LEFT'),
    (11, 11, 0, 2, 'winsize', 1, 5, 2, 1, 'LEFT'),
    (12, 12, 0, 2, 'winsize', 5, 4, 2, 1, 'LEFT_SPAN'),
    (13, 13, 0, 2, 'wintoolbar', 0, 6, 3, 1, 'NONE'),
    (14, 14, 0, 2, 'wintoolbar', 3, 6, 4, 1, 'NONE'),
    (15, 15, 0, 2, 'wintoolbar', 0, 7, 3, 1, 'NONE'),
    (16, 16, 0, 2, 'taskbar', 0, 9, 3, 1, 'NONE'),
    (17, 17, 0, 2, 'taskbar', 5, 9, 2, 1, 'LEFT_SPAN'),
    (18, 18, 0, 2, 'taskbar', 0, 10, 3, 1, 'NONE'),
    (19, 19, 0, 2, 'taskbar', 0, 11, 3, 1, 'NONE'),
    (20, 20, 0, 2, 'taskbar', 0, 12, 3, 1, 'NONE'),
    (21, 21, 0, 2, 'zoom', 0, 14, 3, 1, 'NONE'),
    (22, 22, 0, 2, 'zoom', 0, 15, 3, 1, 'NONE'),
    (23, 23, 0, 2, 'zoomMode', 3, 14, 4, 1, 'NONE'),
    (24, 24, 0, 2, 'audio', 7, 0, 5, 1, 'NONE'),
    (25, 25, 0, 2, 'audio', 7, 1, 5, 1, 'NONE'),
    (26, 26, 0, 2, 'audio', 7, 2, 5, 1, 'NONE'),
    (27, 27, 0, 2, 'audio', 7, 3, 5, 1, 'NONE'),
    (28, 28, 0, 2, 'spellcheck', 7, 4, 5, 1, 'NONE'),
    (29, 29, 0, 2, 'spellcheck', 7, 5, 5, 1, 'NONE'),
    (30, 30, 0, 2, 'spellcheck', 7, 7, 5, 9, 'TOP'),
    
    (31, 31, 0, 3, 'newBrowserWindow', 0, 0, 3, 3, 'NONE'),
    (32, 32, 0, 3, 'newBrowserWindow', 4, 0, 3, 1, 'NONE'),
    (33, 33, 0, 3, 'newwinsize', 1, 4, 2, 1, 'LEFT'),
    (34, 34, 0, 3, 'newwinsize', 1, 5, 2, 1, 'LEFT'),
    (35, 35, 0, 3, 'newwinsize', 5, 4, 2, 1, 'LEFT_SPAN'),
    (36, 36, 0, 3, 'browserSecurity', 0, 5, 4, 1, 'NONE'),
    (37, 37, 0, 3, 'browserSecurity', 4, 5, 3, 1, 'NONE'),
    (38, 38, 0, 3, 'browserSecurity', 0, 6, 4, 1, 'NONE'),
    (39, 39, 0, 3, 'browserSecurity', 4, 6, 3, 1, 'NONE'),
    (40, 40, 0, 3, 'browserSecurity', 0, 7, 4, 1, 'NONE'),
    (41, 41, 0, 3, 'browserSecurity', 4, 7, 3, 1, 'NONE'),
    (42, 42, 0, 3, 'browserSecurity', 0, 8, 4, 1, 'NONE'),
    (43, 43, 0, 3, 'browserSecurity', 4, 8, 3, 1, 'NONE'),
    (44, 44, 0, 3, 'browserSecurity', 0, 9, 4, 1, 'NONE'),
    (45, 45, 0, 3, 'browserSecurity', 4, 9, 3, 1, 'NONE'),
    (46, 46, 0, 3, 'browserSecurity', 0, 10, 4, 1, 'NONE'),
    (47, 47, 0, 3, 'browserSecurity', 4, 10, 3, 1, 'NONE'),
    (48, 48, 0, 3, 'browserSecurity', 0, 11, 4, 1, 'NONE'),
    (49, 49, 0, 3, 'browserSecurity', 4, 11, 3, 1, 'NONE'),
     
    (50, 50, 0, 3, null, 7, 1, 5, 1, 'TOP'),
    (51, 51, 0, 3, 'userAgentDesktop', 7, 2, 5, 2, 'NONE'),
    (52, 52, 0, 3, 'userAgentDesktop', 7, 3, 5, 1, 'NONE'),
    (53, 53, 0, 3, 'userAgentTouch', 7, 4, 5, 3, 'NONE'),
    (54, 54, 0, 3, 'userAgentTouch', 7, 8, 5, 1, 'NONE'),
    (55, 55, 0, 3, 'userAgentMac', 7, 9, 5, 2, 'NONE'),
    (56, 56, 0, 3, 'userAgentMac', 7, 11, 5, 1, 'NONE'),
    (57, 57, 0, 3, null, 0, 14, 6, 1, 'NONE'),
    (58, 58, 0, 3, null, 7, 14, 5, 1, 'TOP'),
    
    (59, 59, 0, 4, null, 0, 0, 8, 1, 'NONE'),
    (60, 60, 0, 4, null, 3, 1, 5, 1, 'LEFT_SPAN'),
    (61, 61, 0, 4, null, 3, 2, 5, 1, 'LEFT_SPAN'),
    (62, 62, 0, 4, null, 0, 3, 8, 1, 'NONE'),
    (63, 63, 0, 4, null, 0, 5, 8, 2, 'TOP'),
    (64, 64, 0, 4, null, 0, 8, 8, 1, 'NONE'),
    (65, 65, 0, 4, null, 0, 9, 8, 1, 'NONE'),
    (66, 66, 0, 4, null, 0, 10, 8, 1, 'NONE'),
    
    (67, 67, 0, 5, 'quitLink', 0, 1, 8, 1, 'TOP'),
    (68, 68, 0, 5, 'quitLink', 0, 2, 8, 1, 'NONE'),    
    (69, 69, 0, 5, 'backToStart', 0, 4, 8, 1, 'NONE'),
    (70, 70, 0, 5, 'backToStart', 0, 6, 8, 2, 'TOP'),
    (71, 71, 0, 5, 'backToStart', 0, 8, 8, 2, 'TOP'),
    (72, 72, 0, 5, 'backToStart', 0, 10, 8, 1, 'NONE'),
    
    (73, 73, 0, 6, null, 0, 2, 10, 6, 'TOP'),
    (74, 74, 0, 6, null, 1, 1, 1, 1, 'LEFT'), 
    (75, 75, 0, 6, null, 2, 2, 1, 1, 'LEFT'),
    (76, 76, 0, 6, null, 4, 4, 2, 1, 'LEFT'),
    (77, 77, 0, 6, null, 0, 3, 1, 1, 'LEFT'),
    (78, 78, 0, 6, null, 3, 4, 4, 1, 'LEFT'),
    (79, 79, 0, 6, null, 0, 5, 1, 1, 'LEFT'),
    (80, 80, 0, 6, null, 0, 6, 1, 1, 'LEFT'),
    (81, 81, 0, 6, null, 0, 7, 1, 1, 'LEFT'),
    
    (82, 82, 0, 6, null, 0, 8, 1, 3, 'LEFT'),

    (85, 85, 0, 6, null, 0, 8, 1, 1, 'LEFT'),
    (86, 86, 0, 6, null, 0, 7, 1, 1, 'LEFT'),
    (87, 87, 0, 6, null, 0, 9, 1, 1, 'LEFT'),
    (88, 88, 0, 6, null, 0, 10, 1, 1, 'LEFT'),
    (89, 89, 0, 6, null, 0, 11, 1, 1, 'LEFT'),
    (90, 90, 0, 6, null, 0, 12, 1, 1, 'LEFT'),
    (91, 91, 0, 6, null, 0, 0, 5, 1, 'NONE'),
    (92, 92, 0, 6, null, 5, 0, 5, 1, 'NONE'),
    (93, 93, 0, 6, null, 0, 10, 10, 6, 'TOP'),
    (94, 94, 0, 6, null, 1, 1, 1, 1, 'LEFT'), 
    (95, 95, 0, 6, null, 2, 2, 1, 1, 'LEFT'),
    (96, 96, 0, 6, null, 3, 3, 4, 1, 'LEFT'), 
    (97, 97, 0, 6, null, 4, 5, 2, 1, 'LEFT'),
    (98, 98, 0, 6, null, 0, 4, 1, 1, 'LEFT'),
    (99, 99, 0, 6, null, 0, 6, 1, 1, 'LEFT'),
    (100, 100, 0, 6, null, 0, 7, 1, 1, 'LEFT'),
    
    (200, 200, 0, 8, 'urlFilter', 0, 0, 3, 1, 'NONE'),
    (201, 201, 0, 8, 'urlFilter', 3, 0, 4, 1, 'NONE'),
    (202, 202, 0, 8, 'urlFilter', 0, 1, 12, 6, 'NONE'),
    (203, 203, 0, 8, 'urlFilter', 1, 1, 1, 1, 'LEFT'),
    (204, 204, 0, 8, 'urlFilter', 2, 2, 1, 1, 'LEFT'),
    (205, 205, 0, 8, 'urlFilter', 3, 3, 4, 1, 'LEFT'),
    (206, 206, 0, 8, 'urlFilter', 4, 4, 2, 1, 'LEFT'),
    
    (210, 210, 0, 8, 'proxies', 0, 6, 5, 2, 'NONE'),
    (220, 220, 0, 8, 'proxies', 7, 7, 5, 7, 'TOP'),
    (221, 221, 0, 8, 'proxies', 0, 8, 6, 1, 'NONE'),
    (222, 222, 0, 8, 'proxies', 0, 10, 6, 2, 'TOP'),
    (223, 223, 0, 8, 'proxies', 0, 11, 6, 1, 'NONE'),
    
    (231, 231, 0, 8, 'active', 0, 0, 1, 1, 'LEFT'),
    
    (233, 233, 0, 8, 'active', 0, 0, 1, 1, 'LEFT'),
    (234, 234, 0, 8, null, 0, 1, 1, 1, 'LEFT'),
    (235, 235, 0, 8, null, 0, 2, 1, 1, 'LEFT'),
    (236, 236, 0, 8, 'active', 0, 0, 1, 1, 'LEFT'),
    (237, 237, 0, 8, null, 0, 1, 1, 1, 'LEFT'),
    (238, 238, 0, 8, null, 0, 2, 1, 1, 'LEFT'),
    (239, 239, 0, 8, null, 0, 3, 1, 1, 'LEFT'),
    (240, 240, 0, 8, null, 0, 4, 1, 1, 'LEFT'),
    (241, 241, 0, 8, null, 0, 5, 1, 1, 'LEFT'),
    (242, 242, 0, 8, 'active', 0, 0, 1, 1, 'LEFT'),
    (243, 243, 0, 8, null, 0, 1, 1, 1, 'LEFT'),
    (244, 244, 0, 8, null, 0, 2, 1, 1, 'LEFT'),
    (245, 245, 0, 8, null, 0, 3, 1, 1, 'LEFT'),
    (246, 246, 0, 8, null, 0, 4, 1, 1, 'LEFT'),
    (247, 247, 0, 8, null, 0, 5, 1, 1, 'LEFT'),
    (248, 248, 0, 8, 'active', 0, 0, 1, 1, 'LEFT'),
    (249, 249, 0, 8, null, 0, 1, 1, 1, 'LEFT'),
    (250, 250, 0, 8, null, 0, 2, 1, 1, 'LEFT'),
    (251, 251, 0, 8, null, 0, 3, 1, 1, 'LEFT'),
    (252, 252, 0, 8, null, 0, 4, 1, 1, 'LEFT'),
    (253, 253, 0, 8, null, 0, 5, 1, 1, 'LEFT'),
    (254, 254, 0, 8, 'active', 0, 0, 1, 1, 'LEFT'),
    (255, 255, 0, 8, null, 0, 1, 1, 1, 'LEFT'),
    (256, 256, 0, 8, null, 0, 2, 1, 1, 'LEFT'),
    (257, 257, 0, 8, null, 0, 3, 1, 1, 'LEFT'),
    (258, 258, 0, 8, null, 0, 4, 1, 1, 'LEFT'),
    (259, 259, 0, 8, null, 0, 5, 1, 1, 'LEFT'),
    (260, 260, 0, 8, 'active', 0, 0, 1, 1, 'LEFT'),
    (261, 261, 0, 8, null, 0, 1, 1, 1, 'LEFT'),
    (262, 262, 0, 8, null, 0, 2, 1, 1, 'LEFT'),
    (263, 263, 0, 8, null, 0, 3, 1, 1, 'LEFT'),
    (264, 264, 0, 8, null, 0, 4, 1, 1, 'LEFT'),
    (265, 265, 0, 8, null, 0, 5, 1, 1, 'LEFT'),
    
        
    (300, 300, 0, 9, 'servicePolicy', 0, 0, 4, 3, 'NONE'),
    (301, 301, 0, 9, 'kioskMode', 4, 0, 3, 3, 'NONE'),
    (302, 302, 0, 9, null, 0, 5, 4, 1, 'NONE'),
    (303, 303, 0, 9, null, 0, 6, 4, 1, 'NONE'),
    (304, 304, 0, 9, null, 4, 5, 3, 1, 'NONE'),
    (305, 305, 0, 9, 'logging', 0, 8, 6, 1, 'NONE'),
    (306, 306, 0, 9, 'logging', 3, 9, 4, 1, 'LEFT_SPAN'),
    (307, 307, 0, 9, 'logging', 3, 10, 4, 1, 'LEFT_SPAN'),
    (308, 308, 0, 9, 'macSettings', 7, 1, 5, 1, 'TOP'),
    (309, 309, 0, 9, 'macSettings', 7, 2, 5, 1, 'NONE'),
    (310, 310, 0, 9, 'macSettings', 7, 3, 5, 1, 'NONE'),
    (311, 311, 0, 9, 'macSettings', 7, 4, 5, 1, 'NONE'),
    (312, 312, 0, 9, 'macSettings', 7, 5, 5, 1, 'NONE'),
    (313, 313, 0, 9, 'macSettings', 7, 6, 5, 1, 'NONE'),
    (314, 314, 0, 9, 'macSettings', 7, 7, 5, 1, 'NONE'),
    (315, 315, 0, 9, 'macSettings', 7, 9, 5, 1, 'TOP'),
    (316, 316, 0, 9, 'macSettings', 7, 10, 5, 1, 'NONE'),
    (317, 317, 0, 9, 'logging', 3, 11, 4, 1, 'LEFT_SPAN'),
    
    (400, 400, 0, 10, 'registry', 0, 1, 4, 1, 'NONE'),
    (401, 401, 0, 10, 'registry', 0, 2, 4, 1, 'NONE'),
    (402, 402, 0, 10, 'registry', 0, 3, 4, 1, 'NONE'),
    (403, 403, 0, 10, 'registry', 0, 4, 4, 1, 'NONE'),
    (404, 404, 0, 10, 'registry', 0, 5, 4, 1, 'NONE'),
    (405, 405, 0, 10, 'registry', 0, 6, 4, 1, 'NONE'),
    (406, 406, 0, 10, 'registry', 0, 7, 4, 1, 'NONE'),
    (407, 407, 0, 10, 'registry', 0, 8, 4, 1, 'NONE'),
    (408, 408, 0, 10, 'registry', 0, 9, 4, 1, 'NONE'),
    
    (500, 500, 0, 11, 'specialKeys', 0, 1, 3, 1, 'NONE'),
    (501, 501, 0, 11, 'specialKeys', 0, 2, 3, 1, 'NONE'),
    (502, 502, 0, 11, 'specialKeys', 0, 3, 3, 1, 'NONE'),
    (503, 503, 0, 11, 'specialKeys', 0, 4, 3, 1, 'NONE'),
    (504, 504, 0, 11, 'specialKeys', 0, 5, 3, 1, 'NONE'),
    (505, 505, 0, 11, 'specialKeys', 0, 6, 3, 1, 'NONE'),
    (506, 506, 0, 11, 'specialKeys', 0, 7, 3, 1, 'NONE'),
    (507, 507, 0, 11, 'specialKeys', 0, 8, 3, 1, 'NONE'),
    (508, 508, 0, 11, 'specialKeys', 0, 9, 3, 1, 'NONE'),
    
    (509, 509, 0, 11, 'functionKeys', 3, 1, 3, 1, 'NONE'),
    (510, 510, 0, 11, 'functionKeys', 3, 2, 3, 1, 'NONE'),
    (511, 511, 0, 11, 'functionKeys', 3, 3, 3, 1, 'NONE'),
    (512, 512, 0, 11, 'functionKeys', 3, 4, 3, 1, 'NONE'),
    (513, 513, 0, 11, 'functionKeys', 3, 5, 3, 1, 'NONE'),
    (514, 514, 0, 11, 'functionKeys', 3, 6, 3, 1, 'NONE'),
    (515, 515, 0, 11, 'functionKeys', 3, 7, 3, 1, 'NONE'),
    (516, 516, 0, 11, 'functionKeys', 3, 8, 3, 1, 'NONE'),
    (517, 517, 0, 11, 'functionKeys', 3, 9, 3, 1, 'NONE'),
    (518, 518, 0, 11, 'functionKeys', 3, 10, 3, 1, 'NONE'),
    (519, 519, 0, 11, 'functionKeys', 3, 11, 3, 1, 'NONE'),
    (520, 520, 0, 11, 'functionKeys', 3, 12, 3, 1, 'NONE')
    
    ;
    
    
    
    
    
    
INSERT IGNORE INTO configuration_node VALUES 
    (1, 1, 0, 'super-admin', 'test', null, 'EXAM_CONFIG', 'READY_TO_USE')
    ;
    
INSERT IGNORE INTO configuration VALUES 
    (1, 1, 1, 'v0', '2019-07-02 12:59:32', 0), 
    (2, 1, 1, null, null, 1)
    ;
    
INSERT IGNORE INTO configuration_value VALUES 
    (1,1,1,1,0,NULL),
    (2,1,1,2,0,'true'),
    (3,1,1,3,0,'false'),
    (4,1,1,4,0,NULL),
    (5,1,1,5,0,'2'),
    (6,1,1,6,0,'10'),
    (7,1,1,7,0,'5'),
    (8,1,1,8,0,'0'),
    (9,1,1,9,0,'false'),
    (10,1,1,10,0,'100%'),
    (11,1,1,11,0,'100%'),
    (12,1,1,12,0,'1'),
    (13,1,1,13,0,'false'),
    (14,1,1,14,0,'false'),
    (15,1,1,15,0,'false'),
    (16,1,1,16,0,'true'),
    (17,1,1,17,0,'40'),
    (18,1,1,18,0,'true'),
    (19,1,1,19,0,'true'),
    (20,1,1,20,0,'false'),
    (21,1,1,21,0,'true'),
    (22,1,1,22,0,'true'),
    (23,1,1,23,0,'0'),
    (24,1,1,24,0,'false'),
    (25,1,1,25,0,'false'),
    (26,1,1,26,0,'false'),
    (27,1,1,27,0,'25'),
    (28,1,1,28,0,'false'),
    (29,1,1,29,0,'false'),
    (30,1,1,30,0,'da-DK,en-AU,en-GB,en-US,es-ES,fr-FR,pt-PT,sv-SE,sv-FI'),
    (31,1,1,31,0,'2'),
    (32,1,1,32,0,'false'),
    (33,1,1,33,0,'100%'),
    (34,1,1,34,0,'100%'),
    (35,1,1,35,0,'2'),
    (36,1,1,36,0,'true'),
    (37,1,1,37,0,'true'),
    (38,1,1,38,0,'false'),
    (39,1,1,39,0,'false'),
    (40,1,1,40,0,'false'),
    (41,1,1,41,0,'false'),
    (42,1,1,42,0,'false'),
    (43,1,1,43,0,'true'),
    (44,1,1,44,0,'true'),
    (45,1,1,45,0,'true'),
    (46,1,1,46,0,'true'),
    (47,1,1,47,0,'false'),
    (48,1,1,48,0,'false'),
    (49,1,1,49,0,'false'),
    (50,1,1,50,0,NULL),
    (51,1,1,51,0,'0'),
    (52,1,1,52,0,NULL),
    (53,1,1,53,0,'0'),
    (54,1,1,54,0,NULL),
    (55,1,1,55,0,'0'),
    (56,1,1,56,0,NULL),
    (57,1,1,57,0,'true'),
    (58,1,1,58,0,NULL),
    (59,1,1,59,0,'true'),
    (60,1,1,60,0,NULL),
    (61,1,1,61,0,NULL),
    (62,1,1,62,0,'false'),
    (63,1,1,63,0,'0'),
    (64,1,1,64,0,'true'),
    (65,1,1,65,0,'true'),
    (66,1,1,66,0,'true'),
    (67,1,1,67,0,NULL),
    (68,1,1,68,0,'true'),
    (69,1,1,69,0,'false'),
    (70,1,1,70,0,NULL),
    (71,1,1,71,0,NULL),
    (72,1,1,72,0,'true'),
    (73,1,1,73,0,NULL),
    (74,1,1,91,0,'false'),
    (75,1,1,92,0,'false'),
    (76,1,1,93,0,NULL),
    (77,1,1,200,0,'false'),
    (78,1,1,201,0,'false'),
    (79,1,1,202,0,NULL),
    (80,1,1,210,0,'0'),
    (81,1,1,220,0,NULL),
    (82,1,1,221,0,'false'),
    (83,1,1,222,0,NULL),
    (84,1,1,223,0,'true'),
    (85,1,1,231,0,'false'),
    (86,1,1,233,0,'false'),
    (87,1,1,234,0,NULL),
    (88,1,1,235,0,NULL),
    (89,1,1,236,0,'false'),
    (90,1,1,237,0,NULL),
    (91,1,1,238,0,'80'),
    (92,1,1,239,0,'false'),
    (93,1,1,240,0,NULL),
    (94,1,1,241,0,NULL),
    (95,1,1,242,0,'false'),
    (96,1,1,243,0,NULL),
    (97,1,1,244,0,'443'),
    (98,1,1,245,0,'false'),
    (99,1,1,246,0,NULL),
    (100,1,1,247,0,NULL),
    (101,1,1,248,0,'false'),
    (102,1,1,249,0,NULL),
    (103,1,1,250,0,'21'),
    (104,1,1,251,0,'false'),
    (105,1,1,252,0,NULL),
    (106,1,1,253,0,NULL),
    (107,1,1,254,0,'false'),
    (108,1,1,255,0,NULL),
    (109,1,1,256,0,'1080'),
    (110,1,1,257,0,'false'),
    (111,1,1,258,0,NULL),
    (112,1,1,259,0,NULL),
    (113,1,1,260,0,'false'),
    (114,1,1,261,0,NULL),
    (115,1,1,262,0,'1080'),
    (116,1,1,263,0,'false'),
    (117,1,1,264,0,NULL),
    (118,1,1,265,0,NULL),
    (119,1,1,300,0,'2'),
    (120,1,1,301,0,'0'),
    (121,1,1,302,0,'false'),
    (122,1,1,303,0,'false'),
    (123,1,1,304,0,'true'),
    (124,1,1,305,0,'false'),
    (125,1,1,306,0,''),
    (126,1,1,307,0,'~/Documents'),
    (127,1,1,308,0,'0'),
    (128,1,1,309,0,'true'),
    (129,1,1,310,0,'true'),
    (130,1,1,311,0,'false'),
    (131,1,1,312,0,'false'),
    (132,1,1,313,0,'true'),
    (133,1,1,314,0,'false'),
    (134,1,1,315,0,'1'),
    (135,1,1,316,0,'true'),
    (136,1,1,400,0,'false'),
    (137,1,1,401,0,'false'),
    (138,1,1,402,0,'false'),
    (139,1,1,403,0,'false'),
    (140,1,1,404,0,'false'),
    (141,1,1,405,0,'false'),
    (142,1,1,406,0,'false'),
    (143,1,1,407,0,'false'),
    (144,1,1,408,0,'false'),
    (145,1,1,500,0,'false'),
    (146,1,1,501,0,'false'),
    (147,1,1,502,0,'false'),
    (148,1,1,503,0,'false'),
    (149,1,1,504,0,'true'),
    (150,1,1,505,0,'false'),
    (151,1,1,506,0,'false'),
    (152,1,1,507,0,'false'),
    (153,1,1,508,0,'false'),
    (154,1,1,509,0,'false'),
    (155,1,1,510,0,'false'),
    (156,1,1,511,0,'false'),
    (157,1,1,512,0,'false'),
    (158,1,1,513,0,'false'),
    (159,1,1,514,0,'false'),
    (160,1,1,515,0,'false'),
    (161,1,1,516,0,'false'),
    (162,1,1,517,0,'false'),
    (163,1,1,518,0,'false'),
    (164,1,1,519,0,'false'),
    (165,1,1,520,0,'false'),
    (166,1,1,1000,0,'SEB_Server_0.3.0'),
    (167,1,1,1001,0,'0'),
    (168,1,2,1,0,NULL),
    (169,1,2,2,0,'true'),
    (170,1,2,3,0,'false'),
    (171,1,2,4,0,NULL),
    (172,1,2,5,0,'2'),
    (173,1,2,6,0,'10'),
    (174,1,2,7,0,'5'),
    (175,1,2,8,0,'0'),
    (176,1,2,9,0,'false'),
    (177,1,2,10,0,'100%'),
    (178,1,2,11,0,'100%'),
    (179,1,2,12,0,'1'),
    (180,1,2,13,0,'false'),
    (181,1,2,14,0,'false'),
    (182,1,2,15,0,'false'),
    (183,1,2,16,0,'true'),
    (184,1,2,17,0,'40'),
    (185,1,2,18,0,'true'),
    (186,1,2,19,0,'true'),
    (187,1,2,20,0,'false'),
    (188,1,2,21,0,'true'),
    (189,1,2,22,0,'true'),
    (190,1,2,23,0,'0'),
    (191,1,2,24,0,'false'),
    (192,1,2,25,0,'false'),
    (193,1,2,26,0,'false'),
    (194,1,2,27,0,'25'),
    (195,1,2,28,0,'false'),
    (196,1,2,29,0,'false'),
    (197,1,2,30,0,'da-DK,en-AU,en-GB,en-US,es-ES,fr-FR,pt-PT,sv-SE,sv-FI'),
    (198,1,2,31,0,'2'),
    (199,1,2,32,0,'false'),
    (200,1,2,33,0,'100%'),
    (201,1,2,34,0,'100%'),
    (202,1,2,35,0,'2'),
    (203,1,2,36,0,'true'),
    (204,1,2,37,0,'true'),
    (205,1,2,38,0,'false'),
    (206,1,2,39,0,'false'),
    (207,1,2,40,0,'false'),
    (208,1,2,41,0,'false'),
    (209,1,2,42,0,'false'),
    (210,1,2,43,0,'true'),
    (211,1,2,44,0,'true'),
    (212,1,2,45,0,'true'),
    (213,1,2,46,0,'true'),
    (214,1,2,47,0,'false'),
    (215,1,2,48,0,'false'),
    (216,1,2,49,0,'false'),
    (217,1,2,50,0,NULL),
    (218,1,2,51,0,'0'),
    (219,1,2,52,0,NULL),
    (220,1,2,53,0,'0'),
    (221,1,2,54,0,NULL),
    (222,1,2,55,0,'0'),
    (223,1,2,56,0,NULL),
    (224,1,2,57,0,'true'),
    (225,1,2,58,0,NULL),
    (226,1,2,59,0,'true'),
    (227,1,2,60,0,NULL),
    (228,1,2,61,0,NULL),
    (229,1,2,62,0,'false'),
    (230,1,2,63,0,'0'),
    (231,1,2,64,0,'true'),
    (232,1,2,65,0,'true'),
    (233,1,2,66,0,'true'),
    (234,1,2,67,0,NULL),
    (235,1,2,68,0,'true'),
    (236,1,2,69,0,'false'),
    (237,1,2,70,0,NULL),
    (238,1,2,71,0,NULL),
    (239,1,2,72,0,'true'),
    (240,1,2,73,0,NULL),
    (241,1,2,91,0,'false'),
    (242,1,2,92,0,'false'),
    (243,1,2,93,0,NULL),
    (244,1,2,200,0,'false'),
    (245,1,2,201,0,'false'),
    (246,1,2,202,0,NULL),
    (247,1,2,210,0,'0'),
    (248,1,2,220,0,NULL),
    (249,1,2,221,0,'false'),
    (250,1,2,222,0,NULL),
    (251,1,2,223,0,'true'),
    (252,1,2,231,0,'false'),
    (253,1,2,233,0,'false'),
    (254,1,2,234,0,NULL),
    (255,1,2,235,0,NULL),
    (256,1,2,236,0,'false'),
    (257,1,2,237,0,NULL),
    (258,1,2,238,0,'80'),
    (259,1,2,239,0,'false'),
    (260,1,2,240,0,NULL),
    (261,1,2,241,0,NULL),
    (262,1,2,242,0,'false'),
    (263,1,2,243,0,NULL),
    (264,1,2,244,0,'443'),
    (265,1,2,245,0,'false'),
    (266,1,2,246,0,NULL),
    (267,1,2,247,0,NULL),
    (268,1,2,248,0,'false'),
    (269,1,2,249,0,NULL),
    (270,1,2,250,0,'21'),
    (271,1,2,251,0,'false'),
    (272,1,2,252,0,NULL),
    (273,1,2,253,0,NULL),
    (274,1,2,254,0,'false'),
    (275,1,2,255,0,NULL),
    (276,1,2,256,0,'1080'),
    (277,1,2,257,0,'false'),
    (278,1,2,258,0,NULL),
    (279,1,2,259,0,NULL),
    (280,1,2,260,0,'false'),
    (281,1,2,261,0,NULL),
    (282,1,2,262,0,'1080'),
    (283,1,2,263,0,'false'),
    (284,1,2,264,0,NULL),
    (285,1,2,265,0,NULL),
    (286,1,2,300,0,'2'),
    (287,1,2,301,0,'0'),
    (288,1,2,302,0,'false'),
    (289,1,2,303,0,'false'),
    (290,1,2,304,0,'true'),
    (291,1,2,305,0,'false'),
    (292,1,2,306,0,''),
    (293,1,2,307,0,'~/Documents'),
    (294,1,2,308,0,'0'),
    (295,1,2,309,0,'true'),
    (296,1,2,310,0,'true'),
    (297,1,2,311,0,'false'),
    (298,1,2,312,0,'false'),
    (299,1,2,313,0,'true'),
    (300,1,2,314,0,'false'),
    (301,1,2,315,0,'1'),
    (302,1,2,316,0,'true'),
    (303,1,2,400,0,'false'),
    (304,1,2,401,0,'false'),
    (305,1,2,402,0,'false'),
    (306,1,2,403,0,'false'),
    (307,1,2,404,0,'false'),
    (308,1,2,405,0,'false'),
    (309,1,2,406,0,'false'),
    (310,1,2,407,0,'false'),
    (311,1,2,408,0,'false'),
    (312,1,2,500,0,'false'),
    (313,1,2,501,0,'false'),
    (314,1,2,502,0,'false'),
    (315,1,2,503,0,'false'),
    (316,1,2,504,0,'true'),
    (317,1,2,505,0,'false'),
    (318,1,2,506,0,'false'),
    (319,1,2,507,0,'false'),
    (320,1,2,508,0,'false'),
    (321,1,2,509,0,'false'),
    (322,1,2,510,0,'false'),
    (323,1,2,511,0,'false'),
    (324,1,2,512,0,'false'),
    (325,1,2,513,0,'false'),
    (326,1,2,514,0,'false'),
    (327,1,2,515,0,'false'),
    (328,1,2,516,0,'false'),
    (329,1,2,517,0,'false'),
    (330,1,2,518,0,'false'),
    (331,1,2,519,0,'false'),
    (332,1,2,520,0,'false'),
    (333,1,2,1000,0,'SEB_Server_0.3.0'),
    (334,1,2,1001,0,'0')
    ;
    
INSERT IGNORE INTO exam_configuration_map VALUES 
    (1, 1, 2, 1, null, null)
    ;