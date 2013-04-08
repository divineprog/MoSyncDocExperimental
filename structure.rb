# Page table . mapping old to new pages plus page 

# Main documentation categories (main subjects)
CPP="CPP"
JS="JS"
RELOAD="RELOAD"
SDK="SDK"
COMPANY="COMPANY" # Company info
# Do not create the target page. Used for redirect from old site.
REDIRECT="REDIRECT"
# Page is not publised, do not create any target page.
IGNORE="IGNORE"

# Documentation types
EXAMPLE="EXAMPLE"
GUIDE="GUIDE" # Coding Guide
#OVERVIEW="OVERVIEW"
PRODUCTGUIDE="PRODUCTGUIDE"
TOOLGUIDE="TOOLGUIDE"
TUTORIAL="TUTORIAL"

# Labels (topics)
ADS="Advertising"
ARCHITECTURE="Architecture"
DEBUGGING="Debugging"
BASIC_CPP="Basic Concepts" # C/C++ Beginner's Guides
BASIC_JS="Basic Concepts"
BLUETOOTH="Bluetooth"
CUSTOMERS="Customers"
CAMERA="Camera"
COLLECTIONS="Collections"
COMMUNICATION="Communication"
DATABASE="Database"
#DEVICE_PROFILES="Device Profiles"
ECLIPSE_IDE_USE="Using MoSync SDK"
ECLIPSE_IDE_INSTALL="Installing MoSync SDK"
EMULATORS="Emulators"
EVENTS="Event Handling"
EXTENSIONS="Extending MoSync SDK"
FONTS="Fonts"
GLOSSARY="Glossary"
GRAPHICS="Graphics"
INFO_RELOAD="MoSync Reload"
INFO_SDK="MoSync SDK"
LIBS="Libraries"
LOCATION="Location"
LUA="Lua"
MAPS="Maps"
MAUI="MAUI"
MEMORY="Memory Management"
NFC="Near Field Communication (NFC)"
NATIVEUI="Native UI"
OPENGL="OpenGL ES"
PIM="PIM and Contacts"
PURCHASES="Purchases"
RELEASE_NOTES="Release Notes"
RESOURCES="Resource Management"
ROADMAP="Roadmap"
SENSORS="Sensors"
SOUND="Sound"
STORAGE="Storage"
TESTING="Testing"
WEBUI="Web UI"
WORMHOLE="Wormhole"
XML="XML"

