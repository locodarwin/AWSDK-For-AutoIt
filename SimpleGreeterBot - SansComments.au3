; A simple greeter bot example using AWSDK for AutoIt
; For AWSDK 100/101
; Modified by Locodarwin from the original "Greeter Bot" script posted to the Activeworlds ActiveWiki
; at http://wiki.activeworlds.com/index.php?title=SDK_Sample_Program_1


#include <AWSDK4AU_Constants.au3>
#include <AWSDK4AU_UDF.au3>
#include <AWSDK4AU_ReturnCodes.au3>


HotKeySet("+!q", "Quit")

Global $sLoginHost = "auth.activeworlds.com"
Global $sLoginPort = 6670
Global $sLoginAppName = "RowBot - The App"
Global $sLoginName = "RowBot"
Global $sLoginNumber = 654321
Global $sLoginPassword = "privpassword"
Global $sLoginDescription = "RowBot Rocks"
Global $sLoginWorld = "aw"
Global $iLoginX = 5000
Global $iLoginY = 0
Global $iLoginZ = 5000
Global $iLoginYaw = 0
Global $iLoginAV = 3


$hAW = _AWStartup(@ScriptDir & "\aw.dll")


$iRC = _AWInit($hAW, 100)
If $iRC Then
	ConsoleWrite("Unable to initialize API: " & _AWReturnReason($iRC))
	Exit
EndIf


$iRC = _AWEventSet($hAW, $AW_EVENT_AVATAR_ADD, "Event_Avatar_Add")
If $iRC Then
	ConsoleWrite("Unable to install event AW_EVENT_AVATAR_ADD: " & _AWReturnReason($iRC))
	Exit
EndIf


_AWEventSet($hAW, $AW_EVENT_CHAT, "Event_Chat")


$iRC = _AWCreate($hAW, $sLoginHost, $sLoginPort)
If $iRC Then
	ConsoleWrite("Unable to create instance: " & _AWReturnReason($iRC))
	Exit
EndIf


_AWIntSet($hAW, $AW_LOGIN_OWNER, $sLoginNumber)
_AWStringSet($hAW, $AW_LOGIN_PRIVILEGE_PASSWORD, $sLoginPassword)
_AWStringSet($hAW, $AW_LOGIN_APPLICATION, $sLoginAppName)
_AWStringSet($hAW, $AW_LOGIN_NAME, $sLoginName)


$iRC = _AWLogin($hAW)
If $iRC Then
	ConsoleWrite("Unable to log into universe: " & _AWReturnReason($iRC))
	Exit
EndIf


$iRC = _AWEnter($hAW, $sLoginWorld)
If $iRC Then
	ConsoleWrite("Unable to log into world: " & _AWReturnReason($iRC))
	Exit
EndIf


_AWIntSet($hAW, $AW_MY_X, $iLoginX)
_AWIntSet($hAW, $AW_MY_Y, $iLoginY)
_AWIntSet($hAW, $AW_MY_Z, $iLoginZ)
_AWIntSet($hAW, $AW_MY_YAW, $iLoginYaw)
_AWIntSet($hAW, $AW_MY_TYPE, $iLoginAV)

t.
$iRC = _AWStateChange($hAW)
If $iRC Then
	ConsoleWrite("Unable to change state: " & _AWReturnReason($iRC))
	Exit
EndIf


_AWSay($hAW, "Hello, world!")


While 1
	_AWWait($hAW, 100)
WEnd



Func Event_Avatar_Add()
	Local $sRet = _AWString($hAW, $AW_AVATAR_NAME)
	_AWSay($hAW, "Welcome, " & $sRet & "!")
EndFunc

Func Event_Chat()
	Local $sName = _AWString($hAW, $AW_AVATAR_NAME)
	Local $sMessage = _AWString($hAW, $AW_CHAT_MESSAGE)
	Local $iChatType = _AWInt($hAW, $AW_CHAT_TYPE)
	Local $iSession = _AWInt($hAW, $AW_CHAT_SESSION)

	If $iChatType = $AW_CHAT_SAID or $iChatType = $AW_CHAT_BROADCAST Then
		If $sMessage = "bot, please leave" Then
			_AWSay($hAW, "Ok, " & $sName & ", I'm leaving.")
			Quit()
		EndIf
	EndIf

	If $iChatType = $AW_CHAT_WHISPER Then
		$iStat = _AWWhisper($hAW, $iSession, "Hello, " & $sName & "!")
	EndIf
EndFunc

Func Quit()
	_AWSay($hAW, "Goodbye, cruel world!")
	_AWDestroy($hAW)
	_AWTerm($hAW)
	Exit
EndFunc