#cs

AWSDK For AutoIt v1.0 - AWSDK4AU_UDF.au3

Copyright (c) 2017 Locodarwin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

#ce

#include-once

#cs
--------- Implemented later:
aw_data
aw_data_set
--------- Will not be implemented:
aw_zip
aw_unzip
#ce


#cs
AW SDK Methods:

---------------------------------------------A
;    Aw address
;    Aw avatar click
;    Aw avatar location
;    Aw avatar reload
;    Aw avatar set

---------------------------------------------B
;    Aw bool
;    Aw bool set
;    Aw botgram send
;    Aw botmenu send

---------------------------------------------C
;    Aw callback
;    Aw callback set
;    Aw camera set
;    Aw cav change
;    Aw cav delete
;    Aw cav request
;    Aw cell next
;    Aw check right
;    Aw check right all
;    Aw citizen add
;    Aw citizen attributes by name
;    Aw citizen attributes by number
;    Aw citizen change
;    Aw citizen delete
;    Aw citizen next
;    Aw citizen previous
;    Aw console message
;    Aw create
    Aw create resolved

---------------------------------------------D
    Aw data
    Aw data set
;    Aw delete all objects
;    Aw destroy

---------------------------------------------E
;    Aw enter
;    Aw event
;    Aw event set
;    Aw exit

---------------------------------------------F
;    Aw float
;    Aw float set

---------------------------------------------H
;    Aw has world right
;    Aw has world right all
;    Aw hud clear
;    Aw hud click
;    Aw hud create
;    Aw hud destroy

---------------------------------------------I
;    Aw init
;    Aw init bind
;    Aw instance					---- May not work, because of handle type - make sure to test
;    Aw instance callback set
;    Aw instance event set
;    Aw instance set				---- May not work, because of handle type - make sure to test
;    Aw int
;    Aw int set

---------------------------------------------L
;    Aw laser beam
;    Aw license add
;    Aw license attributes
;    Aw license change
;    Aw license delete
;    Aw license next
;    Aw license previous
;    Aw login

---------------------------------------------M
;    Aw mover links
;    Aw mover rider add
;    Aw mover rider change
;    Aw mover rider delete
;    Aw mover set position
;    Aw mover set state

---------------------------------------------N
;    Aw noise

---------------------------------------------O
;    Aw object add
;    Aw object bump
;    Aw object change
;    Aw object click
;    Aw object delete
;    Aw object load
;    Aw object query
;    Aw object select

---------------------------------------------Q
;    Aw query						----- Not sure if this will work - may need a DllStruct
;    Aw query 5x5					----- Not sure if this will work - may need a DllStruct

---------------------------------------------R
;    Aw random

---------------------------------------------S
;    Aw say
;    Aw sector from cell
;    Aw server admin
;    Aw server world add
;    Aw server world change
;    Aw server world delete
;    Aw server world instance add
;    Aw server world instance delete
;    Aw server world instance set
;    Aw server world list
;    Aw server world set
;    Aw server world start
;    Aw server world stop
;    Aw session
;    Aw state change
;    Aw string
    Aw string from unicode
;    Aw string set
    Aw string set MBCS codepage
    Aw string to unicode

---------------------------------------------T
;    Aw teleport
;    Aw term
;    Aw terrain delete all
;    Aw terrain load node
;    Aw terrain next
;    Aw terrain query
;    Aw terrain set
;    Aw tick
;    Aw toolbar click
    Aw traffic count

---------------------------------------------U
;    Aw universe attributes change
;    Aw universe ejection add
;    Aw universe ejection delete
;    Aw universe ejection lookup
;    Aw universe ejection next
;    Aw universe ejection previous
##    Aw unzip
;    Aw url click
;    Aw url send
;    Aw user data
;    Aw user data set
;    Aw user list

