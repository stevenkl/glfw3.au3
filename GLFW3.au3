;*****************************************
;GLFW3.au3 by stevenkl
;Created with ISN AutoIt Studio v. 1.11
;*****************************************
#include-once
#include "GLFW3\GLFW3Constants.au3"


#Region Global UDF Variables
Global $__g_hGLFWDLL = -1
#EndRegion Global UDF Variables



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
    Local $tMajor = DllStructCreate("STRUCT;int;ENDSTRUCT")
    Local $tMinor = DllStructCreate("STRUCT;int;ENDSTRUCT")
	Local $tRev   = DllStructCreate("STRUCT;int;ENDSTRUCT")
    Local $DllResult = DllCall($__g_hGLFWDLL, _
        "none:cdecl", "glfwGetVersion", _
        "ptr", DllStructGetPtr($tMajor), _
        "ptr", DllStructGetPtr($tMinor), _
        "ptr", DllStructGetPtr($tRev) _
    )
    If @error Then
        Return SetError(@error, @extended, False)
    EndIf
	
    Local $tVersion = DllStructCreate("STRUCT;int major;int minor;int rev;ENDSTRUCT")
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


Func _glfwGetError(ByRef $sMsg)
	Local $tDesc = DllStructCreate("STRUCT;char*;ENDSTRUCT")
	Local $DllResult = DllCall($__g_hGLFWDLL, "int:cdecl", "glfwGetError", _
		"ptr", DllStructGetPtr($tDesc) _
	)
    If @error Then
        Return SetError(@error, @extended, False)
    EndIf
	If $sMsg <> Default And DllStructGetData($tDesc, 1) <> Null Then
		$sMsg = DllStructGetData($tDesc, 1)
	EndIf
    Return $DllResult[0]
EndFunc


Func _glfwSetErrorCallback($fCallback)
	Local $pCallbackPointer = DllCallbackRegister($fCallback, "none:cdecl", "int;str")
	Local $DllResult = DllCall($__g_hGLFWDLL, "ptr:cdecl", "glfwSetErrorCallback", _
		"ptr", DllCallbackGetPtr($pCallbackPointer) _
	)
	If @error Then
        Return SetError(@error, @extended, False)
    EndIf
    Return $DllResult[0]
EndFunc


#EndRegion Functions