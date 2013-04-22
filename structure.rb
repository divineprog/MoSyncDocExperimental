# Page table contains mappings from old to new pages
# and labels for each page.

# Special labels
# Do not create the target page. Used for redirect from old site.
REDIRECT="REDIRECT"
# Page is not publised, do not create any target page.
IGNORE="IGNORE"

# Home path of new website (used for redirect).
# TODO: Update this.
HOME_PATH = "/"

# Main documentation categories (main subjects)
COMPANY="Company Info"
CPP="C/C++"
JS="JavaScript"
RELOAD="MoSync Reload"
SDK="MoSync SDK"

# Document types
EXAMPLE="EXAMPLE"
GUIDE="GUIDE" # Coding Guide
TUTORIAL="TUTORIAL"
REFERENCE="REFERENCE"

# Topics
ADS="Advertising"
ARCHITECTURE="Architecture"
BASIC="Basic Concepts"
BLUETOOTH="Bluetooth"
CUSTOMERS="Customers"
CAMERA="Camera"
COLLECTIONS="Collections"
COMMUNICATION="Communication"
DATABASE="Database"
DEBUGGING="Debugging"
DEVICE_PROFILES="Device Profiles"
EMULATORS="Emulators"
EVENTS="Event Handling"
EXTENSIONS="Extending MoSync SDK"
FONTS="Fonts"
GLOSSARY="Glossary"
GRAPHICS="Graphics"
HYBRID="Hybrid Apps"
IDE="MoSync IDE"
INSTALL="Installation"
JSON="JSON"
LIBS="Libraries"
LOCATION="Location"
LUA="Lua"
MAPS="Maps"
MAUI="MAUI"
MEMORY="Memory Management"
NFC="Near Field Communication (NFC)"
NATIVEUI="Native UI"
NOTIFICATIONS="Notifications"
OPENGL="OpenGL ES"
PIM="PIM and Contacts"
PRODUCTS="Products"
PURCHASES="Purchases"
QUICK_START="Quick Start"
RELEASE_NOTES="Release Notes"
RESOURCES="Resource Management"
ROADMAP="Roadmap"
SENSORS="Sensors"
SOUND="Sound"
STORAGE="Storage"
SYMBIAN="Symbian"
TESTING="Testing"
TOOLS="Tools"
WEBUI="Web UI"
WORMHOLE="Wormhole"
XML="XML"

