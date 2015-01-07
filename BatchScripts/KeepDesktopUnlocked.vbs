'This VBScirpt keeps sending NUMLOCK key signal every 10 mins for specified duration
'This is useful to keep a desktop from locking automatically

set WshShell=CreateObject("WScript.Shell")

TimeTo_SendKeys=24 
'Uncomment below line to be able to specify the number of hours the script should keep running
'InputBox "Hours to unlock?", Unlock, 20
TimeTo_SendKeys=TimeTo_SendKeys*3600

sleepTimeOnToggle=100
sleepTimeOnNextToggle=10000

Do
	WshShell.SendKeys"{NUMLOCK}"
	Wscript.sleep sleepTimeOnToggle
	WshShell.SendKeys "{NUMLOCK}"
	
	TimeTo_SendKeys=TimeTo_SendKeys-(sleepTimeOnToggle+sleepTimeOnNextToggle)/1000
	
	Wscript.sleep sleepTimeOnNextToggle

Loop until TimeTo_SendKeys<0
