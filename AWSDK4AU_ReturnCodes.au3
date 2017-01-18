#cs

AWSDK For AutoIt v1.0 - AWSDK4AU_ReturnCodes.au3

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

Func _AWReturnReason($iCode)
Select
	Case $iCode = 0
		Return "Success"
	Case $iCode = 1
		Return "Citizenship Expired"
	Case $iCode = 2
		Return "Land Limit Exceeded"
	Case $iCode = 3
		Return "No Such Citizen"
	Case $iCode = 4
		Return "Message Length Bad"
	Case $iCode = 5
		Return "License Password Contains Space"
	Case $iCode = 6
		Return "License Password Too Long"
	Case $iCode = 7
		Return "License Password Too Short"
	Case $iCode = 8
		Return "License Range Too Large"
	Case $iCode = 9
		Return "License Range Too Small"
	Case $iCode = 10
		Return "License Users Too Large"
	Case $iCode = 11
		Return "License Users Too Small"
	Case $iCode = 12
		Return "License Contains Invalid Char"
	Case $iCode = 13
		Return "Invalid Password"
	Case $iCode = 14
		Return "Unable To Mail Back Number"
	Case $iCode = 15
		Return "License World Too Short"
	Case $iCode = 16
		Return "License World Too Long"
	Case $iCode = 17
		Return "Server Out Of Memory"
	Case $iCode = 20
		Return "Invalid World"
	Case $iCode = 21
		Return "Server Outdated"
	Case $iCode = 22
		Return "World Already Started"
	Case $iCode = 27
		Return "No Such World"
	Case $iCode = 31
		Return "Not Logged In"
	Case $iCode = 32
		Return "Unauthorized"
	Case $iCode = 33
		Return "World Already Exists"
	Case $iCode = 34
		Return "No Such License"
	Case $iCode = 39
		Return "Identity Already In Use"
	Case $iCode = 40
		Return "Unable To Report Location"
	Case $iCode = 41
		Return "Invalid Email"
	Case $iCode = 42
		Return "No Such Acting Citizen"
	Case $iCode = 43
		Return "Acting Password Invalid"
	Case $iCode = 45
		Return "Universe Full"
	Case $iCode = 46
		Return "Billing Timeout"
	Case $iCode = 47
		Return "Billing Receive Failed"
	Case $iCode = 48
		Return "Billing Response Invalid"
	Case $iCode = 55
		Return "Billing Rejected"
	Case $iCode = 56
		Return "Billing Blocked"
	Case $iCode = 57
		Return "Too Many Worlds"
	Case $iCode = 58
		Return "Must Upgrade"
	Case $iCode = 59
		Return "Bot Limit Exceeded"
	Case $iCode = 61
		Return "World Expired"
	Case $iCode = 62
		Return "Citizen Does Not Expire"
	Case $iCode = 64
		Return "License Starts With Number"
	Case $iCode = 66
		Return "No Such Ejection"
	Case $iCode = 67
		Return "No Such Session"
	Case $iCode = 69
		Return "Rejection Expired"
	Case $iCode = 70
		Return "Acting Citizen Expired"
	Case $iCode = 71
		Return "Already Started"
	Case $iCode = 72
		Return "World Running"
	Case $iCode = 73
		Return "World Not Set"
	Case $iCode = 74
		Return "No Such Cell"
	Case $iCode = 75
		Return "No Registry"
	Case $iCode = 76
		Return "Can't Open Registry"
	Case $iCode = 77
		Return "Citizen Disabled"
	Case $iCode = 78
		Return "World Disabled"
	Case $iCode = 79
		Return "Beta Required"
	Case $iCode = 80
		Return "Acting Citizen Disabled"
	Case $iCode = 81
		Return "Invalid User Count"
	Case $iCode = 91
		Return "Private World"
	Case $iCode = 92
		Return "No Tourists"
	Case $iCode = 100
		Return "Contains Invalid Char"
	Case $iCode = 101
		Return "Email Ends With Blank"
	Case $iCode = 102
		Return "Email Missing Dot"
	Case $iCode = 102
		Return "Email Missing At Sign"
	Case $iCode = 104
		Return "Email Starts With Blank"
	Case $iCode = 105
		Return "Email Too Long"
	Case $iCode = 106
		Return "Email Too Short"
	Case $iCode = 107
		Return "Name Already Used"
	Case $iCode = 108
		Return "Contains Non-Alphanumeric Character"
	Case $iCode = 109
		Return "Contains Invalid Blank"
	Case $iCode = 110
		Return "Name Doesn't Exist"
	Case $iCode = 111
		Return "Name Ends With Blank"
	Case $iCode = 112
		Return "Name Too Long"
	Case $iCode = 113
		Return "Name Too Short"
	Case $iCode = 114
		Return "Name Unused"
	Case $iCode = 115
		Return "Password Too Long"
	Case $iCode = 116
		Return "Password Too Short"
	Case $iCode = 117
		Return "Password Wrong"
	Case $iCode = 119
		Return "Unable To Delete Name"
	Case $iCode = 120
		Return "Unable To Get Citizen"
	Case $iCode = 121
		Return "Unable To Insert Citizen"
	Case $iCode = 122
		Return "Unable To Insert Name"
	Case $iCode = 123
		Return "Unable To Put Citizen Count"
	Case $iCode = 124
		Return "Unable To Delete Citizen"
	Case $iCode = 126
		Return "Number Already Used"
	Case $iCode = 127
		Return "Number Out Of Range"
	Case $iCode = 128
		Return "Password Is Too Short"
	Case $iCode = 129
		Return "Password Is Too Long"
	Case $iCode = 203
		Return "Not Change Owner"
	Case $iCode = 204
		Return "Can't Find Old Element"
	Case $iCode = 210
		Return "Unable To Change Attribute"
	Case $iCode = 211
		Return "Can't Change Owner"
	Case $iCode = 212
		Return "Imposter"
	Case $iCode = 213
		Return "Invalid Request"
	Case $iCode = 216
		Return "Can't Build Here"
	Case $iCode = 300
		Return "Encroaches"
	Case $iCode = 301
		Return "No Such Object"
	Case $iCode = 302
		Return "Not Delete Owner"
	Case $iCode = 303
		Return "Too Many Bytes"
	Case $iCode = 305
		Return "Unable To Store"
	Case $iCode = 306
		Return "Unregistered Object"
	Case $iCode = 308
		Return "Element Already Exists"
	Case $iCode = 309
		Return "Restricted Command"
	Case $iCode = 310
		Return "No Build Rights"
	Case $iCode = 311
		Return "Out Of Bounds"
	Case $iCode = 313
		Return "Restricted Object"
	Case $iCode = 314
		Return "Restricted Area"
	Case $iCode = 400
		Return "Out Of Memory"
	Case $iCode = 401
		Return "Not Yet"
	Case $iCode = 402
		Return "Timeout"
	Case $iCode = 403
		Return "Null Pointer"
	Case $iCode = 404
		Return "Unable To Contact Universe"
	Case $iCode = 405
		Return "Unable To Contact World"
	Case $iCode = 406
		Return "Invalid World Name"
	Case $iCode = 415
		Return "Send Failed"
	Case $iCode = 416
		Return "Receive Failed"
	Case $iCode = 421
		Return "Stream Empty"
	Case $iCode = 422
		Return "Stream Message Too Long"
	Case $iCode = 423
		Return "World Name Too Long"
	Case $iCode = 426
		Return "Message Too Long"
	Case $iCode = 427
		Return "Too Many Resets"
	Case $iCode = 428
		Return "Unables To Create Socket"
	Case $iCode = 429
		Return "Unable To Connect"
	Case $iCode = 430
		Return "Unable To Set Nonblocking"
	Case $iCode = 434
		Return "Can't Open Stream"
	Case $iCode = 435
		Return "Can't Write Stream"
	Case $iCode = 436
		Return "Can't Close Stream"
	Case $iCode = 439
		Return "No Connection"
	Case $iCode = 442
		Return "Unable To Initialize Network"
	Case $iCode = 443
		Return "Incorrect Message Length"
	Case $iCode = 444
		Return "Not Initialized"
	Case $iCode = 445
		Return "No Instance"
	Case $iCode = 446
		Return "Out Buffer Full"
	Case $iCode = 447
		Return "Invalid Callback"
	Case $iCode = 448
		Return "Invalid Attribute"
	Case $iCode = 449
		Return "Type Mismatch"
	Case $iCode = 450
		Return "String Too Long"
	Case $iCode = 451
		Return "Read Only"
	Case $iCode = 452
		Return "Unable to Register Resolve"
	Case $iCode = 453
		Return "Invalid Instance"
	Case $iCode = 454
		Return "Version Mismatch"
	Case $iCode = 461
		Return "In Buffer Full"
	Case $iCode = 463
		Return "Protocol Error"
	Case $iCode = 464
		Return "Query In Progress"
	Case $iCode = 465
		Return "World Full"
	Case $iCode = 466
		Return "Ejected"
	Case $iCode = 467
		Return "Not Welcome"
	Case $iCode = 468
		Return "Unable To Bind"
	Case $iCode = 469
		Return "Unable To Listen"
	Case $iCode = 470
		Return "Unable To Accept"
	Case $iCode = 471
		Return "Connection Lost"
	Case $iCode = 473
		Return "No Stream"
	Case $iCode = 474
		Return "Not Available"
	Case $iCode = 487
		Return "Old Universe"
	Case $iCode = 488
		Return "Old World"
	Case $iCode = 489
		Return "World Not Running"
	Case $iCode = 505
		Return "Invalid Argument"
	Case $iCode = 514
		Return "Unable to update custom avatar"
	Case $iCode = 515
		Return "Unable to delete custom avatar"
	Case $iCode = 516
		Return "No such custom avatar"
	Case $iCode = 521
		Return "World instance already exists"
	Case $iCode = 522
		Return "World instance invalid"
	Case $iCode = 523
		Return "Plugin not available"
	Case $iCode = 600
		Return "Database error"
	Case $iCode = 4995
		Return "Buffer error (zlib): Not enough room in the output buffer."
	Case $iCode = 4996
		Return "Memory error (zlib): Memory could not be allocated for processing."
	Case $iCode = 4997
		Return "Data error (zlib): Input data was corrupted."
	Case Else
		Return $iCode
EndSelect
EndFunc

