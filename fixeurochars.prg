CLOSE DATABASES ALL
CLEAR
SET EXCLUSIVE OFF
SET SAFETY OFF
_VFP.CAPTION = "Correcting Euro Characters in Various DBF(s)."

PRIVATE curfldname, ihmt, m1, dflt_drive
PUBLIC gdbf, gtimeout, eschit, lcont

ihmt       = 0
curfldname = ""

dflt_drive = "N:\APPS\ACSS" + SPACE(10)
gdbf     = UPPER(ALLTRIM(dflt_drive))
lcont    = 1
gtimeout = 600
eschit   = .F.

@04,2 SAY "HMAST  (FCOUNT) = "

clearbox(08,00,24,79)

@09,2 SAY "       Enter directory: "
@10,26 GET dflt_drive PICTURE "@RK! "

KEYBOARD "{END}"
READ TIMEOUT gtimeout

IF time_out() .OR. eschit &&.OR. lcont =2
	CLOSE ALL
	RETURN .F.            && Aborted Input !!!
ENDIF

IF RIGHT(ALLTRIM(dflt_drive),1) <> "\"
	dflt_drive =ALLTRIM(dflt_drive) +"\"
ENDIF

gdbf = ALLTRIM(dflt_drive)

SELECT 0
USE gdbf + "hmast01" SHARED ALIAS hmt01
GO TOP
ON ERROR DO errcheckfield
FOR gncount = 1 TO FCOUNT( )
	curfldname = FIELD(gncount)
	REPLACE ALL &curfldname WITH STRTRAN(&curfldname,CHR(173)," ") && ¡
	REPLACE ALL &curfldname WITH STRTRAN(&curfldname,CHR(241)," ") && 
	ihmt = ihmt + 1
	@04,28 SAY ihmt
NEXT
ON ERROR
USE

*!*	curfldname = ""
*!*	SELECT 0
*!*	USE gdbf + "vinmas" SHARED ALIAS vin01
*!*	GO TOP
*!*	ON ERROR DO errcheckfield
*!*	FOR gncount = 1 TO FCOUNT( )
*!*		curfldname = FIELD(gncount)
*!*		REPLACE ALL &curfldname WITH STRTRAN(&curfldname,CHR(0)," ")
*!*		ivin = ivin + 1
*!*		@05,28 SAY ivin
*!*	NEXT
*!*	ON ERROR
*!*	USE
CLOSE DATABASES ALL

@12,2 SAY "The operation(s) is completed."

INKEY(5)
RETURN

PROCEDURE errcheckfield
	* Do Nothing and Continue
ENDPROC

FUNCTION clearbox
	PARAMETERS x1, y1, x2, y2
	PRIVATE i
	x1 = ABS(x1)
	y1 = ABS(y1)
	x2 = ABS(x2)
	y2 = ABS(y2)

	IF x1 > INT(WROWS(WOUTPUT())) then
		RETURN
	ENDIF

	IF y1 > INT(WCOLS(WOUTPUT())) then
		RETURN
	ENDIF

	IF x2 > INT(WROWS(WOUTPUT())) then
		RETURN
	ENDIF

	IF y2 > INT(WCOLS(WOUTPUT())) then
		RETURN
	ENDIF

	FOR i = x1 TO x2 STEP 1
		@ i, y1 SAY REPLICATE(" ",ABS(y2-y1+1))
	NEXT i

	RETURN
ENDFUNC

FUNCTION time_out
	PRIVATE esc

	IF LASTKEY() =27
		eschit =.T.
	ENDIF

	IF READKEY() = 20 .OR.READKEY() = 276
		eschit =.T.
		KEYBOARD CHR(27) PLAIN
		esc =INKEY()
	ELSE
		RETURN .F.
	ENDIF
	RETURN .T.
ENDFUNC
