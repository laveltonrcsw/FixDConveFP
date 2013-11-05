CLOSE DATABASES ALL
CLEAR
SET EXCLUSIVE OFF
SET SAFETY OFF
_VFP.CAPTION = "Correcting Null Characters in Various DBF(s)."

PRIVATE curfldname, icus, ivin, ipmt, ihis, m1, dflt_drive
PUBLIC gdbf, gtimeout, eschit, lcont

icus       = 0
ivin       = 0
ipmt       = 0
ihis       = 0
ihmt       = 0
irmt       = 0
irpt       = 0
curfldname = ""

dflt_drive = "N:\APPS\ACSS" + SPACE(10)
gdbf     = UPPER(ALLTRIM(dflt_drive))
lcont    = 1
gtimeout = 600
eschit   = .F.

@04,2 SAY "CUSMAS (FCOUNT) = "
@05,2 SAY "VINMAS (FCOUNT) = "
@06,2 SAY "PMAST  (FCOUNT) = "
@07,2 SAY "STDETL (FCOUNT) = "
@08,2 SAY "ROMAST (FCOUNT) = "
@09,2 SAY "HMAST  (FCOUNT) = "
@10,2 SAY "RECEPT (FCOUNT) = "
@11,2 SAY "CHKREG (FCOUNT) = "

clearbox(12,00,24,79)

@13,2 SAY "       Enter directory: "
@13,26 GET dflt_drive PICTURE "@RK! "

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
USE gdbf + "cusmas" SHARED ALIAS cus01
GO TOP
ON ERROR DO errcheckfield
FOR gncount = 1 TO FCOUNT( )
	curfldname = FIELD(gncount)
	REPLACE ALL &curfldname WITH STRTRAN(&curfldname,CHR(0)," ")
	icus = icus + 1
	@04,28 SAY icus
NEXT
ON ERROR
USE

curfldname = ""
SELECT 0
USE gdbf + "vinmas" SHARED ALIAS vin01
GO TOP
ON ERROR DO errcheckfield
FOR gncount = 1 TO FCOUNT( )
	curfldname = FIELD(gncount)
	IF &curfldname <> "vi_olet"
		REPLACE ALL &curfldname WITH STRTRAN(&curfldname,CHR(0)," ")
	ENDIF
	ivin = ivin + 1
	@05,28 SAY ivin
NEXT
ON ERROR
USE

curfldname = ""
SELECT 0
USE gdbf + "pmast01" SHARED ALIAS pmt01
GO TOP
ON ERROR DO errcheckfield
FOR gncount = 1 TO FCOUNT( )
	curfldname = FIELD(gncount)
	REPLACE ALL &curfldname WITH STRTRAN(&curfldname,CHR(0)," ")
	ipmt = ipmt + 1
	@06,28 SAY ipmt
NEXT
ON ERROR
USE

curfldname = ""
SELECT 0
USE gdbf + "stdetl" SHARED ALIAS his01
GO TOP
ON ERROR DO errcheckfield
FOR gncount = 1 TO FCOUNT( )
	curfldname = FIELD(gncount)
	REPLACE ALL &curfldname WITH STRTRAN(&curfldname,CHR(0)," ")
	ihis = ihis + 1
	@07,28 SAY ihis
NEXT
ON ERROR
USE

curfldname = ""
SELECT 0
USE gdbf + "romast01" SHARED ALIAS rmt01
GO TOP
ON ERROR DO errcheckfield
FOR gncount = 1 TO FCOUNT( )
	curfldname = FIELD(gncount)
	REPLACE ALL &curfldname WITH STRTRAN(&curfldname,CHR(0)," ")
	irmt = irmt + 1
	@08,28 SAY irmt
NEXT
ON ERROR
USE

curfldname = ""
SELECT 0
USE gdbf + "hmast01" SHARED ALIAS hmt01
GO TOP
ON ERROR DO errcheckfield
FOR gncount = 1 TO FCOUNT( )
	curfldname = FIELD(gncount)
	REPLACE ALL &curfldname WITH STRTRAN(&curfldname,CHR(0)," ")
	ihmt = ihmt + 1
	@09,28 SAY ihmt
NEXT
ON ERROR
USE

curfldname = ""
SELECT 0
USE gdbf + "recept01" SHARED ALIAS rpt01
GO TOP
ON ERROR DO errcheckfield
FOR gncount = 1 TO FCOUNT( )
	curfldname = FIELD(gncount)
	REPLACE ALL &curfldname WITH STRTRAN(&curfldname,CHR(0)," ")
	irpt = irpt + 1
	@10,28 SAY irpt
NEXT
ON ERROR
USE

curfldname = ""
SELECT 0
USE gdbf + "chkreg01" SHARED ALIAS chk01
GO TOP
ON ERROR DO errcheckfield
FOR gncount = 1 TO FCOUNT( )
	curfldname = FIELD(gncount)
	REPLACE ALL &curfldname WITH STRTRAN(&curfldname,CHR(0)," ")
	ichk = ichk + 1
	@11,28 SAY ichk
NEXT
ON ERROR
USE
CLOSE DATABASES ALL

@15,2 SAY "The operation(s) is completed."

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

	IF x1 > INT(WROWS(WOUTPUT())) THEN
		RETURN
	ENDIF

	IF y1 > INT(WCOLS(WOUTPUT())) THEN
		RETURN
	ENDIF

	IF x2 > INT(WROWS(WOUTPUT())) THEN
		RETURN
	ENDIF

	IF y2 > INT(WCOLS(WOUTPUT())) THEN
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