---------------------------------------------W
;    Aw wait
;    Aw whisper
;    Aw world attribute get				------------ needs testing and may not work as-is, see the function's comments
;    Aw world attribute set
;    Aw world attributes change
;    Aw world attributes reset
;    Aw world attributes send
;    Aw world cav change
;    Aw world cav delete
;    Aw world cav request
;    Aw world eject
;    Aw world ejection add
;    Aw world ejection delete
;    Aw world ejection lookup
;    Aw world ejection next
;    Aw world ejection previous
;    Aw world instance get
;    Aw world instance set
;    Aw world list
;    Aw world reload registry

---------------------------------------------Z
##    Aw zip

#ce

Func _AWStartup($sPath)
	Local $hDLL = DllOpen($sPath)
	Return $hDLL
EndFunc

Func _AWAddress($hDLL, $iSession)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_address", "int", $iSession)
	Return $iRet[0]
EndFunc

Func _AWAvatarClick($hDLL, $iSession)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_avatar_click", "int", $iSession)
	Return $iRet[0]
EndFunc

Func _AWAvatarSet($hDLL, $iSession)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_avatar_set", "int", $iSession)
	Return $iRet[0]
EndFunc

Func _AWAvatarLocation($hDLL, $iCitNum, $iSession, $sAVName)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_avatar_location", "ptr", $iCitNum, "ptr", 0, "str*", $sAVName)
	Return $iRet[0]
EndFunc

Func _AWAvatarReload($hDLL, $iCitNum, $iSession) ; only one of the two args can be used, the other must be zero
	$iRet = DllCall($hDLL, "int:cdecl", "aw_avatar_reload", "int", $iCitNum, "int", $iSession)
	Return $iRet[0]
EndFunc

Func _AWBoolSet($hDLL, $iBool, $iValue)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_bool_set", "int", $iBool, "int", $iValue)
	Return $iRet[0]
EndFunc

Func _AWBool($hDLL, $iIntType)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_bool", "int", $iIntType)
	Return $sRet[0]
EndFunc