$pages = [
#[oldfile,newfile,category,type,[labels]]
["content/3dlines","cpp/examples/3dlines",CPP,EXAMPLE,[GRAPHICS]],
["content/advertising-banner-ads","home",REDIRECT],
["content/advgraphics","cpp/examples/advgraphics",CPP,EXAMPLE,[GRAPHICS]],
["content/api-reference-manuals","home",REDIRECT],
["content/audio-sound-music-0","home",REDIRECT],
["content/beginners-guide","home",REDIRECT],
["content/cameras-capture","home",REDIRECT],
["content/c-libraries-and-c-apis","home",REDIRECT],
["content/collections-containers-0","home",REDIRECT],
["content/communications-http-bluetooth","home",REDIRECT],
["content/connections","cpp/examples/connections",CPP,EXAMPLE,[COMMUNICATION]],
["content/creating-html5javascript-apps","js/tutorials/quick-start/creating-your-first-javascript-app",REDIRECT],
["content/databases-stores-files-storage","home",REDIRECT],
["content/debugging","cpp/examples/debugging",CPP,EXAMPLE,[DEBUGGING]],
["content/debugging-testing-performance","home",REDIRECT],
["content/developing-application-using-maui","cpp/guides/maui/gui-based-applications-with-maui",CPP,GUIDE,[MAUI]],
["content/developing-classic-procedural-applications","cpp/tutorials/basic/classic-procedural-applications",CPP,TUTORIAL,[BASIC_CPP]],
["content/developing-event-driven-object-oriented-applications","cpp/tutorials/basic/event-driven-object-oriented-applications",CPP,TUTORIAL,[BASIC_CPP]],
["content/development-models","cpp/guide/basic/development-models",CPP,TUTORIAL,[BASIC_CPP]],
["content/events-keys-touch-moblets","home",REDIRECT],
["content/example-application-descriptions","home",REDIRECT],
["content/extending-html5-apps-lua","js/tutorials/lua/extending-html5-apps-lua",JS,TUTORIAL,[LUA]],
["content/facebook-wikipedia-twitter","home",REDIRECT],
["content/fonts","home",REDIRECT],
["content/graphics-drawing-opengl-es","home",REDIRECT],
["content/hellomoblet","cpp/examples/hellomoblet",CPP,EXAMPLE,[BASIC_CPP]],
["content/html5-javascript-wormhole","js/guides/libs/html5-javascript-wormhole",JS,GUIDE,[WORMHOLE,LIBS]],
["content/location-gps","cpp/examples/location-gps",CPP,EXAMPLE,[LOCATION]],
["content/location-gps-maps-0","home",REDIRECT],
["content/mastx","cpp/examples/mastx",CPP,EXAMPLE,[MEMORY]],
["content/memory-heap-stack-0","home",REDIRECT],
["content/mosketch-0","cpp/examples/mosketch",CPP,EXAMPLE,[GRAPHICS]],
["content/mosound","cpp/examples/mosound",CPP,EXAMPLE,[SOUND]],
["content/mosync-customers","products/company/mosync-customers",COMPANY,PRODUCTGUIDE,[CUSTOMERS]],
["content/mosync-roadmap","products/company/mosync-roadmap",COMPANY,PRODUCTGUIDE,[ROADMAP]],
["content/motooth","cpp/examples/motooth",CPP,EXAMPLE,[BLUETOOTH]],
["content/motris-0","cpp/examples/motris",CPP,EXAMPLE,[GRAPHICS]],
["content/notifications-1","home",REDIRECT],
["content/otaload","cpp/examples/otaload",CPP,EXAMPLE,[COMMUNICATION]],
["content/pim-contacts","home",REDIRECT],
["content/platforms-devices-profiles","home",REDIRECT],
["content/programming-mosync","home",REDIRECT],
["content/resources-binaries-placeholders-0","home",REDIRECT],
["content/screencasts","screencasts",REDIRECT],
["content/sensors-orientation-nfc","home",REDIRECT],
["content/simple","cpp/examples/simple",CPP,EXAMPLE,[EVENTS]],
["content/standard-cc-libraries-0","cpp/guides/libs/standard-cc-libraries",CPP,GUIDE,[LIBS]],
["content/stylus","cpp/examples/stylus",CPP,EXAMPLE,[GRAPHICS]],
["content/timer","cpp/examples/timer",CPP,EXAMPLE,[EVENTS]],
["content/unit-test","cpp/examples/unit-test",CPP,EXAMPLE,[TESTING]],
["content/user-interfaces-nativeui-maui-0","home",REDIRECT],
["content/using-mosync-ide-2","home",REDIRECT],
["content/using-mosync-reload","js/tutorials/quick-start/",REDIRECT],
["content/using-mosync-reload","products/reload/info/",RELOAD,PRODUCTGUIDE,[INFO_RELOAD]],
["content/using-mosync-visual-studio","tools/sdk/extensions/using-mosync-visual-studio",SDK,TOOLGUIDE,[EXTENSIONS]],
["content/whats-new-release-notes","home",REDIRECT],
["content/xml-soap-json","home",REDIRECT],
["contributions","tools/sdk/extensions/extending-mosync-sdk",SDK,TOOLGUIDE,[EXTENSIONS]],
["documentation/architecture","home",REDIRECT],
["documentation/billing-app-purchases","home",REDIRECT],
["documentation/manualpage/emulating-device","tools/sdk/emulators/emulating-device",SDK,TOOLGUIDE,[EMULATORS]],
["documentation/manualpage/finalizing-applications","tools/sdk/ide/finalizing-applications",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpage/font-tools","cpp/guides/maui/font-tools",CPP,GUIDE,[MAUI,FONTS]],
["documentation/manualpage/installing-mosync","tools/sdk/ide/installing-mosync",SDK,TOOLGUIDE,[ECLIPSE_IDE_INSTALL]],
["documentation/manualpage/launching-mosync","tools/sdk/ide/launching-mosync",SDK,TOOLGUIDE,[ECLIPSE_IDE_INSTALL]],
["documentation/manualpage/mosync-glossary","tools/sdk/architecture/mosync-glossary",SDK,TOOLGUIDE,[GLOSSARY]],
["documentation/manualpage/resource-compiler-tutorial","tools/sdk/ide/resource-compiler-tutorial",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE,RESOURCES]],
["documentation/manualpage/using-device-profiles","tools/sdk/ide/using-device-profiles",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/accelerometeropengles","cpp/examples/",CPP,EXAMPLE,[SENSORS,OPENGL]],
["documentation/manualpages/adding-application-icons","tools/sdk/ide/adding-application-icons",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/application-profiling-mosync-emulator","tools/sdk/emulators/application-profiling-mosync-emulator",CPP,GUIDE,[EMULATORS]],
["documentation/manualpages/audio","cpp/guides/sound/audio",CPP,GUIDE,[SOUND]],
["documentation/manualpages/bluetoothclient","cpp/examples/bluetoothclient",CPP,EXAMPLE,[BLUETOOTH]],
["documentation/manualpages/bluetoothserver","cpp/examples/bluetoothserver",CPP,EXAMPLE,[BLUETOOTH]],
["documentation/manualpages/buidling-and-running-examples","tools/sdk/ide/buidling-and-running-examples",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/build-configurations","tools/sdk/ide/build-configurations",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/build-configurations","tools/sdk/ide/build-configurations",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/building-moblin-runtimes","tools/sdk/extensions/building-moblin-runtimes-linux",SDK,TOOLGUIDE,[EXTENSIONS]],
["documentation/manualpages/building-mosync-sdk-source-os-x","tools/sdk/extensions/building-mosync-sdk-source-os-x",SDK,TOOLGUIDE,[EXTENSIONS]],
["documentation/manualpages/building-mosync-source-linux","tools/sdk/extensions/building-mosync-source-linux",SDK,TOOLGUIDE,[EXTENSIONS]],
["documentation/manualpages/building-mosync-source-windows","tools/sdk/extensions/building-mosync-source-windows",SDK,TOOLGUIDE,[EXTENSIONS]],
["documentation/manualpages/camerademo","cpp/examples/camerademo",CPP,GUIDE,[CAMERA,NATIVEUI]],
["documentation/manualpages/coding-conventions","tools/sdk/extensions/coding-conventions",SDK,TOOLGUIDE,[EXTENSIONS]],
["documentation/manualpages/controlling-sensors","cpp/guides/sensors/controlling-sensors",CPP,GUIDE,[SENSORS]],
["documentation/manualpages/creating-new-workspace","tools/sdk/ide/creating-new-workspace",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/creating-user-interfaces-mosync","cpp/guides/userinterfaces/creating-user-interfaces-mosync",CPP,GUIDE,[NATIVEUI,WEBUI,MAUI]],
["documentation/manualpages/c-standard-template-library-stl","cpp/guides/libs/c-standard-template-library-stl",CPP,GUIDE,[LIBS]],
["documentation/manualpages/databasetest","cpp/examples/databasetest",CPP,EXAMPLE,[DATABASE]],
["documentation/manualpages/developing-android-applications","tools/sdk/ide/developing-android-applications",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/developing-iphone-applications","tools/sdk/ide/developing-iphone-applications",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/devicefonts","cpp/examples/devicefonts",CPP,EXAMPLE,[FONTS]],
["documentation/manualpages/devicefontsnativeui","cpp/examples/devicefontsnativeui",CPP,EXAMPLE,[FONTS,NATIVEUI]],
["documentation/manualpages/device-profile-database","tools/sdk/ide/device-profile-database",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/documentation-latest-nightly-builds","",IGNORE],
["documentation/manualpages/essential-guide-developing-apps-html5javascript","",IGNORE],
["documentation/manualpages/facebookdemo","cpp/examples/facebookdemo",CPP,EXAMPLE,[NATIVEUI]],
["documentation/manualpages/featureplatform-matrix-old","",IGNORE],
["documentation/manualpages/file-storage-syscall-functions","cpp/guides/storage/file-storage-syscall-functions",CPP,GUIDE,[STORAGE]],
["documentation/manualpages/forum-posters","",IGNORE],
["documentation/manualpages/framebuffer-api","cpp/guides/graphics/framebuffer-api",CPP,GUIDE,[GRAPHICS]],
["documentation/manualpages/glmobletopengles1","cpp/guides/graphics/glmobletopengles1",CPP,EXAMPLE,[GRAPHICS,OPENGL]],
["documentation/manualpages/glmobletopengles2","cpp/guides/graphics/glmobletopengles2",CPP,EXAMPLE,[GRAPHICS,OPENGL]],
["documentation/manualpages/gpsareacalculator","",IGNORE],
["documentation/manualpages/graphics-clipping-draw-targets","cpp/guides/graphics/graphics-clipping-draw-targets",CPP,GUIDE,[GRAPHICS]],
["documentation/manualpages/graphics-primitives","cpp/guides/graphics/graphics-primitives",CPP,GUIDE,[GRAPHICS]],
["documentation/manualpages/graphun","cpp/examples/graphun",CPP,EXAMPLE,[GRAPHICS,NATIVEUI,OPENGL]],
["documentation/manualpages/hellomap","cpp/examples/hellomap",CPP,EXAMPLE,[MAUI,MAPS]],
["documentation/manualpages/hellomaui","cpp/examples/hellomaui",CPP,EXAMPLE,[MAUI]],
["documentation/manualpages/hellonativeui","cpp/examples/hellonativeui",CPP,EXAMPLE,[NATIVEUI]],
["documentation/manualpages/helloopengles","cpp/examples/helloopengles",CPP,EXAMPLE,[OPENGL]],
["documentation/manualpages/helloworld","cpp/examples/helloworld",CPP,EXAMPLE,[BASIC_CPP]],
["documentation/manualpages/hello-world-deconstructed","cpp/guide/tutorial/hello-world-deconstructed",CPP,TUTORIAL,[BASIC_CPP]],
["documentation/manualpages/http-connections","cpp/guides/communication/http-connections",CPP,GUIDE,[COMMUNICATION]],
["documentation/manualpages/importing-example-applications","tools/sdk/ide/importing-example-applications",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/installing-mosync-os-x","tools/sdk/ide/installing-mosync-os-x",SDK,TOOLGUIDE,[ECLIPSE_IDE_INSTALL]],
["documentation/manualpages/issue-tracker","tools/sdk/extensions/issue-tracker",SDK,TOOLGUIDE,[EXTENSIONS]],
["documentation/manualpages/javascripthtml5-cross-platform-user-interfaces-0","cpp/guides/userinterfaces/javascripthtml5-cross-platform-user-interfaces-0",CPP,GUIDE,[NATIVEUI,WEBUI,MAUI]],
["documentation/manualpages/javascripthtml5-cross-platform-user-interfaces","",IGNORE],
["documentation/manualpages/jsnativeui-library","js/guides/nativeui/jsnativeui-library",JS,GUIDE,[NATIVEUI,LIBS]],
["documentation/manualpages/mafs-library-cc","cpp/guides/storage/mafs-library",CPP,GUIDE,[STORAGE,LIBS]],
["documentation/manualpages/managing-app-purchases","cpp/guides/purchases/managing-app-purchases",CPP,GUIDE,[PURCHASES]],
["documentation/manualpages/map-class","cpp/guides/collections/dictionaries",CPP,GUIDE,[COLLECTIONS]],
["documentation/manualpages/mapdemo","cpp/examples/mapdemo",CPP,EXAMPLE,[MAPS]],
["documentation/manualpages/map-library-c","cpp/guides/maps/map-library",CPP,GUIDE,[MAPS]],
["documentation/manualpages/mauiex","cpp/examples/mauiex",CPP,EXAMPLE,[MAUI]],
["documentation/manualpages/mautilconnection-sockets","cpp/guides/communication/mautil-connection-sockets",CPP,GUIDE,[COMMUNICATION]],
["documentation/manualpages/mautil-framebuffer-cc","cpp/guides/graphics/mautil-framebuffer",CPP,GUIDE,[GRAPHICS]],
["documentation/manualpages/mautil-graphics-cc","cpp/guides/graphics/mautil-graphics",CPP,GUIDE,[GRAPHICS]],
["documentation/manualpages/mdlbenchmark","cpp/guides/graphics/mdlbenchmark",CPP,GUIDE,[GRAPHICS,TESTING]],
["documentation/manualpages/more-mosync-runtime-environment","tools/sdk/emulators/more-mosync-runtime-environment",SDK,TOOLGUIDE,[EMULATORS]],
["documentation/manualpages/mosync-user-forum","",IGNORE],
["documentation/manualpages/mosync-visual-studio-2010","tools/sdk/extensions/mosync-visual-studio-2010",SDK,TOOLGUIDE,[EXTENSIONS]],
["documentation/manualpages/multitouch","cpp/examples/multitouch",CPP,EXAMPLE,[EVENTS]],
["documentation/manualpages/nativeuidemo","cpp/examples/nativeuidemo",CPP,EXAMPLE,[NATIVEUI,ADS]],
["documentation/manualpages/new-doxygen-front-cover-do-not-delete-or-publish","",IGNORE],
["documentation/manualpages/nfcexample","cpp/examples/nfcexample",CPP,EXAMPLE,[NFC,WEBUI]],
["documentation/manualpages/optimizing-mobile-applications","cpp/guides/testing/optimizing-mobile-applications",CPP,GUIDE,[TESTING]],
["documentation/manualpages/pim-access-and-control","cpp/guides/pim/pim-access-and-control",CPP,GUIDE,[PIM]],
["documentation/manualpages/pimdemo","cpp/examples/pimdemo",CPP,EXAMPLE,[PIM]],
["documentation/manualpages/projects-and-templates","tools/sdk/ide/projects-and-templates",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/purchaseexample","cpp/exanples/purchaseexample",CPP,EXAMPLE,[PURCHASES]],
["documentation/manualpages/purchase-library-and-api","cpp/guides/libs/purchase-library-and-api",CPP,GUIDE,[PURCHASES,LIBS]],
["documentation/manualpages/reading-sensors-javascript","js/guides/sensors/reading-sensors-javascript",JS,GUIDE,[SENSORS]],
["documentation/manualpages/resource-compiler-reference","tools/sdk/ide/resource-compiler-reference",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE,RESOURCES]],
["documentation/manualpages/resourcetest","cpp/examples/resourcetest",CPP,EXAMPLE,[RESOURCES]],
["documentation/manualpages/rockpaperscissors","cpp/examples/rockpaperscissors",CPP,EXAMPLE,[NATIVEUI]],
["documentation/manualpages/runtime-architecture","tools/sdk/architecture/runtime-architecture",SDK,TOOLGUIDE,[ARCHITECTURE]],
["documentation/manualpages/runtimes","tools/sdk/architecture/runtimes",SDK,TOOLGUIDE,[ARCHITECTURE]],
["documentation/manualpages/screenorientation","cpp/examples/screenorientation",CPP,EXAMPLE,[SENSORS]],
["documentation/manualpages/screenorientation","cpp/examples/sensortest",CPP,EXAMPLE,[SENSORS]],
["documentation/manualpages/setting-application-permissions","tools/sdk/ide/setting-application-permissions",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/soap","cpp/examples/soap",CPP,EXAMPLE,[COMMUNICATION]],
["documentation/manualpages/sql-database-api","cpp/guides/storage/sql-database-api",CPP,GUIDE,[STORAGE]],
["documentation/manualpages/stopwatch","",IGNORE],
["documentation/manualpages/testify-test-framework","cpp/guides/testing/testify-test-framework",CPP,GUIDE,[TESTING]],
["documentation/manualpages/toolchain","tools/sdk/architecture/toolchain",SDK,TOOLGUIDE,[ARCHITECTURE]],
["documentation/manualpages/using-advertising-library-and-api","cpp/guides/ads/using-advertising-library-and-api",CPP,GUIDE,[ADS]],
["documentation/manualpages/using-audio-api","cpp/guides/sound/using-audio-api",CPP,GUIDE,[SOUND]],
["documentation/manualpages/using-capture-api","cpp/guides/camera/using-capture-api",CPP,GUIDE,[CAMERA]],
["documentation/manualpages/using-debugger","tools/sdk/ide/using-debugger",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/using-facebook-library","cpp/guides/communication/using-facebook-library",CPP,GUIDE,[COMMUNICATION]],
["documentation/manualpages/using-javascript-callbacks","js/guides/basic/using-javascript-callbacks",JS,GUIDE,[BASIC_JS]],
["documentation/manualpages/using-nativeui-library","cpp/guides/nativeui/using-nativeui-library",CPP,GUIDE,[NATIVEUI]],
["documentation/manualpages/using-pipe-tool","tools/sdk/ide/using-pipe-tool",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/using-placeholders-and-handles","cpp/guides/memory/using-placeholders-and-handles",CPP,GUIDE,[MEMORY]],
["documentation/manualpages/using-web-sql-mosync-apps","js/guides/storage/using-web-sql",JS,GUIDE,[STORAGE]],
["documentation/manualpages/vector-class","cpp/guides/collections/vector",CPP,GUIDE,[COLLECTIONS]],
["documentation/manualpages/videonativeuiexample","cpp/guides/nativeui/videonativeuiexample",CPP,GUIDE,[NATIVEUI]],
["documentation/manualpages/whats-new-mosync-26-pyramid","tools/sdk/release-notes/whats-new-mosync-26-pyramid",SDK,TOOLGUIDE,[RELEASE_NOTES]],
["documentation/manualpages/wikisearchnativeui","cpp/examples/wikisearchnativeui",CPP,GUIDE,[NATIVEUI,COMMUNICATION]],
["documentation/manualpages/working-device-fonts-api","cpp/guides/fonts/working-device-fonts-api",CPP,GUIDE,[FONTS]],
["documentation/manualpages/working-javascript-prototypes","js/guides/basic/working-javascript-prototypes",JS,GUIDE,[BASIC_JS]],
["documentation/manualpages/working-mosync-libraries","cpp/guides/libs/working-mosync-libraries",CPP,GUIDE,[LIBS]],
["documentation/manualpages/working-opengl-es","cpp/guides/graphics/working-opengl-es",CPP,GUIDE,[OPENGL,GRAPHICS]],
["documentation/manualpages/wormholenativeui","js/examples/wormholenativeui",JS,GUIDE,[NATIVEUI]],
["documentation/manualpages/writing-new-extensions-mosync","tools/sdk/extensions/writing-extensions",SDK,TOOLGUIDE,[EXTENSIONS]],
["documentation/manualpages/xml-mtxml-parser-c","cpp/guides/xml/xml-mtxml-parser-c",CPP,GUIDE,[XML]],
["documentation/manualpages/xml-mtxml-parser","cpp/guides/xml/xml-mtxml-parser",CPP,GUIDE,[XML]],
["documentation/mosync-architecture","home",REDIRECT],
["documentation/tutorials/adding-resources-mosync-project","cpp/tutorials/",CPP,TUTORIAL,[RESOURCES]],
["documentation/tutorials/collections-mosync","cpp/tutorials/collections/collections-mosync",CPP,TUTORIAL,[COLLECTIONS]],
["documentation/tutorials/creating-bluetooth-clients","cpp/tutorials/communication/creating-bluetooth-clients",CPP,TUTORIAL,[BLUETOOTH]],
["documentation/tutorials/creating-bluetooth-server","cpp/tutorials/communication/creating-bluetooth-server",CPP,TUTORIAL,[BLUETOOTH]],
["documentation/tutorials/creating-new-fonts","cpp/tutorials/maui/creating-new-fonts",CPP,TUTORIAL,[MAUI,FONTS]],
["documentation/tutorials/creating-new-screens","cpp/tutorials/maui/creating-new-screens",CPP,TUTORIAL,[MAUI]],
["documentation/tutorials/custom-downloaders","cpp/tutorials/communication/custom-downloaders",CPP,TUTORIAL,[COMMUNICATION]],
["documentation/tutorials/detecting-events-cc","cpp/guides/events/detecting-events",CPP,GUIDE,[EVENTS]],
["documentation/tutorials/determining-location","cpp/tutorials/sensors/determining-location",CPP,TUTORIAL,[LOCATION,SENSORS]],
["documentation/tutorials/discovering-devices-and-services-bluetooth","cpp/tutorials/bluetooth/discovering-devices-and-services-bluetooth",CPP,TUTORIAL,[BLUETOOTH]],
["documentation/tutorials/downloading-audio-internet","cpp/tutorials/communication/downloading-audio-internet",CPP,TUTORIAL,[COMMUNICATION,SOUND]],
["documentation/tutorials/downloading-data-internet-0","cpp/tutorials/communication/downloading-data-internet",CPP,TUTORIAL,[COMMUNICATION]],
["documentation/tutorials/downloading-images-internet","cpp/tutorials/communication/downloading-images-internet",CPP,TUTORIAL,[COMMUNICATION,GRAPHICS]],
["documentation/tutorials/introduction-maui","cpp/tutorials/maui/introduction-maui",CPP,TUTORIAL,[MAUI]],
["documentation/tutorials/mosync-java-and-c-developers","cpp/guides/basic/mosync-java-and-c-developers",CPP,GUIDE,[BASIC_CPP]],
["documentation/tutorials/processing-xml","cpp/tutorials/xml/processing-xml",CPP,TUTORIAL,[XML]],
["documentation/tutorials/starting-mosync-development-java-and-c-developers","",IGNORE],
["documentation/tutorials/starting-new-moblet-project","cpp/tutorials/maui/starting-new-moblet-project",CPP,TUTORIAL,[MAUI]],
["documentation/tutorials/using-layouts","cpp/tutorials/maui/using-layouts",CPP,TUTORIAL,[MAUI]],
["documentation/using-mosync-ide","home",REDIRECT],
["documentation/wormhole-guides-tutorials-examples","home",REDIRECT]
]

puts($pages)
