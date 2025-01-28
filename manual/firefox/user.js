/*********************************************************************
 *
 * Name: user.js | brainfucksec
 * Date: 2024-10-20
 * Version: 0.23.0
 * Descr.: Mozilla Firefox configuration file: `user.js`
 * URL: https://gist.github.com/brainfucksec/68e79da1c965aeaa4782914afd8f7fa2
 * Maintainer: brainf+ck
 *
 * INFO:
 *
 * Set preferences for the selected profile when Firefox start.
 * Copy this file on Firefox Profile folder.  You should create a new profile
 * to be used with this file.
 *
 * See:
 * Create, remove or switch Firefox profiles:
 * https://support.mozilla.org/en-US/kb/profile-manager-create-remove-switch-firefox-profiles
 *
 * Back up and restore information in Firefox profiles:
 * https://support.mozilla.org/en-US/kb/back-and-restore-information-firefox-profiles
 *
 * For more information how to use this file see:
 * https://kb.mozillazine.org/User.js_file
 * https://github.com/arkenfox/user.js/wiki/1.1-Overview
 *
 * For "about:config" entries see:
 * https://searchfox.org/mozilla-release/source/modules/libpref/init/all.js
 *
 * Thanks to:
 * arkenfox/user.js: https://github.com/arkenfox/user.js
 * LibreWolf: https://librewolf.net/
 *
 **********************************************************************/

/*********************************************************************
*
* Variable format:
*   user_pref("<entry>", <boolean> || <number> || "<string>");
*
* Keywords
     0K .used in comments:
*   - [Windows], [Linux] etc.  - The option is valid only for the indicated
operating system.
*   - [Non-Windows]            - The option is valid for all operating systems
other than Windows
*   - [HIDDEN PREF]            - Option that must be enabled in order to change
its default value or to be used.
*
* [NOTE]: Settings with default value "false" are not present (with some
exceptions for clarity).
*
*
* INDEX:
* ======
*   - STARTUP SETTINGS
*   - GEOLOCATION
*   - LANGUAGE / LOCALE
*   - RECOMMENDATIONS
*   - TELEMETRY
*   - STUDIES
*   - CRASH REPORTS
*   - SAFE BROWSING
*   - NETWORK: DNS, PROXY, NETWORK CHECKS
*   - SEARCH BAR: SUGGESTIONS, AUTOFILL, FORMS
*   - PASSWORDS
*   - DISK CACHE / MEMORY
*   - HTTPS / SSL/TLS / OSCP / CERTS
*   - HEADERS / REFERERS
*   - AUDIO/VIDEO: WEBRTC, WEBGL, DRM
*   - DOWNLOADS
*   - COOKIES
*   - UI FEATURES
*   - EXTENSIONS
*   - SHUTDOWN SETTINGS & SANITIZING
*   - FINGERPRINTING (RFP)
**********************************************************************/

/*********************************************************************
 * STARTUP SETTINGS
 *********************************************************************/

// Disable about:config warning
user_pref ("browser.aboutConfig.showWarning", false);

// Disable default browser check
user_pref("browser.shell.checkDefaultBrowser", false);

/*. Set startup home page:
 * 0 = blank
 * 1 = home
 * 2 = last visited page
 * 3 = resume previous session */
user_pref ("browser.startup.page", 1);

/* Set Home + New Window page:
 * about:home = Firefox Home (default)
 * about:blank = custom URL */
user_pref ("browser.startup.homepage", "about:home");

/* Set NEWTAB page:
 * true = Firefox Home (default), false = blank page */
user_pref ("browser.newtabpage.enabled", false);

