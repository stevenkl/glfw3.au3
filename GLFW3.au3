;*****************************************
;GLFW3.au3 by stevenkl
;Created with ISN AutoIt Studio v. 1.11
;*****************************************
#include-once


#Region Global UDF Variables
Global $__g_hGLFWDLL = -1
#EndRegion Global UDF Variables

;=== Key and button actions ===
Global Const $GLFW_RELEASE = 0
Global Const $GLFW_PRESS   = 1
Global Const $GLFW_REPEAT  = 2

#Region Joystick hat states
Global Const $GLFW_HAT_CENTERED   = 0
Global Const $GLFW_HAT_UP         = 1
Global Const $GLFW_HAT_RIGHT      = 2
Global Const $GLFW_HAT_DOWN       = 4
Global Const $GLFW_HAT_LEFT       = 8
Global Const $GLFW_HAT_RIGHT_UP   = BitOR($GLFW_HAT_RIGHT, $GLFW_HAT_UP)
Global Const $GLFW_HAT_RIGHT_DOWN = BitOR($GLFW_HAT_RIGHT, $GLFW_HAT_DOWN)
Global Const $GLFW_HAT_LEFT_UP    = BitOR($GLFW_HAT_LEFT,  $GLFW_HAT_UP)
Global Const $GLFW_HAT_LEFT_DOWN  = BitOR($GLFW_HAT_LEFT,  $GLFW_HAT_DOWN)
#EndRegion Joystick hat states

