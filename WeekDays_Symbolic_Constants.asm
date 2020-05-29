; Program:     Chapter 3
; Description: Practice with symbolic constant definitions either using integers or strings
; Student:     Gabriel Warkentin
; Date:        02/11/2020
; Class:       CSCI 241
; Instructor:  Mr. Ding

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; For 7 days of the week, defines symbolic names of integers to simulate C enumeration type:
nMonday    = 1
nTuesday   = 2
nWednesday = 3
nThursday  = 4
nFriday    = 5
nSaturday  = 6
nSunday    = 7

; For Monday and Tuesday, define 2 symbolic names for string:
newL       TEXTEQU <0dh,0ah>
sMonday    TEXTEQU <"Monday">
sTuesday   TEXTEQU <"Tuesday">
sWednesday TEXTEQU <"Wednesday">
sThursday  TEXTEQU <"Thursday">
sFriday    TEXTEQU <"Friday">
sSaturday  TEXTEQU <"Saturday">
sSunday    TEXTEQU <"Sunday">

.data
; Create a BYTE array that uses integer symbols as initializers
	bWeekDays BYTE  nMonday,
					nTuesday,
					nWednesday,
					nThursday,
					nFriday,
					nSaturday,
					nSunday
; Calculate the number of elements in bWeekDays
	bWeekDaysCount = ($ - bWeekdays)

; Create a DWORD array that uses integer symbols as initializers
	dWeekDays DWORD nMonday,
					nTuesday,
					nWednesday,
					nThursday,
					nFriday,
					nSaturday,
					nSunday
; Calculate the number of elements in dWeekDays
	dWeekDaysCount = ($ - dWeekDays) / 4

; Create a string variable that uses text symbol for Monday as initializers
	strMon BYTE sMonday,0
; Calculate the size of strMon
	strMonSize = ($ - strMon)

; Create a string variable that uses text symbol for Tuesday as initializers 
			;I don't really understand why we would put the newline at the begging and end of Tuesday
			;instead of justone or the other. Like newL at end of every day or at begging of every day.
			;Kinda made this confusing even though actually doing it wasn't so hard.
	strTue BYTE newL,sTuesday,newL,0
; Calculate the size of strTue
	strTueSize = ($ - strTue)

	DWORD 12345678h ; Ending flag

.code
main2 proc
; Move BYTE array count to a register to verify 7 for bWeekDay
	mov al, bWeekDaysCount

; Move DWORD array count to a register to verify 7 for dWeekDays
	mov al, dWeekDaysCount

; Move Monday variable size to a register to make it 7 as required
	mov al, strMonSize

; Move Tuesday variable size to a register to make it 12 as required
	mov al, strTueSize

	invoke ExitProcess,0
main2 endp
end main2