$pages = [
#[oldfile,newfile,tags]]
["HTML5-JavaScript-App-Development","http://www.mosync.com/reload",[REDIRECT]],
["blog/2010/03/creating-xml-documents","cpp/tutorials/xml/creating-xml-documents",[CPP,TUTORIAL,XML]],
["blog/2010/03/working-json-data","cpp/tutorials/json/working-with-json-data", [CPP,TUTORIAL,JSON]],
["blog/2010/05/serial-data-access","cpp/tutorials/storage/serial-data-access",[CPP,TUTORIAL,STORAGE]],
["blog/2013/01/how-extend-javascript-custom-c-code-opening-google-maps-hybrid-app","js/tutorials/ui/extend-javascript-with-custom-cpp-code",[JS,CPP,TUTORIAL,WEBUI,HYBRID]],
["content/3dlines","cpp/examples/3dlines",[CPP,EXAMPLE,GRAPHICS]],
["content/advertising-banner-ads",HOME_PATH,[REDIRECT]],
["content/advgraphics","cpp/examples/advgraphics",[CPP,EXAMPLE,GRAPHICS]],
["content/api-reference-manuals",HOME_PATH,[REDIRECT]],
["content/audio-sound-music-0",HOME_PATH,[REDIRECT]],
["content/beginners-guide",HOME_PATH,[REDIRECT]],
["content/cameras-capture",HOME_PATH,[REDIRECT]],
["content/c-libraries-and-c-apis",HOME_PATH,[REDIRECT]],
["content/collections-containers-0",HOME_PATH,[REDIRECT]],
["content/communications-http-bluetooth",HOME_PATH,[REDIRECT]],
["content/connections","cpp/examples/connections",[CPP,EXAMPLE,COMMUNICATION]],
["content/creating-html5javascript-apps","js/tutorials/quick-start/getting-started-html5-and-javascript",[REDIRECT]],
["content/databases-stores-files-storage",HOME_PATH,[REDIRECT]],
["content/debugging","cpp/examples/debugging",[CPP,EXAMPLE,DEBUGGING]],
["content/debugging-testing-performance",HOME_PATH,[REDIRECT]],
["content/demo-examples",HOME_PATH,[REDIRECT]],
["content/developing-application-using-maui","cpp/guides/maui/gui-based-applications-with-maui",[CPP,GUIDE,MAUI]],
["content/developing-classic-procedural-applications","cpp/tutorials/basic/classic-procedural-applications",[CPP,TUTORIAL,BASIC]],
["content/developing-event-driven-object-oriented-applications","cpp/tutorials/basic/event-driven-object-oriented-applications",[CPP,TUTORIAL,BASIC]],
["content/development-models","cpp/tutorials/basic/development-models",[CPP,TUTORIAL,BASIC]],
["content/events-keys-touch-moblets",HOME_PATH,[REDIRECT]],
["content/example-application-descriptions",HOME_PATH,[REDIRECT]],
["content/extending-html5-apps-lua","js/tutorials/lua/extending-html5-apps-lua",[JS,TUTORIAL,LUA]],
["content/facebook-wikipedia-twitter",HOME_PATH,[REDIRECT]],
["content/fonts",HOME_PATH,[REDIRECT]],
["content/fun-things-do-lovesms-example-application","js/tutorials/ui/fun-things-do-lovesms-example-application",[JS,TUTORIAL,WEBUI]],
["content/graphics-drawing-opengl-es",HOME_PATH,[REDIRECT]],
["content/hellomoblet","cpp/examples/hellomoblet",[CPP,EXAMPLE,BASIC]],
["content/html5-javascript-wormhole","js/guides/wormhole/html5-javascript-wormhole",[JS,GUIDE,WORMHOLE,LIBS]],
["content/location-gps","cpp/examples/location-gps",[CPP,EXAMPLE,LOCATION]],
["content/location-gps-maps-0",HOME_PATH,[REDIRECT]],
["content/mastx","cpp/examples/mastx",[CPP,EXAMPLE,MEMORY]],
["content/memory-heap-stack-0",HOME_PATH,[REDIRECT]],
["content/mixing-javascript-and-lua-dynamic-language-interplay","js/tutorials/lua/mixing-javascript-and-lua-dynamic-language-interplay",[JS,TUTORIAL,LUA]],
["content/mosketch-0","cpp/examples/mosketch",[CPP,EXAMPLE,GRAPHICS]],
["content/mosound","cpp/examples/mosound",[CPP,EXAMPLE,SOUND]],
["content/motooth","cpp/examples/motooth",[CPP,EXAMPLE,BLUETOOTH]],
["content/motris-0","cpp/examples/motris",[CPP,EXAMPLE,GRAPHICS]],
["content/notifications-1",HOME_PATH,[REDIRECT]],
["content/otaload","cpp/examples/otaload",[CPP,EXAMPLE,COMMUNICATION]],
["content/pim-contacts",HOME_PATH,[REDIRECT]],
["content/platforms-devices-profiles",HOME_PATH,[REDIRECT]],
["content/programming-mosync",HOME_PATH,[REDIRECT]],
["content/rendering-particles-mixing-html5-and-native-ui-opengl-using-mosync","js/tutorials/graphics/rendering-particles-mixing-html5-and-native-ui-opengl-using-mosync",[JS,TUTORIAL,GRAPHICS]],
["content/resources-binaries-placeholders-0",HOME_PATH,[REDIRECT]],
["content/screencasts","screencasts",[REDIRECT]],
["content/sensors-orientation-nfc",HOME_PATH,[REDIRECT]],
["content/simple","cpp/examples/simple",[CPP,EXAMPLE,EVENTS]],
["content/standard-cc-libraries-0","cpp/guides/libs/standard-cc-libraries",[CPP,GUIDE,LIBS]],
["content/stylus","cpp/examples/stylus",[CPP,EXAMPLE,GRAPHICS]],
["content/timer","cpp/examples/timer",[CPP,EXAMPLE,EVENTS]],
["content/unit-test","cpp/examples/unit-test",[CPP,EXAMPLE,TESTING]],
["content/user-interfaces-nativeui-maui-0",HOME_PATH,[REDIRECT]],
["content/using-mosync-ide-2",HOME_PATH,[REDIRECT]],
["content/using-mosync-reload","reload/guides/quick-start/mosync-reload-overview",[RELOAD,GUIDE,QUICK_START]],
["content/using-mosync-visual-studio","sdk/guides/extensions/using-mosync-visual-studio",[SDK,TOOLS,GUIDE,EXTENSIONS]],
["content/whats-new-release-notes",HOME_PATH,[REDIRECT]],
["content/xml-soap-json",HOME_PATH,[REDIRECT]],
["contributions","sdk/guides/extensions/extending-mosync-sdk",[SDK,TOOLS,GUIDE,EXTENSIONS]],
["documentation/architecture",HOME_PATH,[REDIRECT]],
["documentation/billing-app-purchases",HOME_PATH,[REDIRECT]],
["documentation/manualpage/creating-your-first-application","cpp/tutorials/quick-start/creating-your-first-cpp-application",[CPP,TUTORIAL,QUICK_START]],
["documentation/manualpage/emulating-device","sdk/guides/emulators/emulating-device",[SDK,TOOLS,GUIDE,EMULATORS]],
["documentation/manualpage/finalizing-applications","sdk/guides/ide/finalizing-applications",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpage/font-tools","cpp/guides/maui/font-tools",[CPP,GUIDE,MAUI,FONTS]],
["documentation/manualpage/installing-mosync","sdk/guides/ide/installing-mosync",[SDK,TOOLS,GUIDE,INSTALL]],
["documentation/manualpage/launching-mosync","sdk/guides/ide/launching-mosync",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpage/mosync-glossary","sdk/guides/architecture/mosync-glossary",[SDK,TOOLS,GUIDE,GLOSSARY]],
["documentation/manualpage/resource-compiler-tutorial","sdk/guides/ide/resource-compiler-tutorial",[SDK,TOOLS,GUIDE,IDE,RESOURCES]],
["documentation/manualpage/scanning-device","sdk/guides/ide/scanning-for-device",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpage/sending-device","sdk/guides/ide/sending-to-device",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpage/using-device-profiles","sdk/guides/ide/using-device-profiles",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/accelerometeropengles","cpp/examples/accelerometeropengles",[CPP,EXAMPLE,SENSORS,OPENGL]],
["documentation/manualpages/adding-application-icons","sdk/guides/ide/adding-application-icons",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/app-advertisement-javascript-developers","js/guides/ads/app-advertisement-javascript",[JS,GUIDE,ADS]],
["documentation/manualpages/application-profiling-mosync-emulator","sdk/guides/emulators/application-profiling-mosync-emulator",[CPP,GUIDE,EMULATORS]],
["documentation/manualpages/audio","cpp/guides/sound/audio",[CPP,GUIDE,SOUND]],
["documentation/manualpages/bluetoothclient","cpp/examples/bluetoothclient",[CPP,EXAMPLE,BLUETOOTH]],
["documentation/manualpages/bluetoothserver","cpp/examples/bluetoothserver",[CPP,EXAMPLE,BLUETOOTH]],
["documentation/manualpages/buidling-and-running-examples","sdk/guides/ide/building-and-running-examples",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/build-configurations","sdk/guides/ide/build-configurations",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/build-configurations","sdk/guides/ide/build-configurations",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/building-moblin-runtimes","sdk/guides/extensions/building-moblin-runtimes-linux",[SDK,TOOLS,GUIDE,EXTENSIONS]],
["documentation/manualpages/building-mosync-sdk-source-os-x","sdk/guides/extensions/building-mosync-sdk-source-os-x",[SDK,TOOLS,GUIDE,EXTENSIONS]],
["documentation/manualpages/building-mosync-source-linux","sdk/guides/extensions/building-mosync-source-linux",[SDK,TOOLS,GUIDE,EXTENSIONS]],
["documentation/manualpages/building-mosync-source-windows","sdk/guides/extensions/building-mosync-source-windows",[SDK,TOOLS,GUIDE,EXTENSIONS]],
["documentation/manualpages/building-photo-gallery","js/examples/photogallery-explained",[JS,EXAMPLE,TUTORIAL,CAMERA,COMMUNICATION]],
["documentation/manualpages/camerademo","cpp/examples/camerademo",[CPP,EXAMPLE,CAMERA,NATIVEUI]],
["documentation/manualpages/coding-conventions","sdk/guides/extensions/coding-conventions",[SDK,TOOLS,GUIDE,EXTENSIONS]],
["documentation/manualpages/controlling-cameras","cpp/guides/camera/controlling-cameras",[CPP,GUIDE,CAMERA]],
["documentation/manualpages/controlling-sensors","cpp/guides/sensors/controlling-sensors",[CPP,GUIDE,SENSORS]],
["documentation/manualpages/creating-new-workspace","sdk/guides/ide/creating-new-workspace",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/creating-user-interfaces-mosync","cpp/guides/ui/creating-user-interfaces-mosync",[CPP,GUIDE,NATIVEUI,WEBUI,MAUI]],
["documentation/manualpages/c-standard-template-library-stl","cpp/guides/libs/c-standard-template-library-stl",[CPP,GUIDE,LIBS]],
["documentation/manualpages/databasetest","cpp/examples/databasetest",[CPP,EXAMPLE,DATABASE]],
["documentation/manualpages/debugging-javascript-device","sdk/guides/ide/debugging-javascript-device",[SDK,TOOLS,GUIDE,JS,IDE,DEBUGGING]],
["documentation/manualpages/debugging-javascript-ios-mosync-reload","reload/guides/debugging/debugging-javascript-ios-mosync-reload",[RELOAD,GUIDE,DEBUGGING]],
["documentation/manualpages/debugging-javascript-rlog","reload/guides/debugging/debugging-javascript-rlog",[RELOAD,GUIDE,DEBUGGING]],
["documentation/manualpages/developing-android-applications","sdk/guides/ide/developing-android-applications",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/developing-iphone-applications","sdk/guides/ide/developing-iphone-applications",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/developing-windows-phone-applications","sdk/guides/ide/developing-windows-phone-applications",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/devicefonts","cpp/examples/devicefonts",[CPP,EXAMPLE,FONTS]],
["documentation/manualpages/devicefontsnativeui","cpp/examples/devicefontsnativeui",[CPP,EXAMPLE,FONTS,NATIVEUI]],
["documentation/manualpages/device-profile-database","sdk/guides/ide/device-profile-database",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/documentation-latest-nightly-builds","",[IGNORE]],
["documentation/manualpages/essential-guide-developing-apps-html5javascript","",[IGNORE]],
["documentation/manualpages/europeancountries","cpp/examples/europeancountries",[CPP,EXAMPLE,NATIVEUI]],
["documentation/manualpages/event-handling-mosync-hybrid-app","js/guides/basic/event-handling-mosync-hybrid-app",[JS,CPP,GUIDE,BASIC,HYBRID,ARCHITECTURE]],
["documentation/manualpages/facebookdemo","cpp/examples/facebookdemo",[CPP,EXAMPLE,NATIVEUI]],
["documentation/manualpages/featureplatform-matrix-old","",[IGNORE]],
["documentation/manualpages/file-storage-syscall-functions","cpp/guides/storage/file-storage-syscall-functions",[CPP,GUIDE,STORAGE]],
["documentation/manualpages/forum-posters","",[IGNORE]],
["documentation/manualpages/framebuffer-api","cpp/guides/graphics/framebuffer-api",[CPP,GUIDE,GRAPHICS]],
["documentation/manualpages/getting-started-html5-and-javascript","js/tutorials/quick-start/getting-started-html5-and-javascript",[JS,TUTORIAL,QUICK_START]],
["documentation/manualpages/getting-started-mosync-ide","sdk/guides/ide/tour-of-the-mosync-sdk-ide",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/glmobletopengles1","cpp/guides/graphics/glmobletopengles1",[CPP,EXAMPLE,GRAPHICS,OPENGL]],
["documentation/manualpages/glmobletopengles2","cpp/guides/graphics/glmobletopengles2",[CPP,EXAMPLE,GRAPHICS,OPENGL]],
["documentation/manualpages/gpsareacalculator","",[IGNORE]],
["documentation/manualpages/graphics-clipping-draw-targets","cpp/guides/graphics/graphics-clipping-draw-targets",[CPP,GUIDE,GRAPHICS]],
["documentation/manualpages/graphics-primitives","cpp/guides/graphics/graphics-primitives",[CPP,GUIDE,GRAPHICS]],
["documentation/manualpages/graphun","cpp/examples/graphun",[CPP,EXAMPLE,GRAPHICS,NATIVEUI,OPENGL]],
["documentation/manualpages/hellomap","cpp/examples/hellomap",[CPP,EXAMPLE,MAUI,MAPS]],
["documentation/manualpages/hellomaui","cpp/examples/hellomaui",[CPP,EXAMPLE,MAUI]],
["documentation/manualpages/hellonativeui","cpp/examples/hellonativeui",[CPP,EXAMPLE,NATIVEUI]],
["documentation/manualpages/helloopengles","cpp/examples/helloopengles",[CPP,EXAMPLE,OPENGL]],
["documentation/manualpages/helloworld","cpp/examples/helloworld",[CPP,EXAMPLE,BASIC]],
["documentation/manualpages/hello-world-deconstructed","cpp/tutorials/hello-world-deconstructed",[CPP,TUTORIAL,BASIC]],
["documentation/manualpages/how-communicate-between-javascript-and-c-mosync","js/guides/wormhole/extending-javascript-with-cpp",[CPP,JS,GUIDE,WORMHOLE]],
["documentation/manualpages/how-create-html5-project-mosync","js/tutorials/quick-start/how-create-html5-project-mosync",[JS,TUTORIAL,QUICK_START]],
["documentation/manualpages/http-connections","cpp/guides/communication/http-connections",[CPP,GUIDE,COMMUNICATION]],
["documentation/manualpages/importing-example-applications","sdk/guides/ide/importing-example-applications",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/installing-mosync-os-x","sdk/guides/ide/installing-mosync-os-x",[SDK,TOOLS,GUIDE,INSTALL]],
["documentation/manualpages/installing-mosync-reload","reload/guides/quick-start/mosync-reload-quick-start",[REDIRECT]],
["documentation/manualpages/interacting-user-through-javascript","js/guides/ui/interacting-with-users-using-javascript",[JS,GUIDE,WEBUI]],
["documentation/manualpages/issue-tracker","sdk/guides/extensions/issue-tracker",[SDK,TOOLS,GUIDE,EXTENSIONS]],
["documentation/manualpages/javascripthtml5-cross-platform-user-interfaces-0","cpp/guides/ui/javascripthtml5-cross-platform-user-interfaces",[CPP,JS,GUIDE,WEBUI]],
["documentation/manualpages/javascripthtml5-cross-platform-user-interfaces","",[IGNORE]],
["documentation/manualpages/jsnativeui-library","js/guides/nativeui/jsnativeui-library",[JS,GUIDE,NATIVEUI,LIBS]],
["documentation/manualpages/mafs-library-cc","cpp/guides/storage/mafs-library",[CPP,GUIDE,STORAGE,LIBS]],
["documentation/manualpages/managing-app-purchases","cpp/guides/purchases/managing-app-purchases",[CPP,GUIDE,PURCHASES]],
["documentation/manualpages/map-class","cpp/guides/collections/dictionaries",[CPP,GUIDE,COLLECTIONS]],
["documentation/manualpages/mapdemo","cpp/examples/mapdemo",[CPP,EXAMPLE,MAPS]],
["documentation/manualpages/map-library-c","cpp/guides/maps/map-library",[CPP,GUIDE,MAPS]],
["documentation/manualpages/mauiex","cpp/examples/mauiex",[CPP,EXAMPLE,MAUI]],
["documentation/manualpages/mautilconnection-sockets","cpp/guides/communication/mautil-connection-sockets",[CPP,GUIDE,COMMUNICATION]],
["documentation/manualpages/mautil-framebuffer-cc","cpp/guides/graphics/mautil-framebuffer",[CPP,GUIDE,GRAPHICS]],
["documentation/manualpages/mautil-graphics-cc","cpp/guides/graphics/mautil-graphics",[CPP,GUIDE,GRAPHICS]],
["documentation/manualpages/mdlbenchmark","cpp/guides/graphics/mdlbenchmark",[CPP,GUIDE,GRAPHICS,TESTING]],
["documentation/manualpages/mosync-reload","reload/guides/quick-start/mosync-reload-quick-start",[RELOAD,GUIDE,QUICK_START]],
["documentation/manualpages/more-mosync-runtime-environment","sdk/guides/emulators/more-mosync-runtime-environment",[SDK,TOOLS,GUIDE,EMULATORS]],
["documentation/manualpages/mosync-user-forum","",[IGNORE]],
["documentation/manualpages/mosync-visual-studio-2010","sdk/guides/extensions/mosync-visual-studio-2010",[SDK,TOOLS,GUIDE,EXTENSIONS]],
["documentation/manualpages/multitouch","cpp/examples/multitouch",[CPP,EXAMPLE,EVENTS]],
["documentation/manualpages/nativeuidemo","cpp/examples/nativeuidemo",[CPP,EXAMPLE,NATIVEUI,ADS]],
["documentation/manualpages/nativeuimap","cpp/examples/nativeuimap",[CPP,EXAMPLE,NATIVEUI]],
["documentation/manualpages/new-doxygen-front-cover-do-not-delete-or-publish","",[IGNORE]],
["documentation/manualpages/nfcexample","cpp/examples/nfcexample",[CPP,JS,EXAMPLE,NFC,WEBUI,HYBRID]],
["documentation/manualpages/optimizing-mobile-applications","cpp/guides/testing/optimizing-mobile-applications",[CPP,GUIDE,TESTING]],
["documentation/manualpages/photogallery","js/examples/photogallery",[JS,EXAMPLE,WEBUI,NATIVEUI,CAMERA,HYBRID]],
["documentation/manualpages/pim-access-and-control","cpp/guides/pim/pim-access-and-control",[CPP,GUIDE,PIM]],
["documentation/manualpages/pimdemo","cpp/examples/pimdemo",[CPP,EXAMPLE,PIM]],
["documentation/manualpages/projects-and-templates","sdk/guides/ide/projects-and-templates",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/purchaseexample","cpp/examples/purchaseexample",[CPP,EXAMPLE,PURCHASES]],
["documentation/manualpages/purchase-library-and-api","cpp/guides/libs/purchase-library-and-api",[CPP,GUIDE,PURCHASES,LIBS]],
["documentation/manualpages/reading-sensors-javascript","js/guides/sensors/reading-sensors-javascript",[JS,GUIDE,SENSORS]],
["documentation/manualpages/resource-compiler-reference","sdk/guides/ide/resource-compiler-reference",[SDK,TOOLS,GUIDE,IDE,RESOURCES]],
["documentation/manualpages/resourcetest","cpp/examples/resourcetest",[CPP,EXAMPLE,RESOURCES]],
["documentation/manualpages/reload-command-line-tool","reload/guides/tools/reload-command-line-tool",[RELOAD,GUIDE,TOOLS]],
["documentation/manualpages/rockpaperscissors","cpp/examples/rockpaperscissors",[CPP,EXAMPLE,NATIVEUI]],
["documentation/manualpages/running-phonegap-app-mosync","js/guides/wormhole/running-phonegap-app-mosync",[JS,GUIDE,WORMHOLE]],
["documentation/manualpages/runtime-architecture","sdk/guides/architecture/runtime-architecture",[SDK,TOOLS,GUIDE,ARCHITECTURE]],
["documentation/manualpages/runtimes","sdk/guides/architecture/runtimes",[SDK,TOOLS,GUIDE,ARCHITECTURE]],
["documentation/manualpages/screenorientation","cpp/examples/screenorientation",[CPP,EXAMPLE,SENSORS]],
["documentation/manualpages/sensortest","cpp/examples/sensortest",[CPP,EXAMPLE,SENSORS]],
["documentation/manualpages/setting-application-permissions","sdk/guides/ide/setting-application-permissions",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/soap","cpp/examples/soap",[CPP,EXAMPLE,COMMUNICATION]],
["documentation/manualpages/sql-database-api","cpp/guides/storage/sql-database-api",[CPP,GUIDE,STORAGE]],
["documentation/manualpages/stopwatch","",[IGNORE]],
["documentation/manualpages/symbian-packaging-parameters","sdk/guides/ide/symbian-packaging-parameters",[SDK,TOOLS,IDE,SYMBIAN]],
["documentation/manualpages/testify-test-framework","cpp/guides/testing/testify-test-framework",[CPP,GUIDE,TESTING]],
["documentation/manualpages/toolchain","sdk/guides/architecture/toolchain",[SDK,TOOLS,GUIDE,ARCHITECTURE]],
["documentation/manualpages/update-wormhole","js/guides/wormhole/update-wormhole",[JS,GUIDE,WORMHOLE]],
["documentation/manualpages/using-advertising-library-and-api","cpp/guides/ads/using-advertising-library-and-api",[CPP,GUIDE,ADS]],
["documentation/manualpages/using-audio-api","cpp/guides/sound/using-audio-api",[CPP,GUIDE,SOUND]],
["documentation/manualpages/using-c-notification-library","cpp/guides/notifications/using-notification-library",[CPP,GUIDE,NOTIFICATIONS]],
["documentation/manualpages/using-capture-api","cpp/guides/camera/using-capture-api",[CPP,GUIDE,CAMERA]],
["documentation/manualpages/using-debugger","sdk/guides/ide/using-debugger",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/using-facebook-library","cpp/guides/communication/using-facebook-library",[CPP,GUIDE,COMMUNICATION]],
["documentation/manualpages/using-javascript-callbacks","js/guides/basic/using-javascript-callbacks",[JS,GUIDE,BASIC]],
["documentation/manualpages/using-listview-widget","cpp/guides/nativeui/using-listview-widget",[CPP,GUIDE,NATIVEUI]],
["documentation/manualpages/using-nativeui-library","cpp/guides/nativeui/using-nativeui-library",[CPP,GUIDE,NATIVEUI]],
["documentation/manualpages/using-nativeui-map-widget","cpp/guides/nativeui/using-nativeui-map-widget",[CPP,GUIDE,NATIVEUI,MAPS]],
["documentation/manualpages/using-pipe-tool","sdk/guides/ide/using-pipe-tool",[SDK,TOOLS,GUIDE,IDE]],
["documentation/manualpages/using-placeholders-and-handles","cpp/guides/memory/using-placeholders-and-handles",[CPP,GUIDE,MEMORY]],
["documentation/manualpages/using-reloads-javascript-workbench","reload/guides/tools/using-javascript-workbench",[RELOAD,GUIDE,TOOLS,DEBUGGING]],
["documentation/manualpages/using-sql-hybrid-apps","js/guides/storage/using-sql-hybrid-apps",[JS,GUIDE,STORAGE,HYBRID]],
["documentation/manualpages/using-web-sql-mosync-apps","js/guides/storage/using-web-sql",[JS,GUIDE,STORAGE]],
["documentation/manualpages/vector-class","cpp/guides/collections/vector",[CPP,GUIDE,COLLECTIONS]],
["documentation/manualpages/videonativeuiexample","cpp/examples/videonativeuiexample",[CPP,EXAMPLE,NATIVEUI]],
["documentation/manualpages/webviewgeolocation","js/examples/webviewgeolocation",[JS,CPP,EXAMPLE,WEBUI,NATIVEUI,LOCATION,HYBRID]],
["documentation/manualpages/webviewlovesms","js/examples/webviewlovesms",[JS,CPP,EXAMPLE,WEBUI,HYBRID]],
["documentation/manualpages/webviewtwitter","js/examples/webviewtwitter",[JS,EXAMPLE,WEBUI,COMMUNICATION]],
["documentation/release-notes/whats-new-mosync-reload-10","reload/release-notes/whats-new-mosync-reload-10",[RELOAD,TOOLS,GUIDE,RELEASE_NOTES]],
["documentation/release-notes/whats-new-mosync-30","sdk/release-notes/whats-new-mosync-sdk-30",[SDK,TOOLS,GUIDE,RELEASE_NOTES]],
["documentation/release-notes/whats-new-mosync-31","sdk/release-notes/whats-new-mosync-sdk-31",[SDK,TOOLS,GUIDE,RELEASE_NOTES]],
["documentation/release-notes/whats-new-mosync-sdk-32","sdk/release-notes/whats-new-mosync-sdk-32",[SDK,TOOLS,GUIDE,RELEASE_NOTES]],
["documentation/release-notes/whats-new-mosync-sdk-321","sdk/release-notes/whats-new-mosync-sdk-321",[SDK,TOOLS,GUIDE,RELEASE_NOTES]],
["documentation/manualpages/wikisearchnativeui","cpp/examples/wikisearchnativeui",[CPP,GUIDE,NATIVEUI,COMMUNICATION]],
["documentation/manualpages/working-device-fonts-api","cpp/guides/fonts/working-device-fonts-api",[CPP,GUIDE,FONTS]],
["documentation/manualpages/working-javascript-prototypes","js/guides/basic/working-javascript-prototypes",[JS,GUIDE,BASIC]],
["documentation/manualpages/working-mosync-libraries","cpp/guides/libs/working-mosync-libraries",[CPP,GUIDE,LIBS]],
["documentation/manualpages/working-opengl-es","cpp/guides/graphics/working-opengl-es",[CPP,GUIDE,OPENGL,GRAPHICS]],
["documentation/manualpages/wormholedemo","js/examples/wormholedemo",[JS,GUIDE,WEBUI,SENSORS,LOCATION,STORAGE,WORMHOLE]],
["documentation/manualpages/wormholenativeui","js/examples/wormholenativeui",[JS,GUIDE,NATIVEUI]],
["documentation/manualpages/writing-new-extensions-mosync","sdk/guides/extensions/writing-extensions",[SDK,TOOLS,GUIDE,EXTENSIONS]],
["documentation/manualpages/xml-mtxml-parser-c","cpp/guides/xml/xml-mtxml-parser-c",[CPP,GUIDE,XML]],
["documentation/manualpages/xml-mtxml-parser","cpp/guides/xml/xml-mtxml-parser",[CPP,GUIDE,XML]],
["documentation/mosync-architecture",HOME_PATH,[REDIRECT]],
["documentation/tutorials/adding-resources-mosync-project","cpp/tutorials/adding-resources-mosync-project",[CPP,TUTORIAL,RESOURCES]],
["documentation/tutorials/collections-mosync","cpp/tutorials/collections/collections-mosync",[CPP,TUTORIAL,COLLECTIONS]],
["documentation/tutorials/creating-bluetooth-clients","cpp/tutorials/communication/creating-bluetooth-clients",[CPP,TUTORIAL,BLUETOOTH]],
["documentation/tutorials/creating-bluetooth-server","cpp/tutorials/communication/creating-bluetooth-server",[CPP,TUTORIAL,BLUETOOTH]],
["documentation/tutorials/creating-new-fonts","cpp/tutorials/maui/creating-new-fonts",[CPP,TUTORIAL,MAUI,FONTS]],
["documentation/tutorials/creating-new-screens","cpp/tutorials/maui/creating-new-screens",[CPP,TUTORIAL,MAUI]],
["documentation/tutorials/custom-downloaders","cpp/tutorials/communication/custom-downloaders",[CPP,TUTORIAL,COMMUNICATION]],
["documentation/tutorials/detecting-events-cc","cpp/guides/events/detecting-events",[CPP,GUIDE,EVENTS]],
["documentation/tutorials/determining-location","cpp/tutorials/sensors/determining-location",[CPP,TUTORIAL,LOCATION,SENSORS]],
["documentation/tutorials/discovering-devices-and-services-bluetooth","cpp/tutorials/bluetooth/discovering-devices-and-services-bluetooth",[CPP,TUTORIAL,BLUETOOTH]],
["documentation/tutorials/downloading-audio-internet","cpp/tutorials/communication/downloading-audio-internet",[CPP,TUTORIAL,COMMUNICATION,SOUND]],
["documentation/tutorials/downloading-data-internet-0","cpp/tutorials/communication/downloading-data-internet",[CPP,TUTORIAL,COMMUNICATION]],
["documentation/tutorials/downloading-images-internet","cpp/tutorials/communication/downloading-images-internet",[CPP,TUTORIAL,COMMUNICATION,GRAPHICS]],
["documentation/tutorials/introduction-maui","cpp/tutorials/maui/introduction-maui",[CPP,TUTORIAL,MAUI]],
["documentation/tutorials/mosync-java-and-c-developers","cpp/guides/basic/mosync-java-and-c-developers",[CPP,GUIDE,BASIC]],
["documentation/tutorials/processing-xml","cpp/tutorials/xml/processing-xml",[CPP,TUTORIAL,XML]],
["documentation/tutorials/push-notification-tutorial","cpp/guides/notifications/push-notification-tutorial",[CPP,GUIDE,NOTIFICATIONS]],
["documentation/tutorials/reading-and-writing-data","cpp/tutorials/storage/reading-and-writing-data",[CPP,TUTORIAL,STORAGE]],
["documentation/tutorials/starting-mosync-development-java-and-c-developers","",[IGNORE]],
["documentation/tutorials/starting-new-moblet-project","cpp/tutorials/maui/starting-new-moblet-project",[CPP,TUTORIAL,MAUI]],
["documentation/tutorials/using-layouts","cpp/tutorials/maui/using-layouts",[CPP,TUTORIAL,MAUI]],
["documentation/using-mosync-ide",HOME_PATH,[REDIRECT]],
["documentation/wormhole-guides-tutorials-examples",HOME_PATH,[REDIRECT]],
["widepage/feature-platform-support", "cpp/references/feature-platform-support",[CPP,REFERENCE,LIBS]],
]