#Region Keyboard Keys
Global Const $GLFW_KEY_UNKNOWN       = -1
Global Const $GLFW_KEY_SPACE         = 32
Global Const $GLFW_KEY_APOSTROPHE    = 39
Global Const $GLFW_KEY_COMMA         = 44
Global Const $GLFW_KEY_MINUS         = 45
Global Const $GLFW_KEY_PERIOD        = 46
Global Const $GLFW_KEY_SLASH         = 47
Global Const $GLFW_KEY_0             = 48
Global Const $GLFW_KEY_1             = 49
Global Const $GLFW_KEY_2             = 50
Global Const $GLFW_KEY_3             = 51
Global Const $GLFW_KEY_4             = 52
Global Const $GLFW_KEY_5             = 53
Global Const $GLFW_KEY_6             = 54
Global Const $GLFW_KEY_7             = 55
Global Const $GLFW_KEY_8             = 56
Global Const $GLFW_KEY_9             = 57
Global Const $GLFW_KEY_SEMICOLON     = 59
Global Const $GLFW_KEY_EQUAL         = 61
Global Const $GLFW_KEY_A             = 65
Global Const $GLFW_KEY_B             = 66
Global Const $GLFW_KEY_C             = 67
Global Const $GLFW_KEY_D             = 68
Global Const $GLFW_KEY_E             = 69
Global Const $GLFW_KEY_F             = 70
Global Const $GLFW_KEY_G             = 71
Global Const $GLFW_KEY_H             = 72
Global Const $GLFW_KEY_I             = 73
Global Const $GLFW_KEY_J             = 74
Global Const $GLFW_KEY_K             = 75
Global Const $GLFW_KEY_L             = 76
Global Const $GLFW_KEY_M             = 77
Global Const $GLFW_KEY_N             = 78
Global Const $GLFW_KEY_O             = 79
Global Const $GLFW_KEY_P             = 80
Global Const $GLFW_KEY_Q             = 81
Global Const $GLFW_KEY_R             = 82
Global Const $GLFW_KEY_S             = 83
Global Const $GLFW_KEY_T             = 84
Global Const $GLFW_KEY_U             = 85
Global Const $GLFW_KEY_V             = 86
Global Const $GLFW_KEY_W             = 87
Global Const $GLFW_KEY_X             = 88
Global Const $GLFW_KEY_Y             = 89
Global Const $GLFW_KEY_Z             = 90
Global Const $GLFW_KEY_LEFT_BRACKET  = 91
Global Const $GLFW_KEY_BACKSLASH     = 92
Global Const $GLFW_KEY_RIGHT_BRACKET = 93
Global Const $GLFW_KEY_GRAVE_ACCENT  = 96
Global Const $GLFW_KEY_WORLD_1       = 161
Global Const $GLFW_KEY_WORLD_2       = 162
Global Const $GLFW_KEY_ESCAPE        = 256
Global Const $GLFW_KEY_ENTER         = 257
Global Const $GLFW_KEY_TAB           = 258
Global Const $GLFW_KEY_BACKSPACE     = 259
Global Const $GLFW_KEY_INSERT        = 260
Global Const $GLFW_KEY_DELETE        = 261
Global Const $GLFW_KEY_RIGHT         = 262
Global Const $GLFW_KEY_LEFT          = 263
Global Const $GLFW_KEY_DOWN          = 264
Global Const $GLFW_KEY_UP            = 265
Global Const $GLFW_KEY_PAGE_UP       = 266
Global Const $GLFW_KEY_PAGE_DOWN     = 267
Global Const $GLFW_KEY_HOME          = 268
Global Const $GLFW_KEY_END           = 269
Global Const $GLFW_KEY_CAPS_LOCK     = 280
Global Const $GLFW_KEY_SCROLL_LOCK   = 281
Global Const $GLFW_KEY_NUM_LOCK      = 282
Global Const $GLFW_KEY_PRINT_SCREEN  = 283
Global Const $GLFW_KEY_PAUSE         = 284
Global Const $GLFW_KEY_F1            = 290
Global Const $GLFW_KEY_F2            = 291
Global Const $GLFW_KEY_F3            = 292
Global Const $GLFW_KEY_F4            = 293
Global Const $GLFW_KEY_F5            = 294
Global Const $GLFW_KEY_F6            = 295
Global Const $GLFW_KEY_F7            = 296
Global Const $GLFW_KEY_F8            = 297
Global Const $GLFW_KEY_F9            = 298
Global Const $GLFW_KEY_F10           = 299
Global Const $GLFW_KEY_F11           = 300
Global Const $GLFW_KEY_F12           = 301
Global Const $GLFW_KEY_F13           = 302
Global Const $GLFW_KEY_F14           = 303
Global Const $GLFW_KEY_F15           = 304
Global Const $GLFW_KEY_F16           = 305
Global Const $GLFW_KEY_F17           = 306
Global Const $GLFW_KEY_F18           = 307
Global Const $GLFW_KEY_F19           = 308
Global Const $GLFW_KEY_F20           = 309
Global Const $GLFW_KEY_F21           = 310
Global Const $GLFW_KEY_F22           = 311
Global Const $GLFW_KEY_F23           = 312
Global Const $GLFW_KEY_F24           = 313
Global Const $GLFW_KEY_F25           = 314
Global Const $GLFW_KEY_KP_0          = 320
Global Const $GLFW_KEY_KP_1          = 321
Global Const $GLFW_KEY_KP_2          = 322
Global Const $GLFW_KEY_KP_3          = 323
Global Const $GLFW_KEY_KP_4          = 324
Global Const $GLFW_KEY_KP_5          = 325
Global Const $GLFW_KEY_KP_6          = 326
Global Const $GLFW_KEY_KP_7          = 327
Global Const $GLFW_KEY_KP_8          = 328
Global Const $GLFW_KEY_KP_9          = 329
Global Const $GLFW_KEY_KP_DECIMAL    = 330
Global Const $GLFW_KEY_KP_DIVIDE     = 331
Global Const $GLFW_KEY_KP_MULTIPLY   = 332
Global Const $GLFW_KEY_KP_SUBTRACT   = 333
Global Const $GLFW_KEY_KP_ADD        = 334
Global Const $GLFW_KEY_KP_ENTER      = 335
Global Const $GLFW_KEY_KP_EQUAL      = 336
Global Const $GLFW_KEY_LEFT_SHIFT    = 340
Global Const $GLFW_KEY_LEFT_CONTROL  = 341
Global Const $GLFW_KEY_LEFT_ALT      = 342
Global Const $GLFW_KEY_LEFT_SUPER    = 343
Global Const $GLFW_KEY_RIGHT_SHIFT   = 344
Global Const $GLFW_KEY_RIGHT_CONTROL = 345
Global Const $GLFW_KEY_RIGHT_ALT     = 346
Global Const $GLFW_KEY_RIGHT_SUPER   = 347
Global Const $GLFW_KEY_MENU          = 348
Global Const $GLFW_KEY_LAST          = $GLFW_KEY_MENU
#EndRegion Keyboard Keys

