# Page table . mapping old to new pages plus page 

# Main documentation categories
CPP="CPP"
JS="JS"
MOSYNC="MOSYNC"
RELOAD="RELOAD"
SDK="SDK"
# Do not create the target page. Used for redirect from old site.
REDIRECT="REDIRECT"

# Documentation types
EXAMPLE="EXAMPLE"
GUIDE="GUIDE"
TUTORIAL="TUTORIAL"
OVERVIEW="OVERVIEW"
PRODUCT="PRODUCT"
TOOL="TOOL"

# Topics (labels)
ADS="Adverticement"
DEBUG="Debugging"
BASICCPP="C/C++ Basic Concepts" # C/C++ Beginner's Guides
BLUETOOTH="Bluetooth"
COMPANY="Company Info"
EMULATORS="Emulators"
EVENTS="Event Handling"
EXTEND_SDK="Extending MoSync SDK"
FONTS="Fonts"
GRAPHICS="Graphics"
IDE="MoSync IDE"
LIBS="Libraries"
LOCATION="Location"
LUA="Lua"
MAUI="MAUI"
MEMORY="Memory Management"
NETWORK="Networking"
SOUND="Sound"
TEST="Testing"
#WORMHOLE="Wormhole"

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
["content/connections","cpp/examples/connections",CPP,EXAMPLE,[NETWORK]],
["content/creating-html5javascript-apps","js/tutorials/quick-start/creating-your-first-javascript-app",REDIRECT],
["content/databases-stores-files-storage","home",REDIRECT],
["content/debugging","cpp/examples/debugging",CPP,EXAMPLE,[DEBUG]],
["content/debugging-testing-performance","home",REDIRECT],
["content/developing-application-using-maui","cpp/guides/maui/gui-based-applications-with-maui",CPP,GUIDE,[MAUI]],
["content/developing-classic-procedural-applications","cpp/tutorials/basic/classic-procedural-applications",CPP,TUTORIAL,[BASICCPP]],
["content/developing-event-driven-object-oriented-applications","cpp/tutorials/basic/event-driven-object-oriented-applications",CPP,TUTORIAL,[BASICCPP]],
["content/events-keys-touch-moblets","home",REDIRECT],
["content/example-application-descriptions","home",REDIRECT],
["content/extending-html5-apps-lua","js/tutorials/lua/extending-html5-apps-lua",JS,TUTORIAL,[LUA]],
["content/facebook-wikipedia-twitter","home",REDIRECT],
["content/fonts","home",REDIRECT],
["content/graphics-drawing-opengl-es","home",REDIRECT],
["content/hellomoblet","cpp/examples/hellomoblet",CPP,EXAMPLE,[BASICCPP]],
["content/html5-javascript-wormhole","js/guides/libs/html5-javascript-wormhole",JS,GUIDE,[LIBS]],
["content/location-gps","cpp/examples/location-gps",CPP,EXAMPLE,[LOCATION]],
["content/location-gps-maps-0","home",REDIRECT],
["content/mastx","cpp/examples/mastx",CPP,EXAMPLE,[MEMORY]],
["content/memory-heap-stack-0","home",REDIRECT],
["content/mosketch-0","cpp/examples/mosketch",CPP,EXAMPLE,[GRAPHICS]],
["content/mosound","cpp/examples/mosound",CPP,EXAMPLE,[SOUND]],
["content/mosync-customers","overviews/mosync-customers",MOSYNC,OVERVIEW,[]],
["content/mosync-roadmap","overview/mosync-roadmap",MOSYNC,OVERVIEW,[]],
["content/motooth","cpp/examples/motooth",CPP,EXAMPLE,[NETWORK,BLUETOOTH]],
["content/motris-0","cpp/examples/motris",CPP,EXAMPLE,[GRAPHICS]],
["content/notifications-1","home",REDIRECT],
["content/otaload","cpp/examples/otaload",CPP,EXAMPLE,[NETWORK]],
["content/pim-contacts","home",REDIRECT],
["content/platforms-devices-profiles","home",REDIRECT],
["content/programming-mosync","home",REDIRECT],
["content/resources-binaries-placeholders-0","home",REDIRECT],
["content/screencasts","screencasts",REDIRECT],
["content/sensors-orientation-nfc","home",REDIRECT],
["content/simple","cpp/examples/simple",CPP,EXAMPLE,[EVENTS]],
["content/standard-cc-libraries-0","cpp/guides/standard-cc-libraries",CPP,GUIDE,[LIBS]],
["content/stylus","cpp/examples/stylus",CPP,EXAMPLE,[GRAPHICS]],
["content/timer","cpp/examples/timer",CPP,EXAMPLE,[EVENTS]],
["content/unit-test","cpp/examples/unit-test",CPP,EXAMPLE,[TEST]],
["content/user-interfaces-nativeui-maui-0","home",REDIRECT],
["content/using-mosync-ide-2","home",REDIRECT],
["content/using-mosync-reload","js/tutorials/quick-start/",REDIRECT],
["content/using-mosync-reload","products/reload",RELOAD,PRODUCT,[]],
["content/using-mosync-visual-studio","tools/sdk/extend/using-mosync-visual-studio",SDK,TOOL,[EXTEND_SDK]],
["content/whats-new-release-notes","home",REDIRECT],
["content/xml-soap-json","home",REDIRECT],
["contributions","tools/sdk/extend/extending-mosync-sdk",SDK,TOOL,[EXTEND_SDK]],
["documentation/architecture","home",REDIRECT],
["documentation/billing-app-purchases","home",REDIRECT],
["documentation/manualpage/emulating-device","tools/emulators",SDK,TOOL,[EMULATORS]],
["documentation/manualpage/finalizing-applications","tools/sdk/ide/finalizing-applications",SDK,TOOL,[IDE]],

["none","home",REDIRECT],

["content/development-models","cpp/tutorials/basic/development-models",CPP,TUTORIAL,[BASICCPP]],

["documentation/tutorials/creating-new-fonts","cpp/guides/maui/creating-new-fonts",CPP,GUIDE,[MAUI,FONTS]]
]