Func _AWBotgramSend($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_botgram_send")
	Return $iRet[0]
EndFunc

Func _AWBotmenuSend($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_botmenu_send")
	Return $iRet[0]
EndFunc

Func _AWCallback($hDLL, $iCallbackType)
	$iRet = DllCall($hDLL, "ptr:cdecl", "aw_callback", "int", Number($iCallbackType))
	Return $iRet[0]
EndFunc

Func _AWCallbackSet($hDLL, $iCallbackType, $sCallbackFunction)
	Local $hHandle = DllCallbackRegister($sCallbackFunction, "none:cdecl", "")
	Local $hCallBack = DllCallbackGetPtr($hHandle)
	Local $hCallbackSet = DllCall($hDLL, "int:cdecl", "aw_callback_set", "int", Number($iCallbackType), "wparam", $hCallBack)
	Return $hCallbackSet[0]
EndFunc

Func _AWCameraSet($hDLL, $iSession)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_camera_set", "int", $iSession)
	Return $iRet[0]
EndFunc

Func _AWCavChange($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_cav_change")
	Return $iRet[0]
EndFunc

Func _AWCavDelete($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_cav_delete")
	Return $iRet[0]
EndFunc

Func _AWCavRequest($hDLL, $iCitizen, $iSession)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_cav_request", "int", $iCitizen, "int", $iSession)
	Return $iRet[0]
EndFunc

Func _AWCellNext($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_cell_next")
	Return $iRet[0]
EndFunc

Func _AWCheckRight($hDLL, $iCitizen, $sRightsList)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_check_right", "int", $iCitizen, "str", $sRightsList)
	Return $iRet[0]
EndFunc

Func _AWCheckRightAll($hDLL, $sRightsList)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_check_right_all", "str", $sRightsList)
	Return $iRet[0]
EndFunc

Func _AWCitizenAdd($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_citizen_add")
	Return $iRet[0]
EndFunc

Func _AWCitizenAttributesByName($hDLL, $sName)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_citizen_attributes_by_name", "str", $sName)
	Return $iRet[0]
EndFunc

Func _AWCitizenAttributesByNumber($hDLL, $iNumber)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_citizen_attributes_by_number", "int", $iNumber)
	Return $iRet[0]
EndFunc

Func _AWCitizenChange($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_citizen_change")
	Return $iRet[0]
EndFunc

Func _AWCitizenDelete($hDLL, $iCitnum)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_citizen_delete", "int", $iCitnum)
	Return $iRet[0]
EndFunc

Func _AWCitizenNext($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_citizen_next")
	Return $iRet[0]
EndFunc

Func _AWCitizenPrevious($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_citizen_previous")
	Return $iRet[0]
EndFunc

Func _AWConsoleMessage($hDLL, $iSession)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_console_message", "int", $iSession)
	Return $iRet[0]
EndFunc

; int aw_create (char *domain, int port, void **instance)
Func _AWCreate($hDLL, $sLoginHost, $sLoginPort, $hInstance = 0)
	Local $iCreate = DllCall($hDLL, "int:cdecl", "aw_create", "str", $sLoginHost, "int", $sLoginPort, "int", $hInstance)
	Return $iCreate[0]
EndFunc

; int aw_create_resolved (unsigned long address, int port, void **instance)



Func _AWDeleteAllObjects($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_delete_all_objects")
	Return $iRet[0]
EndFunc

Func _AWDestroy($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_destroy")
	Return $iRet[0]
EndFunc

Func _AWEnter($hDLL, $sWorld)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_enter", "str", $sWorld)
	Return $iRet[0]
EndFunc

Func _AWExit($hDLL)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_exit")
	Return $iRet[0]
EndFunc

Func _AWEvent($hDLL, $iEventType)
	$iRet = DllCall($hDLL, "ptr:cdecl", "aw_event", "int", Number($iEventType))
	Return $iRet[0]
EndFunc

; _AWEventSet($hAW, $AW_EVENT_CHAT, "_AW_EVENT_CHAT")
Func _AWEventSet($hDLL, $iEventType, $sEventFunction)
	Local $hHandle = DllCallbackRegister($sEventFunction, "none:cdecl", "")
	Local $hCallBack = DllCallbackGetPtr($hHandle)
	Local $hEventSet = DllCall($hDLL, "int:cdecl", "aw_event_set", "int", Number($iEventType), "wparam", $hCallBack)
	Return $hEventSet[0]
EndFunc

Func _AWFloatSet($hDLL, $iFloat, $fValue)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_float_set", "int", $iFloat, "float", $fValue)
	Return $iRet[0]
EndFunc

Func _AWFloat($hDLL, $iIntType)
	Local $sRet = DllCall($hDLL, "float:cdecl", "aw_float", "int", $iIntType)
	Return $sRet[0]
EndFunc

Func _AWHasWorldRight($hDLL, $iCitizen, $awRight)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_has_world_right", "int", $iCitizen, "int", $awRight)
	Return $iRet[0]
EndFunc

Func _AWHasWorldRightAll($hDLL, $awRight)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_has_world_right_all", "int", $awRight)
	Return $iRet[0]
EndFunc

Func _AWHudCreate($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_hud_create")
	Return $iRet[0]
EndFunc

Func _AWHudClear($hDLL, $iSession)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_hud_clear", "int", $iSession)
	Return $iRet[0]
EndFunc

Func _AWHudDestroy($hDLL, $iSession, $iID)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_hud_destroy", "int", $iSession, "int", $iID)
	Return $iRet[0]
EndFunc

Func _AWHudClick($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_hud_click")
	Return $iRet[0]
EndFunc

Func _AWInit($hDLL, $iBuild)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_init", "int", Number($iBuild))
	Return $iRet[0]
EndFunc

Func _AWInitBind($hDLL, $iBuild, $sIP)
	Local $ulong = _AWIpToUint($sIP)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_init_bind", "int", Number($iBuild), "ulong", $ulong)
	Return $iRet[0]
EndFunc

Func _AWInstance($hDLL)
	$iRet = DllCall($hDLL, "ptr:cdecl", "aw_instance")
	Return $iRet[0]
EndFunc

Func _AWInstanceCallbackSet($hDLL, $iCallbackType, $sCallbackFunction)
	Local $hHandle = DllCallbackRegister($sCallbackFunction, "none:cdecl", "")
	Local $hCallBack = DllCallbackGetPtr($hHandle)
	Local $hCallbackSet = DllCall($hDLL, "int:cdecl", "aw_instance_callback_set", "int", Number($iCallbackType), "wparam", $hCallBack)
	Return $hCallbackSet[0]
EndFunc

Func _AWInstanceEventSet($hDLL, $iEventType, $sEventFunction)
	Local $hHandle = DllCallbackRegister($sEventFunction, "none:cdecl", "")
	Local $hCallBack = DllCallbackGetPtr($hHandle)
	Local $hEventSet = DllCall($hDLL, "int:cdecl", "aw_instance_event_set", "int", Number($iEventType), "wparam", $hCallBack)
	Return $hEventSet[0]
EndFunc

Func _AWInstanceSet($hDLL, $ptrInstance)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_instance_set", "ptr", $ptrInstance)
	Return $iRet[0]
EndFunc

Func _AWIntSet($hDLL, $iInteger, $iValue)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_int_set", "int", $iInteger, "int", $iValue)
	Return $iRet[0]
EndFunc

Func _AWInt($hDLL, $iIntType)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_int", "int", $iIntType)
	Return $sRet[0]
EndFunc

Func _AWLaserBeam($hDLL)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_laser_beam")
	Return $iRet[0]
EndFunc

Func _AWLicenseAdd($hDLL)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_license_add")
	Return $iRet[0]
EndFunc

Func _AWLicenseAttributes($hDLL, $sWorldName)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_license_attributes", "str", $sWorldName)
	Return $sRet[0]
EndFunc

Func _AWLicenseChange($hDLL)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_license_change")
	Return $iRet[0]
EndFunc

Func _AWLicenseDelete($hDLL, $sWorldName)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_license_delete", "str", $sWorldName)
	Return $sRet[0]
EndFunc

Func _AWLicenseNext($hDLL)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_license_next")
	Return $iRet[0]
EndFunc

Func _AWLicensePrevious($hDLL)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_license_previous")
	Return $iRet[0]
EndFunc

Func _AWLogin($hDLL)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_login")
	Return $iRet[0]
EndFunc

Func _AWMoverLinks($hDLL, $iId)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_mover_links", "int", $iId)
	Return $sRet[0]
EndFunc

; aw_mover_rider_add (int id, int session, int dist, int angle, int y_delta, int yaw_delta, int pitch_delta)
Func _AWMoverRiderAdd($hDLL, $iId, $iSession, $iDist, $iAngle, $iYDelta, $iYawDelta, $iPitchDelta)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_mover_rider_add", "int", $iId, "int", $iSession, "int", $iDist, "int", $iAngle, "int", $iYDelta, "int", $iYawDelta, "int", $iPitchDelta)
	Return $sRet[0]
EndFunc

; aw_mover_rider_change (int id, int session, int dist, int angle, int y_delta, int yaw_delta, int pitch_delta)
Func _AWMoverRiderChange($hDLL, $iId, $iSession, $iDist, $iAngle, $iYDelta, $iYawDelta, $iPitchDelta)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_mover_rider_change", "int", $iId, "int", $iSession, "int", $iDist, "int", $iAngle, "int", $iYDelta, "int", $iYawDelta, "int", $iPitchDelta)
	Return $sRet[0]
EndFunc

Func _AWMoverRiderDelete($hDLL, $iId, $iSession)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_mover_rider_delete", "int", $iId, "int", $iSession)
	Return $sRet[0]
EndFunc

; aw_mover_set_position (int id, int x, int y, int z, int yaw, int pitch, int roll)
Func _AWMoverSetPosition($hDLL, $iId, $iX, $iY, $iZ, $iYaw, $iPitch, $iRoll)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_mover_set_position", "int", $iId, "int", $iX, "int", $iY, "int", $iZ, "int", $iYaw, "int", $iPitch, "int", $iRoll)
	Return $sRet[0]
EndFunc

; aw_mover_set_state (int id, int state, int model_num)
Func _AWMoverSetState($hDLL, $iId, $iState, $iModelNum)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_mover_set_state", "int", $iId, "int", $iState, "int", $iModelNum)
	Return $sRet[0]
EndFunc

Func _AWNoise($hDLL, $iSession)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_noise", "int", $iSession)
	Return $iRet[0]
EndFunc

Func _AWObjectAdd($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_object_add")
	Return $iRet[0]
EndFunc

Func _AWObjectBump($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_object_bump")
	Return $iRet[0]
EndFunc

Func _AWObjectChange($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_object_change")
	Return $iRet[0]
EndFunc

Func _AWObjectCick($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_object_click")
	Return $iRet[0]
EndFunc

Func _AWObjectDelete($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_object_delete")
	Return $iRet[0]
EndFunc

Func _AWObjectLoad($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_object_load")
	Return $iRet[0]
EndFunc

Func _AWObjectQuery($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_object_query")
	Return $iRet[0]
EndFunc

Func _AWObjectSelect($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_object_select")
	Return $iRet[0]
EndFunc

; int aw_query (int x_sector, int z_sector, int sequence[3][3])
Func _AWQuery($hDLL, $iXSector, $iZSector, $aSeq)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_query", "int", $iXSector, "int", $iZSector, "int[3][3]", $aSeq)
	Return $iRet[0]
EndFunc

; int aw_query_5x5 (int x_sector, int z_sector, int sequence[5][5])
Func _AWQuery5x5($hDLL, $iXSector, $iZSector, $aSeq)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_query_5x5", "int", $iXSector, "int", $iZSector, "int[5][5]", $aSeq)
	Return $iRet[0]
EndFunc

Func _AWRandom($hDLL)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_random")
	Return $iRet[0]
EndFunc

Func _AWSay($hDLL, $sMessage)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_say", "str", $sMessage)
	Return $iRet[0]
EndFunc

Func _AWSectorFromCell($hDLL, $iCell)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_sector_from_cell", "int", $iCell)
	Return $sRet[0]
EndFunc

; int aw_server_admin (const char *domain, int port, char *password, void **instance)
Func _AWServerAdmin($hDLL, $sLoginHost, $sLoginPort, $sPassword, $hInstance = 0)
	Local $iCreate = DllCall($hDLL, "int:cdecl", "aw_server_admin", "str", $sLoginHost, "int", $sLoginPort, "str", $sPassword, "int", $hInstance)
	Return $iCreate[0]
EndFunc

Func _AWServerWorldAdd($hDLL)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_server_world_add")
	Return $iRet[0]
EndFunc

Func _AWServerWorldChange($hDLL, $iID)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_server_world_change", "int", $iID)
	Return $sRet[0]
EndFunc

Func _AWServerWorldDelete($hDLL, $iID)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_server_world_delete", "int", $iID)
	Return $sRet[0]
EndFunc

Func _AWServerWorldInstanceAdd($hDLL, $iID, $iInstanceID)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_server_world_instance_add", "int", $iID, "int", $iInstanceID)
	Return $sRet[0]
EndFunc

Func _AWServerWorldInstanceDelete($hDLL, $iID, $iInstanceID)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_server_world_instance_delete", "int", $iID, "int", $iInstanceID)
	Return $sRet[0]
EndFunc

Func _AWServerWorldInstanceSet($hDLL, $iID)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_server_world_instance_set", "int", $iID)
	Return $sRet[0]
EndFunc

Func _AWServerWorldList($hDLL)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_server_world_list")
	Return $iRet[0]
EndFunc

Func _AWServerWorldSet($hDLL, $iID)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_server_world_set", "int", $iID)
	Return $sRet[0]
EndFunc

Func _AWServerWorldStart($hDLL, $iID)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_server_world_start", "int", $iID)
	Return $sRet[0]
EndFunc

Func _AWServerWorldStop($hDLL, $iID)
	Local $sRet = DllCall($hDLL, "int:cdecl", "aw_server_world_stop", "int", $iID)
	Return $sRet[0]
EndFunc

Func _AWSession($hDLL)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_session")
	Return $iRet[0]
EndFunc

Func _AWStateChange($hDLL)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_state_change")
	Return $iRet[0]
EndFunc

Func _AWString($hDLL, $iStringType)
	Local $sRet = DllCall($hDLL, "str:cdecl", "aw_string", "int", $iStringType)
	Return $sRet[0]
EndFunc

Func _AWStringSet($hDLL, $iString, $sValue)
	Local $iRet = DllCall($hDLL, "int:cdecl", "aw_string_set", "int", $iString, "str", $sValue)
	Return $iRet[0]
EndFunc

Func _AWTeleport($hDLL, $iSession)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_teleport", "int", $iSession)
	Return $iRet[0]
EndFunc

Func _AWTerm($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_term")
	Return $iRet[0]
EndFunc

Func _AWTerrainDeleteAll($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_terrain_delete_all")
	Return $iRet[0]
EndFunc

Func _AWTerrainLoadNode($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_terrain_load_node")
	Return $iRet[0]
EndFunc

Func _AWTerrainNext($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_terrain_next")
	Return $iRet[0]
EndFunc

Func _AWTerrainQuery($hDLL, $iPageX, $iPageZ, $ulSequence)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_terrain_query", "int", $iPageX, "int", $iPageZ, "ulong", $ulSequence)
	Return $iRet[0]
EndFunc

Func _AWTerrainSet($hDLL, $iCellX, $iCellZ, $iCount, $iHeights)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_terrain_set", "int", $iCellX, "int", $iCellZ, "int", $iCount, "ptr", $iHeights)
	Return $iRet[0]
EndFunc

Func _AWTick($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_tick")
	Return $iRet[0]
EndFunc

Func _AWToolbarClick($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_toolbar_click")
	Return $iRet[0]
EndFunc

Func _AWUniverseAttributesChange($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_universe_attributes_change")
	Return $iRet[0]
EndFunc

Func _AWUniverseEjectionAdd($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_universe_ejection_add")
	Return $iRet[0]
EndFunc

Func _AWUniverseEjectionDelete($hDLL, $iAddress)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_teleport", "int", $iAddress)
	Return $iRet[0]
EndFunc

Func _AWUniverseEjectionLookup($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_universe_ejection_lookup")
	Return $iRet[0]
EndFunc

Func _AWUniverseEjectionNext($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_universe_ejection_next")
	Return $iRet[0]
EndFunc

Func _AWUniverseEjectionPrevious($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_universe_ejection_previous")
	Return $iRet[0]
EndFunc

Func _AWURLClick($hDLL, $sURL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_url_click", "char", $sURL)
	Return $iRet[0]
EndFunc

Func _AWURLSend($hDLL, $iSession, $sURL, $sTarget)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_url_send", "int", $iSession, "char", $sURL, "char", $sTarget)
	Return $iRet[0]
EndFunc

Func _AWUserData($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_user_data")
	Return $iRet[0]
EndFunc

Func _AWUserDataSet($hDLL, $iDataPTR)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_user_data_set", "int", $iDataPTR)
	Return $iRet[0]
EndFunc

Func _AWUserList($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_user_list")
	Return $iRet[0]
EndFunc

Func _AWWait($hDLL, $iMilliseconds)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_wait", "int", $iMilliseconds)
	Return $iRet[0]
EndFunc

Func _AWWhisper($hDLL, $iSession, $sMessage)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_whisper", "int", $iSession, "str", $sMessage)
	Return $iRet[0]
EndFunc

; Returns the value of the $sValue that should be returned by the function call - this needs testing and may not work as-is
Func _AWWorldAttributeGet($hDLL, $iAttribute, $iReadOnly = Null, $sValue = "")
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_attribute_get", "int", $iAttribute, "int", $iReadOnly, "str", $sValue)
	Return $iRet[3]
EndFunc

Func _AWWorldAttributeSet($hDLL, $iAttribute, $sValue)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_attribute_set", "int", $iAttribute, "str", $sValue)
	Return $iRet[0]
EndFunc

Func _AWWorldAttributesChange($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_attributes_change")
	Return $iRet[0]
EndFunc

Func _AWWorldAttributesReset($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_attributes_reset")
	Return $iRet[0]
EndFunc

Func _AWWorldAttributesSend($hDLL, $iSession)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_attributes_send", "int", $iSession)
	Return $iRet[0]
EndFunc

Func _AWWorldCavChange($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_cav_change")
	Return $iRet[0]
EndFunc

Func _AWWorldCavDelete($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_cav_delete")
	Return $iRet[0]
EndFunc

Func _AWWorldCavRequest($hDLL, $iCitnum, $iSession)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_cav_request", "int", $iCitnum, "int", $iSession)
	Return $iRet[0]
EndFunc

Func _AWWorldEject($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_eject")
	Return $iRet[0]
EndFunc

Func _AWWorldEjectionAdd($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_ejection_add")
	Return $iRet[0]
EndFunc

Func _AWWorldEjectionDelete($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_ejection_delete")
	Return $iRet[0]
EndFunc

Func _AWWorldEjectionLookup($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_ejection_lookup")
	Return $iRet[0]
EndFunc

Func _AWWorldEjectionNext($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_ejection_next")
	Return $iRet[0]
EndFunc

Func _AWWorldEjectionPrevious($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_ejection_previous")
	Return $iRet[0]
EndFunc

Func _AWWorldInstanceGet($hDLL, $iCitnum)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_instance_get", "int", $iCitnum)
	Return $iRet[0]
EndFunc

Func _AWWorldInstanceSet($hDLL, $iCitnum, $iID)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_instance_set", "int", $iCitnum, "int", $iID)
	Return $iRet[0]
EndFunc

Func _AWWorldList($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_list")
	Return $iRet[0]
EndFunc

Func _AWWorldReloadRegistry($hDLL)
	$iRet = DllCall($hDLL, "int:cdecl", "aw_world_reload_registry")
	Return $iRet[0]
EndFunc





; unofficial



; beef this one up with error checking - for each of the calls in the function, check for errors and then return error code
; with the call # that failed and the reason code for it
Func _AWObjectSpawn($hAW, $sModel, $sDesc, $sAction, $iX, $iY, $iZ, $iYaw, $iTilt, $iRoll)
	Local $rc
	_AWIntSet($hAW, $AW_OBJECT_X, $iX)
	_AWIntSet($hAW, $AW_OBJECT_Y, $iY)
	_AWIntSet($hAW, $AW_OBJECT_Z, $iZ)
	_AWIntSet($hAW, $AW_OBJECT_YAW, $iYaw)
	_AWIntSet($hAW, $AW_OBJECT_TILT, $iTilt)
	_AWIntSet($hAW, $AW_OBJECT_ROLL, $iRoll)
	_AWStringSet($hAW, $AW_OBJECT_MODEL, $sModel)
	_AWStringSet($hAW, $AW_OBJECT_DESCRIPTION, $sDesc)
	_AWStringSet($hAW, $AW_OBJECT_ACTION, $sAction)
	$rc = _AWObjectAdd($hAW)
	Return $rc
EndFunc

Func _AWIpToUint($sIPAddress)
	Local $addr = StringSplit($sIPAddress, ".")
	Local $ret = 0
    $ret += BitShift($addr[1], -24)
    $ret += BitShift($addr[2], -16)
    $ret += BitShift($addr[3], -8)
    $ret += $addr[4]
    Return StringFormat("%u", $ret)
EndFunc