#Region Modifier Keys
Global Const $GLFW_MOD_SHIFT     = 0x0001
Global Const $GLFW_MOD_CONTROL   = 0x0002
Global Const $GLFW_MOD_ALT       = 0x0004
Global Const $GLFW_MOD_SUPER     =  0x0008
Global Const $GLFW_MOD_CAPS_LOCK = 0x0010
Global Const $GLFW_MOD_NUM_LOCK  = 0x020
#EndRegion Modifier Keys

#Region Mouse Button IDs
Global Const $GLFW_MOUSE_BUTTON_1      = 0
Global Const $GLFW_MOUSE_BUTTON_2      = 1
Global Const $GLFW_MOUSE_BUTTON_3      = 2
Global Const $GLFW_MOUSE_BUTTON_4      = 3
Global Const $GLFW_MOUSE_BUTTON_5      = 4
Global Const $GLFW_MOUSE_BUTTON_6      = 5
Global Const $GLFW_MOUSE_BUTTON_7      = 6
Global Const $GLFW_MOUSE_BUTTON_8      = 7
Global Const $GLFW_MOUSE_BUTTON_LAST   = $GLFW_MOUSE_BUTTON_8
Global Const $GLFW_MOUSE_BUTTON_LEFT   = $GLFW_MOUSE_BUTTON_1
Global Const $GLFW_MOUSE_BUTTON_RIGHT  = $GLFW_MOUSE_BUTTON_2
Global Const $GLFW_MOUSE_BUTTON_MIDDLE = $GLFW_MOUSE_BUTTON_3
#EndRegion Mouse Button IDs

#Region Joystick IDs
Global Const $GLFW_JOYSTICK_1    = 0
Global Const $GLFW_JOYSTICK_2    = 1
Global Const $GLFW_JOYSTICK_3    = 2
Global Const $GLFW_JOYSTICK_4    = 3
Global Const $GLFW_JOYSTICK_5    = 4
Global Const $GLFW_JOYSTICK_6    = 5
Global Const $GLFW_JOYSTICK_7    = 6
Global Const $GLFW_JOYSTICK_8    = 7
Global Const $GLFW_JOYSTICK_9    = 8
Global Const $GLFW_JOYSTICK_10   = 9
Global Const $GLFW_JOYSTICK_11   = 10
Global Const $GLFW_JOYSTICK_12   = 11
Global Const $GLFW_JOYSTICK_13   = 12
Global Const $GLFW_JOYSTICK_14   = 13
Global Const $GLFW_JOYSTICK_15   = 14
Global Const $GLFW_JOYSTICK_16   = 15
Global Const $GLFW_JOYSTICK_LAST = $GLFW_JOYSTICK_16
#EndRegion Joystick IDs

#Region Gamepad Buttons
Global Const $GLFW_GAMEPAD_BUTTON_A            = 0
Global Const $GLFW_GAMEPAD_BUTTON_B            = 1
Global Const $GLFW_GAMEPAD_BUTTON_X            = 2
Global Const $GLFW_GAMEPAD_BUTTON_Y            = 3
Global Const $GLFW_GAMEPAD_BUTTON_LEFT_BUMPER  = 4
Global Const $GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER = 5
Global Const $GLFW_GAMEPAD_BUTTON_BACK         = 6
Global Const $GLFW_GAMEPAD_BUTTON_START        = 7
Global Const $GLFW_GAMEPAD_BUTTON_GUIDE        = 8
Global Const $GLFW_GAMEPAD_BUTTON_LEFT_THUMB   = 9
Global Const $GLFW_GAMEPAD_BUTTON_RIGHT_THUMB  = 10
Global Const $GLFW_GAMEPAD_BUTTON_DPAD_UP      = 11
Global Const $GLFW_GAMEPAD_BUTTON_DPAD_RIGHT   = 12
Global Const $GLFW_GAMEPAD_BUTTON_DPAD_DOWN    = 13
Global Const $GLFW_GAMEPAD_BUTTON_DPAD_LEFT    = 14
Global Const $GLFW_GAMEPAD_BUTTON_LAST         = $GLFW_GAMEPAD_BUTTON_DPAD_LEFT
Global Const $GLFW_GAMEPAD_BUTTON_CROSS        = $GLFW_GAMEPAD_BUTTON_A
Global Const $GLFW_GAMEPAD_BUTTON_CIRCLE       = $GLFW_GAMEPAD_BUTTON_B
Global Const $GLFW_GAMEPAD_BUTTON_SQUARE       = $GLFW_GAMEPAD_BUTTON_X
Global Const $GLFW_GAMEPAD_BUTTON_TRIANGLE     = $GLFW_GAMEPAD_BUTTON_Y
#EndRegion Gamepad Buttons