// Disable sponsored content on Firefox Home (Activity Stream)
user_pref ("browser.newtabpage.activity-stream.showSponsored", false);
user_pref ("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// Sponsored shortcuts: clear default topsites
// [NOTE] This does not block you from adding your own
user_pref ("browser.newtabpage.activity-stream.default.sites", "");

/****************************************************************************
 * SECTION: BOOKMARK MANAGEMENT                                             *
 ****************************************************************************/

// PREF: limit the number of bookmark backups Firefox keeps
user_pref("browser.bookmarks.max_backups", 1); // default=15


// user_pref("browser.bookmarks.editDialog.showForNewBookmarks", false);

/****************************************************************************
 * SECTION: ZOOM AND DISPLAY SETTINGS                                       *
 ****************************************************************************/

// PREF: zoom only text on webpage, not other elements
// user_pref("browser.zoom.full", false);



// PREF: restore zooming behavior [macOS] [FF109+]
// On macOS, Ctrl or Cmd + trackpad or mouse wheel now scrolls the page instead of zooming.
// This avoids accidental zooming and matches Safari's and Chrome's behavior.
// The prefs below restores the previous zooming behavior
//user_pref("mousewheel.with_control.action", 3);
//user_pref("mousewheel.with_meta.action", 3);

// PREF: adjust the minimum tab width
// Can be overridden by userChrome.css
// user_pref("browser.tabs.tabMinWidth", 120); // default=76

// PREF: always underline links [FF120+]
// DEFAULT = false
user_pref("layout.css.always_underline_links", true);




/*********************************************************************
 * GEOLOCATION
 *********************************************************************/

// Disable using the OS’s geolocation service
// user_pref("geo.provider.ms-windows-location", false); // [Windows]
// user_pref("geo.provider.use_corelocation", false);    // [macOS]
user_pref ("geo.provider.use_geoclue", false); // [Linux]

/*********************************************************************
 * LANGUAGE / LOCALE
 ****************************************************************..*****/

// Set language for displaying web pages:
user_pref ("intl.accept_languages", "en-US, en");
user_pref ("javascript.use_us_english_locale", true); // [HIDDEN PREF]

/*********************************************************************
 * RECOMMENDATIONS & MOZILLA UI
 *********************************************************************/

// Disable recommendation pane in about:addons (use Google Analytics)
user_pref ("extensions.getAddons.showPane", false); // [HIDDEN PREF]

// Disable recommendations in about:addons Extensions and Themes panes
user_pref ("extensions.htmlaboutaddons.recommendations.enabled", false);

// Disable personalized Extension Recommendations in about:addons
user_pref ("browser.discovery.enabled", false);


// PREF: allow for more granular control of zoom levels
// Especially useful if you want to set your default zoom to a custom level.
user_pref("toolkit.zoomManager.zoomValues", ".3,.5,.67,.8,.9,.95,1,1.1,1.2,1.3,1.4,1.5,1.6,1.7,2,2.4,3");

// PREF: use native title bar buttons [LINUX]
// [1] https://github.com/yokoffing/Betterfox/issues/320
user_pref("widget.gtk.non-native-titlebar-buttons.enabled", true);

/****************************************************************************
 * SECTION: THEME ADJUSTMENTS                                              *
****************************************************************************/

// PREF: enable Firefox to use userChome, userContent, etc.
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// PREF: add compact mode back to options
user_pref("browser.compactmode.show", true);

// PREF: preferred color scheme for websites
// [SETTING] General>Language and Appearance>Website appearance
// By default, color scheme matches the theme of your browser toolbar (3).
// Set this pref to choose Dark on sites that support it (0) or Light (1).
// Before FF95, the pref was 2, which determined site color based on OS theme.
// Dark (0), Light (1), System (2), Browser (3) [DEFAULT FF95+]
// [1] https://www.reddit.com/r/firefox/comments/rfj6yc/how_to_stop_firefoxs_dark_theme_from_overriding/hoe82i5/?context=3
user_pref("layout.css.prefers-color-scheme.content-override", 0);

// PREF: disable always using dark theme for private browsing windows [FF106+]
//user_pref("browser.theme.dark-private-windows", false);

// PREF: prevent private windows being separate from normal windows in taskbar [WINDOWS] [FF106+]
user_pref("browser.privateWindowSeparation.enabled", false);

// PREF: show search bar [FF122+]
// Mozilla has removed the search bar option from the settings window.
user_pref("browser.search.widget.inNavBar", true);

// PREF: new tab page wallpapers
//user_pref("browser.newtabpage.activity-stream.newtabWallpapers.v2.enabled", true); // [DEFAULT FF132+]

/****************************************************************************
 * SECTION: FULLSCREEN NOTICE                                               *
****************************************************************************/

// PREF: remove fullscreen delay
user_pref("full-screen-api.transition-duration.enter", "0 0"); // default=200 200
user_pref("full-screen-api.transition-duration.leave", "0 0"); // default=200 200

// PREF: disable fullscreen notice
user_pref("full-screen-api.warning.delay", -1); // default=500
user_pref("full-screen-api.warning.timeout", 0); // default=3000



/*********************************************************************
 * TELEMETRY
 *********************************************************************/

// Disable new data submission
user_pref ("datareporting.policy.dataSubmissionEnabled", false);

// Disable Health Reports
user_pref ("datareporting.healthreport.uploadEnabled", false);

// Disable telemetry
user_pref ("toolkit.telemetry.enabled", false); // Default: false
user_pref ("toolkit.telemetry.unified", false);
user_pref ("toolkit.telemetry.server", "data:,");
user_pref ("toolkit.telemetry.archive.enabled", false);
user_pref ("toolkit.telemetry.newProfilePing.enabled", false);
user_pr.ef("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref ("toolkit.telemetry.updatePing.enabled", false);
user_pref ("toolkit.telemetry.bhrPing.enabled",
           false); // bhr = Background Hang Reporter
user_pref ("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref ("toolkit.telemetry.coverage.opt-out", true); // [HIDDEN PREF]
user_pref ("toolkit.coverage.opt-out", true);           // [HIDDEN PREF]
user_pref ("toolkit.coverage.endpoint.base.", "");

// Disable Firefox Home (Activity Stream) telemetry
user_pref ("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref ("browser.newtabpage.activity-stream.telemetry", false);

/*********************************************************************
 * STUDIES
 *********************************************************************/

// Disable studies
user_pref ("app.shield.optoutstudies.enabled", false);

// Disable normandy/shield (telemetry system),
// https://mozilla.github.io/normandy/
user_pref ("app.normandy.enabled", false);
user_pref ("app.normandy.api_url", "");

/*********************************************************************
 * CRASH REPORTS
 *********************************************************************/

// Disable crash reports
user_pref ("breakpad.reportURL", "");
user_pref ("browser.tabs.crashReporting.sendReport", false);

/***************************************************.******************
 * SAFE BROWSING
 *********************************************************************/

// Disable safe browsing service
user_pref ("browser.safebrowsing.malware.enabled", false);
user_pref ("browser.safebrowsing.phishing.enabled", false);

// Disable list of blocked URI
user_pref ("browser.safebrowsing.blockedURIs.enabled", false);

// Disable fetch of updates
user_pref ("browser.safebrowsing.provider.google4.gethashURL", "");
user_pref ("browser.safebrowsing.provider.google4.updateURL", "");
user_pref ("browser.safebrowsing.provider.google.gethashURL", "");
user_pref ("browser.safebrowsing.provider.google.updateURL", "");
user_pref ("browser.safebrowsing.provider.google4.dataSharingURL", "");

// Disable checks for downloads
user_pref ("browser.safebrowsing.downloads.enabled", false);
user_pref ("browser.safebrowsing.downloads.remote.enabled", false);
user_pref ("browser.safebrowsing.downloads.remote.url", "");

// Disable checks for unwanted software
user_pref ("browser.safebrowsing.downloads.remote.block_potentially_unwanted",
           false);
user_pref ("browser.safebrowsing.downloads.remote.block_uncommon", false);

// Disable bypasses the block of safe browsing with a click for current session
user_pref ("browser.safebrowsing.allowOverride", false);



/*********************************************************************
 * NETWORK: DNS, PROXY, NETWORK.. CHECKS
 *********************************************************************/

// Disable link prefetching
user_pref ("network.prefetch-next", false);

// Disable DNS prefetching
user_pref ("network.dns.disablePrefetch", true);
user_pref ("network.dns.disablePrefetchFromHTTPS", true);

// Disable predictor
user_pref ("network.predictor.enabled", false);

// Disable link-mouseover opening connection to linked server
user_pref ("network.http.speculative-parallel-limit", 0);

// Disable mousedown speculative connections on bookmarks and history
user_pref ("browser.places.speculativeConnect.enabled", false);

/* Disable "GIO" protocols as a potential proxy bypass vectors
 * https://en.wikipedia.org/wiki/GVfs
 * https://en.wikipedia.org/wiki/GIO_(software) */
user_pref ("network.gio.supported-protocols", ""); // [HIDDEN PREF]

// Disable using UNC (Uniform Naming Convention) paths (prevent proxy bypass)
user_pref ("network.file.disable_unc_paths", true); // [HIDDEN PREF]

// Remove special permissions for certain mozilla domains
user_pref ("permissions.manager.defaultsUrl", "");

// Use Punycode in Internationalized Domain Names to eliminate possible
// spoofing
user_pref ("network.IDN_show_punycode", true);

// Disable captive portal detection
user_pref ("captivedetect.canonicalURL", "");
user_pref ("network.captive-portal-service.enabled", false);

// Disable network conn.ections checks
user_pref ("network.connectivity-service.enabled", false);

/*********************************************************************
 * SEARCH BAR: SUGGESTIONS, AUTOFILL, FORMS
 *********************************************************************/

// Disable location bar making speculative connections
user_pref ("browser.urlbar.speculativeConnect.enabled", false);

// Disable location bar contextual suggestions
user_pref ("browser.urlbar.quicksuggest.enabled", false);
user_pref ("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref ("browser.urlbar.suggest.quicksuggest.sponsored", false);

// Disable live search suggestions
user_pref ("browser.search.suggest.enabled", false);
user_pref ("browser.urlbar.suggest.searches", false);


// Disable urlbar suggestions
user_pref ("browser.urlbar.addons.featureGate", false);
user_pref ("browser.urlbar.mdn.featureGate", false); // [HIDDEN PREF]

// Disable search and form history
// [NOTE] We also clear formdata on exit
user_pref ("browser.formfill.enable", false);

// Disable Form Autofill
user_pref ("extensions.formautofill.addresses.enabled", false);
user_pref ("extensions.formautofill.creditCards.enabled", false);

// PREF: minimize URL bar suggestions (bookmarks, history, open tabs)
// Dropdown options in the URL bar:
//user_pref("browser.urlbar.suggest.history", false);
//user_pref("browser.urlbar.suggest.bookmark", true); // DEFAULT
//user_pref("browser.urlbar.suggest.clipboard", false);
//user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.engines", false);
    //user_pref("browser.urlbar.suggest.searches", false);
//user_pref("browser.urlbar.quickactions.enabled", false);
//user_pref("browser.urlbar.shortcuts.quickactions", false);
//user_pref("browser.urlbar.suggest.weather", true); // DEFAULT [FF108]
    //user_pref("browser.urlbar.weather.ignoreVPN", false); // DEFAULT
user_pref("browser.urlbar.suggest.calculator", true);
user_pref("browser.urlbar.unitConversion.enabled", true);

// PREF: disable dropdown suggestions with empty query
//user_pref("browser.urlbar.suggest.topsites", false);

// PREF: disable urlbar trending search suggestions [FF118+]
// [SETTING] Search>Search Suggestions>Show trending search suggestions (FF119)
user_pref("browser.urlbar.trending.featureGate", false);
//user_pref("browser.urlbar.suggest.trending", false);

// PREF: disable urlbar suggestions
//user_pref("browser.urlbar.addons.featureGate", false); // [FF115+]
//user_pref("browser.urlbar.fakespot.featureGate", false); // [FF130+] [DEFAULT: false]
//user_pref("browser.urlbar.mdn.featureGate", false); // [FF117+] [HIDDEN PREF]
//user_pref("browser.urlbar.pocket.featureGate", false); // [FF116+] [DEFAULT: false]
//user_pref("browser.urlbar.weather.featureGate", false); // [FF108+] [DEFAULT: false]
//user_pref("browser.urlbar.clipboard.featureGate", false); // [FF118+] [DEFAULT: true FF125+]
//user_pref("browser.urlbar.yelp.featureGate", false); // [FF124+] [DEFAULT: false]

// PREF: disable recent searches [FF120+]
// [NOTE] Recent searches are cleared with history.
// [1] https://support.mozilla.org/kb/search-suggestions-firefox
//user_pref("browser.urlbar.recentsearches.featureGate", false);

// PREF: disable tab-to-search [FF85+]
// Alternatively, you can exclude on a per-engine basis by unchecking them in Options>Search
// [SETTING] Privacy & Security>Address Bar>When using the address bar, suggest>Search engines
//user_pref("browser.urlbar.suggest.engines", false);

// PREF: Adaptive History Autofill
// [1] https://docs.google.com/document/u/1/d/e/2PACX-1vRBLr_2dxus-aYhZRUkW9Q3B1K0uC-a0qQyE3kQDTU3pcNpDHb36-Pfo9fbETk89e7Jz4nkrqwRhi4j/pub
//user_pref("browser.urlbar.autoFill", true); // [DEFAULT]
//user_pref("browser.urlbar.autoFill.adaptiveHistory.enabled", false);

// PREF: adjust the amount of Address bar / URL bar dropdown results
// This value controls the total number of entries to appear in the location bar dropdown.
// [NOTE] Items (bookmarks/history/openpages) with a high "frequency"/"bonus" will always
// be displayed (no we do not know how these are calculated or what the threshold is),
// and this does not affect the search by search engine suggestion.
// disable=0
user_pref("browser.urlbar.maxRichResults", 3); // default=10

// PREF: text fragments [FF126+ NIGHTLY]
// [1] https://bugzilla.mozilla.org/show_bug.cgi?id=1753933#c6
// [2] https://developer.mozilla.org/en-US/docs/Web/Text_fragments
// [3] https://web.dev/articles/text-fragments
//user_pref("dom.text_fragments.enabled", true); // [DEFAULT]




/*********************************************************************
 * PASSW.ORDS
 *********************************************************************/

// Disable saving passwords
user_pref ("signon.rememberSignons", false);

// Disable autofill login and passwords
user_pref ("signon.autofillForms", false);

// Disable formless login capture for Password Manager
user_pref ("signon.formlessCapture.enabled", false);

/* Hardens against potential credentials phishing:
 * 0 = don't allow sub-resources to open HTTP authentication credentials
 * dialogs 1 = don't allow cross-origin sub-resources to open HTTP
 * authentication credentials dialogs 2 = allow sub-resources to open HTTP
 * authentication credentials dialogs (default) */
user_pref ("network.auth.subresource-http-auth-allow", 1);

/*********************************************************************
 * DISK CACHE / MEMORY
 *********************************************************************/

// Disable disk cache
user_pref ("browser.cache.disk.enable", false);

// Disable media cache from writing to disk in Private Browsing
user_pref ("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref ("media.memory_cache_max_size", 65536);

/* Disable storing extra session data (cookies, POST data, etc.):
 * 0 = everywhere
 * 1 = unencrypted sites
 * 2 = nowhere */
user_pref ("browser.sessionstore.privacy_level", 2);

// Disable resuming session from crash
user_pref ("browser.sessions ..tore.resume_from_crash", false);

// Disable automatic Firefox start and session restore after reboot [Windows]
user_pref ("toolkit.winRegisterApplicationRestart", false);

// Disable page thumbnail collection
user_pref ("browser.pagethumbnails.capturing_disabled", true); // [HIDDEN PREF]

// Disable favicons in shortcuts [Windows]
user_pref ("browser.shell.shortcutFavicons", false);

// Delete temporary files opened from non-Private Browsing windows with
// external apps
user_pref ("browser.download.start_downloads_in_tmp_dir", true);
user_pref ("browser.helperApps.deleteTempFileOnExit", true);





/*********************************************************************
 * HTTPS (SSL/TLS, OSCP, CERTS)
 *********************************************************************/

// Disable TLS 1.3 0-RTT (round-trip time)
user_pref ("security.tls.enable_0rtt_data", false);

// Set OCSP to terminate the connection when a CA isn't validate
user_pref ("security.OCSP.require", true);

// Display advanced information on Insecure Connection warning pages
user_pref ("browser.xul.error_pages.expert_bad_cert", true);

/* HPKP (HTTP Public Key Pinning)
 * Enable strict PKP (Public Key Pinning):
 * 0 = disabled
 * 1 = allow user MiTM (i.e. your Antivirus)
 * 2 = strict */
user_pref ("security.cert_pinning.enforcement_level", 2);

/* Enable CRLite
 * 0 = disabled
 * 1 = consult CRLite but o.nly collect telemetry
 * 2 = consult CRLite and enforce both "Revoked" and "Not Revoked" results
 * 3 = consult CRLite and enforce "Not Revoked" results, but defer to OCSP for
 * "Revoked" (default) */
user_pref ("security.remote_settings.crlite_filters.enabled", true);
user_pref ("security.pki.crlite_mode", 2);

// Enable HTTPS-Only mode in all windows
user_pref ("dom.security.https_only_mode", true);

// Disable sending HTTP request for checking HTTPS support by the server
user_pref ("dom.security.https_only_mode_send_http_background_request", false);

/*********************************************************************
 * HEADERS / REFERERS
 *********************************************************************/

/* Control amount of cross-origin information to send:
 * 0 = send full URI (default):  https://example.com:8888/foo/bar.html?id=1234
 * 1 = scheme+host+port+path:    https://example.com:8888/foo/bar.html
 * 2 = scheme+host+port:         https://example.com:8888 */
user_pref ("network.http.referer.XOriginTrimmingPolicy", 2);

/*********************************************************************
 * AUDIO/VIDEO: WebRTC, WebGL
 *********************************************************************/

// Force WebRTC i.nside the proxy
user_pref ("media.peerconnection.ice.proxy_only_if_behind_proxy", true);

/* Force a single network interface for ICE candidates generation
 * https://wiki.mozilla.org/Media/WebRTC/Privacy */
user_pref ("media.peerconnection.ice.default_address_only", true);

// Force exclusion of private IPs from ICE candidates
user_pref ("media.peerconnection.ice.no_host", true);

// Disable WebGL (Web Graphics Library):
user_pref ("webgl.disabled", true);

/*********************************************************************
 * DOWNLOADS
 *********************************************************************/

// Always ask you where to save files:
user_pref ("browser.download.useDownloadDir", false);

// Disable adding downloads to system's "recent documents" list
user_pref ("browser.download.manager.addToRecentDocs", false);

/****************************************************************************
 * COOKIES & COOKIE BANNER HANDLING
****************************************************************************/

/*
 * ETP (Enhanced Tracking Protection)
 * Enable ETP Strict Mode
 * ETP Strict Mode enables Total Cookie Protection (TCP)
 */
user_pref ("browser.contentblocking.category", "strict"); // [HIDDEN PREF]


// PREF: Cookie Banner handling
// [NOTE] Feature still enforces Total Cookie Protection to limit 3rd-party cookie tracking [1]
// [1] https://github.com/mozilla/cookie-banner-rules-list/issues/33#issuecomment-1318460084
// [2] https://phabricator.services.mozilla.com/D153642
// [3] https://winaero.com/make-firefox-automatically-click-on-reject-all-in-cookie-banner-consent/
// [4] https://docs.google.com/spreadsheets/d/1Nb4gVlGadyxix4i4FBDnOeT_eJp2Zcv69o-KfHtK-aA/edit#gid=0
// 2: reject banners if it is a one-click option; otherwise, fall back to the accept button to remove banner
// 1: reject banners if it is a one-click option; otherwise, keep banners on screen
// 0: disable all cookie banner handling
user_pref("cookiebanners.service.mode", 1);
user_pref("cookiebanners.service.mode.privateBrowsing", 1);

// PREF: Cookie Banner global rules
// Global rules that can handle a list of cookie banner libraries and providers on any site.
// This is used for click rules that can handle common Consent Management Providers (CMP).
//user_pref("cookiebanners.service.enableGlobalRules", true); // DEFAULT [FF121+]
//user_pref("cookiebanners.service.enableGlobalRules.subFrames", true); // DEFAULT [FF121+]




/*********************************************************************
 * UI FEATURES
 *********************************************************************/

// Limit events that can ..cause a popup
user_pref ("dom.popup_allowed_events", "click dblclick mousedown pointerdown");

// Disable PDFJS scripting
user_pref ("pdfjs.enableScripting", false);

/* Enable Containers and show the UI settings
 * https://wiki.mozilla.org/Security/Contextual_Identity_Project/Containers */
user_pref ("privacy.userContext.enabled", true);
user_pref ("privacy.userContext.ui.enabled", true);

/*********************************************************************
 * EXTENSIONS
 *********************************************************************/

/* Limit allowed extension directories:
 * 1 = profile
 * 2 = user
 * 4 = application
 * 8 = system
 * 16 = temporary
 * 31 = all
 * The pref value represents the sum: e.g. 5 would be profile and application
 * directories. */
user_pref ("extensions.enabledScopes", 5); // [HIDDEN PREF]

// Display always the installation prompt of 3rd party extension
user_pref ("extensions.postDownloadThirdPartyPrompt", false);

/*********************************************************************
 * SHUTDOWN SETTINGS & SANITIZING
 *********************************************************************/

// Clear history, cookies and site data when Firefox closes
user_pref ("privacy.sanitize.sanitizeOnShutdown", true);
user_pref ("privacy.clearOnShutdown.cookies", true);     // Cookies
user_pref ("privacy.clearOnShutdown.offlineApps", true); // Sit.e data
user_pref ("privacy.clearOnShutdown_v2.cookiesAndStorage",
           true); // Cookies, Site Data, Active Logins

/* Set Time range to clear for "Clear Data" and "Clear History"
 * 0 = everything
 * 1 = last hour
 * 2 = last two hours
 * 3 = last four hours
 * 4 = today
 * [NOTE]: Values 5 (last 5 minutes) and 6 (last 24 hours) are not listed in
 * the dropdown which will display a blank value, and are not guaranteed to
 * work */
user_pref ("privacy.sanitize.timeSpan", 0);

/*********************************************************************
 * FINGERPRINTING (RFP)
 *********************************************************************/

/* RFP (Resist Fingerprinting):
 * RFP can cause some website breakage: mainly canvas, use a site exception via
 * the urlbar.
 *
 * RFP also has a few side effects: mainly timezone is UTC0, and websites will
 * prefer light theme.
 * See: https://bugzilla.mozilla.org/418986
 * https://support.mozilla.org/en-US/kb/firefox-protection-against-fingerprinting
 */

// Enable RFP
user_pref ("privacy.resistFingerprinting", true);

// Increase the size of new RFP windows for better usability
user_pref ("privacy.window.maxInnerWidth", 1600);
user_pref ("privacy.window.maxInnerHeight", 900);
user_pref ("privacy.resistFingerprinting.letterboxing", false);

// Disable mozAddonManager Web API
user_pref ("privacy.resistFingerprinting.block_mozAddon.Manager", true);

// Disable using system colors
user_pref ("browser.display.use_system_colors",
           false); // [Default: false] [Non-Windows]

// Set all open window methods to abide by "browser.link.open_newwindow"
user_pref ("browser.link.open_newwindow.restriction", 0);
100 % 162K = 0.1s
