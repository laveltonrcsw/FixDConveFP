*
*	Replaces the empty Cusmas's CM_CRDTE with the Vinmas's VI_DSLD or VI_DARV or Today's Date.
*
*
PROCEDURE fixcrdte
	PRIVATE ival, oldcus, prvdate, m1, dflt_drive
	PUBLIC gdbf, gtimeout, eschit, lcont

	CLOSE DATABASES ALL
	SET SAFETY OFF
	SET STAT OFF
	SET TALK OFF
	SET EXCLUSIVE OFF
	SET DELE ON
	SET ECHO OFF
	SET SYSMENU OFF
	SET STATUS BAR OFF
	_VFP.CAPTION = "Fixing Cusmas's Customer Creation Date"

	dflt_drive = "N:\APPS\ACSS" + SPACE(10)
	gdbf = UPPER(ALLTRIM(dflt_drive))
	lcont  =1
	gtimeout =600
	eschit =.F.
	ival    = 0
	oldcus  = ""
	prvdate = CTOD("")

	CLEAR
	@00,2 SAY DTOC(DATE())
	m1 ="AUTOMOTIVE COMPUTER SERVICES, INC."
	@01,2 SAY m1

	@04,2 SAY "This program will replace the Cusmas's Creation Date "
	@05,2 SAY "with the Vinmas's Last Sold Date if the customer     "
	@06,2 SAY "number is founded and date is empty.                 "
	@07,2 SAY "Press [ESC] to quit.                                 "

	clearbox(07,00,24,79)

	@08,2 SAY "       Enter directory: "
	@08,26 GET dflt_drive PICTURE "@RK! "
	@11,2 SAY "Cust No. (Fixed) = "

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
	USE gdbf + "vinmas" SHARED ALIAS veh

	SELECT 0
	USE gdbf + "cusmas" SHARED ALIAS cus
	SET ORDER TO fcustno

	GO TOP

	DO WHILE !EOF()
		SELECT cus
		SEEK ALLTRIM(veh.vi_cust)
		IF FOUND() .AND. EMPTY(cus.cm_crdte) .AND. EMPTY(veh.vi_dsld)
			ival = ival + 1
			REPLACE cus.cm_crdte WITH veh.vi_darv
			@11,23 SAY ival
		ELSE
			ival = ival + 1
			REPLACE cus.cm_crdte WITH veh.vi_dsld
			@11,23 SAY ival
		ENDIF
		SELECT veh
		SKIP
	ENDDO

	SELECT cus
	SET ORDER TO
	GO TOP

	DO WHILE !EOF()
		@13,2 SAY "Cleaning up data....                             "
		SELECT cus
		oldcus  = ALLTRIM(cus.fcustno)
		prvdate = cus.cm_crdte
		IF !EOF()
			SKIP
		ENDIF
		DO WHILE EMPTY(cus.cm_crdte) .AND. !EOF()
			IF EMPTY(prvdate) .OR. RECNO() <= 1
				REPLACE cus.cm_crdte WITH DATE()
			ELSE
				REPLACE cus.cm_crdte WITH prvdate
			ENDIF
			IF !EOF()
				SKIP
			ENDIF
		ENDDO
	ENDDO
	@13,2 SAY "Cleaning up data....Done!                            "
	@15,2 SAY "The operation(s) is completed."

	INKEY(3)

	CLOSE DATABASES ALL
	RETURN

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