#Region Gamepad Axes
Global Const $GLFW_GAMEPAD_AXIS_LEFT_X        = 0
Global Const $GLFW_GAMEPAD_AXIS_LEFT_Y        = 1
Global Const $GLFW_GAMEPAD_AXIS_RIGHT_X       = 2
Global Const $GLFW_GAMEPAD_AXIS_RIGHT_Y       = 3
Global Const $GLFW_GAMEPAD_AXIS_LEFT_TRIGGER  = 4
Global Const $GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER = 5
Global Const $GLFW_GAMEPAD_AXIS_LAST          = $GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER
#EndRegion Gamepad Axes

#Region Error codes
Global Const $GLFW_NO_ERROR               = 0
Global Const $GLFW_NOT_INITIALIZED        = 0x00010001
Global Const $GLFW_NO_CURRENT_CONTEXT     = 0x00010002
Global Const $GLFW_INVALID_ENUM           = 0x00010003
Global Const $GLFW_INVALID_VALUE          = 0x00010004
Global Const $GLFW_OUT_OF_MEMORY          = 0x00010005
Global Const $GLFW_API_UNAVAILABLE        = 0x00010006
Global Const $GLFW_VERSION_UNAVAILABLE    = 0x00010007
Global Const $GLFW_PLATFORM_ERROR         = 0x00010008
Global Const $GLFW_FORMAT_UNAVAILABLE     = 0x00010009
Global Const $GLFW_NO_WINDOW_CONTEXT      = 0x0001000A
#EndRegion Error codes

#Region Window hints & attributes
Global Const $GLFW_FOCUSED                 = 0x00020001
Global Const $GLFW_ICONIFIED               = 0x00020002
Global Const $GLFW_RESIZABLE               = 0x00020003
Global Const $GLFW_VISIBLE                 = 0x00020004
Global Const $GLFW_DECORATED               = 0x00020005
Global Const $GLFW_AUTO_ICONIFY            = 0x00020006
Global Const $GLFW_FLOATING                = 0x00020007
Global Const $GLFW_MAXIMIZED               = 0x00020008
Global Const $GLFW_CENTER_CURSOR           = 0x00020009
Global Const $GLFW_TRANSPARENT_FRAMEBUFFER = 0x0002000A
Global Const $GLFW_HOVERED                 = 0x0002000B
Global Const $GLFW_FOCUS_ON_SHOW           = 0x0002000C
Global Const $GLFW_RED_BITS                = 0x00021001
Global Const $GLFW_GREEN_BITS              = 0x00021002
Global Const $GLFW_BLUE_BITS               = 0x00021003
Global Const $GLFW_ALPHA_BITS              = 0x00021004
Global Const $GLFW_DEPTH_BITS              = 0x00021005
Global Const $GLFW_STENCIL_BITS            = 0x00021006
Global Const $GLFW_ACCUM_RED_BITS          = 0x00021007
Global Const $GLFW_ACCUM_GREEN_BITS        = 0x00021008
Global Const $GLFW_ACCUM_BLUE_BITS         = 0x00021009
Global Const $GLFW_ACCUM_ALPHA_BITS        = 0x0002100A
Global Const $GLFW_AUX_BUFFERS             = 0x0002100B
Global Const $GLFW_STEREO                  = 0x0002100C
Global Const $GLFW_SAMPLES                 = 0x0002100D
Global Const $GLFW_SRGB_CAPABLE            = 0x0002100E
Global Const $GLFW_REFRESH_RATE            = 0x0002100F
Global Const $GLFW_DOUBLEBUFFER            = 0x00021010
#EndRegion Window hints & attributes

