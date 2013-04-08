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
OVERVIEW="OVERVIEW"
PRODUCT="PRODUCT"
TOOLGUIDE="TOOLGUIDE" # Tool Guide
TUTORIAL="TUTORIAL"

# Labels (topics)
ADS="Ads"
DEBUGGING="Debugging"
BASIC_CPP="Basic Concepts" # C/C++ Beginner's Guides
BLUETOOTH="Bluetooth"
CUSTOMERS="Customers"
CAMERA="Camera"
COLLECTIONS="Collections"
COMMUNICATION="Communication"
DATABASE="Database"
#DEVICE_PROFILES="Device Profiles"
ECLIPSE_IDE_USE="Using the MoSync IDE"
ECLIPSE_IDE_INSTALL="Installing the MoSync IDE"
EMULATORS="Emulators"
EVENTS="Event Handling"
EXTENSIONS="Extending MoSync SDK"
FONTS="Fonts"
GLOSSARY="Glossary"
GRAPHICS="Graphics"
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
RESOURCES="Resource Management"
ROADMAP="Roadmap"
SENSORS="Sensors"
SOUND="Sound"
STORAGE="Storage"
TESTING="Testing"
WEBUI="Web UI"
WORMHOLE="Wormhole"

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
["content/mosync-customers","overviews/mosync-customers",COMPANY,OVERVIEW,[CUSTOMERS]],
["content/mosync-roadmap","overviews/mosync-roadmap",COMPANY,OVERVIEW,[ROADMAP]],
["content/motooth","cpp/examples/motooth",CPP,EXAMPLE,[BLUETOOTH,COMMUNICATION]],
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
["content/using-mosync-reload","products/reload",RELOAD,PRODUCT,[]],
["content/using-mosync-visual-studio","tools/sdk/extensions/using-mosync-visual-studio",SDK,TOOLGUIDE,[EXTENSIONS]],
["content/whats-new-release-notes","home",REDIRECT],
["content/xml-soap-json","home",REDIRECT],
["contributions","tools/sdk/extensions/extending-mosync-sdk",SDK,
TOOLGUIDE,[EXTENSIONS]],
["documentation/architecture","home",REDIRECT],
["documentation/billing-app-purchases","home",REDIRECT],
["documentation/manualpage/emulating-device","tools/sdk/emulators/emulating-device",SDK,TOOLGUIDE,[EMULATORS]],
["documentation/manualpage/finalizing-applications","tools/sdk/ide/finalizing-applications",SDK,
TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpage/font-tools","cpp/guides/maui/font-tools",CPP,GUIDE,[MAUI,FONTS]],
["documentation/manualpage/installing-mosync","tools/sdk/ide/installing-mosync",SDK,TOOLGUIDE,[ECLIPSE_IDE_INSTALL]],
["documentation/manualpage/launching-mosync","tools/sdk/ide/launching-mosync",SDK,TOOLGUIDE,[ECLIPSE_IDE_INSTALL]],
["documentation/manualpage/mosync-glossary","cpp/guides/mosync-glossary",CPP,GUIDE,[GLOSSARY]],
["documentation/manualpage/resource-compiler-tutorial","tools/sdk/ide/resource-compiler-tutorial",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE,RESOURCES]],
["documentation/manualpage/using-device-profiles","tools/sdk/ide/using-device-profiles",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/accelerometeropengles","cpp/examples/",CPP,EXAMPLE,[SENSORS,OPENGL]],
["documentation/manualpages/adding-application-icons","tools/sdk/ide/adding-application-icons",SDK,TOOLGUIDE,[ECLIPSE_IDE_USE]],
["documentation/manualpages/application-profiling-mosync-emulator","tools/sdk/emulators/application-profiling-mosync-emulator",CPP,GUIDE,[EMULATORS]],
["documentation/manualpages/audio","cpp/guides/sound/audio",CPP,GUIDE,[SOUND]],
["documentation/manualpages/bluetoothclient","cpp/examples/bluetoothclient",CPP,EXAMPLE,[BLUETOOTH,COMMUNICATION]],
["documentation/manualpages/bluetoothserver","cpp/examples/bluetoothserver",CPP,EXAMPLE,[BLUETOOTH,COMMUNICATION]],
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
["documentation/manualpage/more-mosync-runtime-environment","tools/sdk/emulators/more-mosync-runtime-environment",SDK,TOOLGUIDE,[EMULATORS]],
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

["documentation/manualpages/","cpp/guides/",CPP,GUIDE,[]],
["documentation/manualpages/","cpp/guides/",CPP,GUIDE,[]],

["none","home",REDIRECT],
["none","home",REDIRECT],
["none","home",REDIRECT],


["documentation/tutorials/creating-new-fonts","cpp/guides/maui/creating-new-fonts",CPP,GUIDE,[MAUI,FONTS]]
]

puts($pages)
