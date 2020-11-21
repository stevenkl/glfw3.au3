;test.au3
#include <Array.au3>
#include <Date.au3>

#include "GLFW3.au3"

_glfwStartup(@ScriptDir & "\lib\glfw3_x86.dll")
If @error Then
    ConsoleWrite(StringFormat("[_glfwStartup] @error: %d, @extended: %d", @error, @extended) & @CRLF)
    Exit
EndIf
;==============================================================================
#Region Tests
TestConfigure("collection_name", "GLFW3")

#Region Test: _glfwGetVersion
Test("_glfwGetVersion")
$vTestResult = _glfwGetVersion()
If @error Or $vTestResult = False Then
    $vTestResult = StringFormat("<Error: @error = %d, @extended = %d>", @error, @extended)
    ConsoleWrite($vTestResult & @CRLF)
Else
    ConsoleWrite(StringFormat( _
        "[_glfwGetVersion] GLFW v.%d.%d.%d", _
        $vTestResult.major, _
        $vTestResult.minor, _
        $vTestResult.rev _
    ) & @CRLF)
EndIf
TestEnd()
#EndRegion Test: _glfwGetVersion

#Region Test: _glfwGetVersionString
Test("_glfwGetVersionString")
$vTestResult = _glfwGetVersionString()
If @error Or $vTestResult = False Then
    $vTestResult = StringFormat("<Error: @error = %d, @extended = %d>", @error, @extended)
    ConsoleWrite($vTestResult & @CRLF)
Else
    ConsoleWrite(StringFormat( _
        "[_glfwGetVersion] GLFW v.%s", _
        $vTestResult _
    ) & @CRLF)
    TestAssert('$vTestResult = "3.3.2 Win32 WGL EGL OSMesa MinGW DLL"')
EndIf
TestEnd()
#EndRegion Test: _glfwGetVersionString

TestFinish()
#EndRegion Tests
;==============================================================================
_glfwShutdown()
Exit

#Region Test Functions
Func TestConfigure($sOption, $vValue)

EndFunc


Func Test($sName)
    Global $__oResults
    If VarGetType($__oResults) <> "Object" Then
        Global $__oResults = ObjCreate("Scripting.Dictionary")
    EndIf

    If $__oResults.Exists($sName) Then
        ConsoleWriteError(StringFormat('Error: test case "%s" already exist!', $sName) & @CRLF)
        Exit
    EndIf

    Global $__bTestRunning = True
    Global $vTestResult = Null
    Global $__sCurrentTest = $sName
    Global $__oCurrentTest = ObjCreate("Scripting.Dictionary")
    $__oCurrentTest.Add("start_time", _NowCalc())
    $__oCurrentTest.Add("timer", TimerInit())

    ConsoleWrite(StringFormat( _
        "=======================================================================\n" & _
        "  Test: %s\n" & _
        "  Start-Time: %s\n" & _
        "=======================================================================\n", _
        $__sCurrentTest, _
        $__oCurrentTest("start_time") _
    ))

EndFunc


Func TestEnd()
    $__oCurrentTest.Add("timer_diff", TimerDiff($__oCurrentTest("timer")))
    $__oCurrentTest.Add("finish_time", _NowCalc())
    $__oCurrentTest.Add("result", $vTestResult)

    ConsoleWrite(StringFormat( _
        "=======================================================================\n" & _
        "  Finish-Time: %s\n" & _
        "\n\n", _
        $__sCurrentTest, _
        $__oCurrentTest("finish_time") _
    ))

    $__oResults.Add($__sCurrentTest, $__oCurrentTest)
    $__oCurrentTest = Null
EndFunc


Func TestFinish()
    Local $aTestCases = $__oResults.Keys()
    ;~ _ArrayDisplay($aTestCases)
EndFunc


Func TestAssert($sExpr, $sMsg = Default)
    local $result = Execute($sExpr)
    If $sMsg = Default Then
        $sMsg = StringFormat("Assert Failed! (%s)", $sExpr)
    EndIf
    If $result <> True Then
        ConsoleWrite($sMsg & @CRLF)
    EndIf
EndFunc
#EndRegion Test Functions