#Region Context hints
Global Const $GLFW_CLIENT_API               = 0x00022001
Global Const $GLFW_CONTEXT_VERSION_MAJOR    = 0x00022002
Global Const $GLFW_CONTEXT_VERSION_MINOR    = 0x00022003
Global Const $GLFW_CONTEXT_REVISION         = 0x00022004
Global Const $GLFW_CONTEXT_ROBUSTNESS       = 0x00022005
Global Const $GLFW_OPENGL_FORWARD_COMPAT    = 0x00022006
Global Const $GLFW_OPENGL_DEBUG_CONTEXT     = 0x00022007
Global Const $GLFW_OPENGL_PROFILE           = 0x00022008
Global Const $GLFW_CONTEXT_RELEASE_BEHAVIOR = 0x00022009
Global Const $GLFW_CONTEXT_NO_ERROR         = 0x0002200A
Global Const $GLFW_CONTEXT_CREATION_API     = 0x0002200B
Global Const $GLFW_SCALE_TO_MONITOR         = 0x0002200C
Global Const $GLFW_COCOA_RETINA_FRAMEBUFFER = 0x00023001
Global Const $GLFW_COCOA_FRAME_NAME         = 0x00023002
Global Const $GLFW_COCOA_GRAPHICS_SWITCHING = 0x00023003
Global Const $GLFW_X11_CLASS_NAME           = 0x00024001
Global Const $GLFW_X11_INSTANCE_NAME        = 0x00024002
#EndRegion Context hints

#Region Other hints
Global Const $GLFW_NO_API                 = 0
Global Const $GLFW_OPENGL_API             = 0x00030001
Global Const $GLFW_OPENGL_ES_API          = 0x00030002
Global Const $GLFW_NO_ROBUSTNESS          = 0
Global Const $GLFW_NO_RESET_NOTIFICATION  = 0x00031001
Global Const $GLFW_LOSE_CONTEXT_ON_RESET  = 0x00031002
Global Const $GLFW_OPENGL_ANY_PROFILE     = 0
Global Const $GLFW_OPENGL_CORE_PROFILE    = 0x00032001
Global Const $GLFW_OPENGL_COMPAT_PROFILE  = 0x00032002
Global Const $GLFW_CURSOR                 = 0x00033001
Global Const $GLFW_STICKY_KEYS            = 0x00033002
Global Const $GLFW_STICKY_MOUSE_BUTTONS   = 0x00033003
Global Const $GLFW_LOCK_KEY_MODS          = 0x00033004
Global Const $GLFW_RAW_MOUSE_MOTION       = 0x00033005
Global Const $GLFW_CURSOR_NORMAL          = 0x00034001
Global Const $GLFW_CURSOR_HIDDEN          = 0x00034002
Global Const $GLFW_CURSOR_DISABLED        = 0x00034003
Global Const $GLFW_ANY_RELEASE_BEHAVIOR   = 0
Global Const $GLFW_RELEASE_BEHAVIOR_FLUSH = 0x00035001
Global Const $GLFW_RELEASE_BEHAVIOR_NONE  = 0x00035002
Global Const $GLFW_NATIVE_CONTEXT_API     = 0x00036001
Global Const $GLFW_EGL_CONTEXT_API        = 0x00036002
Global Const $GLFW_OSMESA_CONTEXT_API     = 0x00036003

Global Const $GLFW_ARROW_CURSOR           = 0x00036001
Global Const $GLFW_IBEAM_CURSOR           = 0x00036002
Global Const $GLFW_CROSSHAIR_CURSOR       = 0x00036003
Global Const $GLFW_HAND_CURSOR            = 0x00036004
Global Const $GLFW_HRESIZE_CURSOR         = 0x00036005
Global Const $GLFW_VRESIZE_CURSOR         = 0x00036006
Global Const $GLFW_CONNECTED              = 0x00040001
Global Const $GLFW_DISCONNECTED           = 0x00040002
Global Const $GLFW_JOYSTICK_HAT_BUTTONS   = 0x00050001
Global Const $GLFW_COCOA_CHDIR_RESOURCES  = 0x00051001
Global Const $GLFW_COCOA_MENUBAR          = 0x00051002
Global Const $GLFW_DONT_CARE              = -1
#EndRegion Other hints

#Region Function pointers
    ; GLFWglproc    void*
    ; GLFWvkproc    void*
    ; GLFWmonitor   ptr
    ; GLFWwindow    ptr
    ; GLFWcursor    ptr
    ; GLFWerrorfun (int, str)
    ; GLFWwindowposfun (GLFWwindow*, int, int)
    ; GLFWwindowsizefun (GLFWwindow*,int,int)
    ; GLFWwindowclosefun (GLFWwindow*)
    ; GLFWwindowrefreshfun (GLFWwindow*)
    ; GLFWwindowfocusfun (GLFWwindow*, int)
    ; GLFWwindowiconifyfun (GLFWwindow*, int)
    ; GLFWwindowmaximizefun (GLFWwindow*, int)
    ; GLFWframebuffersizefun (GLFWwindow*, int, int)
    ; GLFWwindowcontentscalefun (GLFWwindow*, float, float)
    ; GLFWmousebuttonfun (GLFWwindow*, int, int, int)
    ; GLFWcursorposfun (GLFWwindow*, double, double)
    ; GLFWcursorenterfun (GLFWwindow*, int)
    ; GLFWscrollfun (GLFWwindow*, double, double)
    ; GLFWkeyfun (GLFWwindow*, int, int, int, int)
    ; GLFWcharfun (GLFWwindow*, unsigned int)
    ; GLFWcharmodsfun (GLFWwindow*, unsigned int, int)
    ; GLFWdropfun (GLFWwindow*, int, const char*[])
    ; GLFWmonitorfun (GLFWmonitor*, int)
    ; GLFWjoystickfun (int, int)
#EndRegion Function pointers

#Region structs
Global Const $tagGLFWvidmode = "STRUCT;int width;int height;int redBits;int greenBits;int blueBits;int refreshRate;ENDSTRUCT"
Global Const $tagGLFWgammaramp = "STRUCT;ushort* red;ushort* green;ushort* blue;uint size;ENDSTRUCT"
Global Const $tagGLFWimage = "STRUCT;int width;int height;ptr pixels;ENDSTRUCT"
Global Const $tagGLFWgamepadstate = "STRUCT;char buttons[15];float axes[6];ENDSTRUCT"
#EndRegion structs

#Region Startup/Shutdown Functions
Func _glfwStartup($sDll = "glfw3.dll")
    $__g_hGLFWDLL = DllOpen($sDll)
    If $__g_hGLFWDLL = -1 Then
        Return SetError(1, 0, False)
    EndIf
    Return True
EndFunc


Func _glfwShutdown()
    If $__g_hGLFWDLL <> -1 Then
        DllClose($__g_hGLFWDLL)
    EndIf
EndFunc
#EndRegion Startup/Shutdown Functions

#Region Functions
Func _glfwInit()
    Local $DllResult = DllCall($__g_hGLFWDLL, "none:cdecl", "glfwInit")
    If @error Then
        Return SetError(@error, @extended, False)
    EndIf
    Return True
EndFunc


Func _glfwTerminate()
    Local $DllResult = DllCall($__g_hGLFWDLL, "none:cdecl", "glfwTerminate")
    If @error Then
        Return SetError(@error, @extended, False)
    EndIf
    Return True
EndFunc


Func _glfwInitHint($iHint, $iValue)
    Local $DllResult = DllCall($__g_hGLFWDLL, _
        "none:cdecl", "glfwInitHint", _
        "int", $iHint, _
        "int", $iValue _
    )
    If @error Then
        Return SetError(@error, @extended, False)
    EndIf
    Return True
EndFunc


Func _glfwGetVersion()
    Local $tMajor = DllStructCreate("int")
    Local $tMinor = DllStructCreate("int")
    Local $tRev   = DllStructCreate("int")
    Local $DllResult = DllCall($__g_hGLFWDLL, _
        "none:cdecl", "glfwGetVersion", _
        "int", DllStructGetPtr($tMajor), _
        "int", DllStructGetPtr($tMinor), _
        "int", DllStructGetPtr($tRev) _
    )
    If @error Then
        Return SetError(@error, @extended, False)
    EndIf

    Local $tVersion = DllStructCreate("int major;int minor;int rev")
    DllStructSetData($tVersion, "major", DllStructGetData($tMajor, 1))
    DllStructSetData($tVersion, "minor", DllStructGetData($tMinor, 1))
    DllStructSetData($tVersion, "rev", DllStructGetData($tRev, 1))
    Return $tVersion
EndFunc


Func _glfwGetVersionString()
    Local $DllResult = DllCall($__g_hGLFWDLL, "str:cdecl", "glfwGetVersionString")
    If @error Then
        Return SetError(@error, @extended, False)
    EndIf
    Return $DllResult[0]
EndFunc



#EndRegion Functions