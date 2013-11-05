*
*	Fix existing ACS client's Makes and Models.
*
*
PROCEDURE fixmakmod
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
	_VFP.CAPTION = "Fixing Vinmas's Makes and Models"

	dflt_drive = "N:\APPS\ACSS" + SPACE(10)
	gdbf     = UPPER(ALLTRIM(dflt_drive))
	lcont    = 1
	gtimeout = 600
	eschit   = .F.
	ival     = 0
	oldcus   = ""
	prvdate  = CTOD("")

	CLEAR
	@00,2 SAY DTOC(DATE())
	m1 ="AUTOMOTIVE COMPUTER SERVICES, INC."
	@01,2 SAY m1

	@04,2 SAY "This program will replace the Vinmas's Make and Models"
	@05,2 SAY "with the correct full Make and Model.                 "
	@06,2 SAY "Press [ESC] to quit.                                  "
	@07,2 SAY "                                                      "

	clearbox(07,00,24,79)

	@08,2 SAY "       Enter directory: "
	@08,26 GET dflt_drive PICTURE "@RK! "

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
	USE gdbf + "masold02" SHARED ALIAS veh
	GO TOP

	DO WHILE !EOF()
		REPLACE ALL vi_maked WITH "ACURA"           FOR ALLTRIM(vi_maket) = "ACUR"
		REPLACE ALL vi_maked WITH "AMERICAN MOTORS"	FOR ALLTRIM(vi_maket) = "AMER"
		REPLACE ALL vi_maked WITH "AUDI"            FOR ALLTRIM(vi_maket) = "AUDI"
		REPLACE ALL vi_maked WITH "BENTLEY"         FOR ALLTRIM(vi_maket) = "BENT"
		REPLACE ALL vi_maked WITH "MERCEDES-BENZ"   FOR ALLTRIM(vi_maket) = "BENZ"
		REPLACE ALL vi_maked WITH "BUICK"           FOR ALLTRIM(vi_maket) = "BUIC"
		REPLACE ALL vi_maked WITH "BUICK"           FOR ALLTRIM(vi_maket) = "BUIK"
		REPLACE ALL vi_maked WITH "BMW"             FOR ALLTRIM(vi_maket) = "BMW"
		REPLACE ALL vi_maked WITH "CADILLAC"        FOR ALLTRIM(vi_maket) = "CADI"
		REPLACE ALL vi_maked WITH "CHEVROLET"       FOR ALLTRIM(vi_maket) = "CHEV"
		REPLACE ALL vi_maked WITH "CHRYSLER"        FOR ALLTRIM(vi_maket) = "CHRY"
		REPLACE ALL vi_maked WITH "DAEWOO"          FOR ALLTRIM(vi_maket) = "DAEW"
		REPLACE ALL vi_maked WITH "DODGE"           FOR ALLTRIM(vi_maket) = "DODG"
		REPLACE ALL vi_maked WITH "EAGLE"           FOR ALLTRIM(vi_maket) = "EAGL"
		REPLACE ALL vi_maked WITH "FORD"            FOR ALLTRIM(vi_maket) = "FORD"
		REPLACE ALL vi_maked WITH "FREIGHTLINER"    FOR ALLTRIM(vi_maket) = "FREI"
		REPLACE ALL vi_maked WITH "GMC"             FOR ALLTRIM(vi_maket) = "GMC"
		REPLACE ALL vi_maked WITH "HARLEY DAVIDSON" FOR ALLTRIM(vi_maket) = "HARL"
		REPLACE ALL vi_maked WITH "HONDA"           FOR ALLTRIM(vi_maket) = "HOND"
		REPLACE ALL vi_maked WITH "HUMMER"          FOR ALLTRIM(vi_maket) = "HUMM"
		REPLACE ALL vi_maked WITH "HYUNDAI"         FOR ALLTRIM(vi_maket) = "HYUN"
		REPLACE ALL vi_maked WITH "INFINITI"        FOR ALLTRIM(vi_maket) = "INFI"
		REPLACE ALL vi_maked WITH "ISUZU"           FOR ALLTRIM(vi_maket) = "ISUZ"
		REPLACE ALL vi_maked WITH "CHRYSLER"        FOR ALLTRIM(vi_maket) = "JEEP"
		REPLACE ALL vi_maked WITH "JAGUAR"          FOR ALLTRIM(vi_maket) = "JAGU"
		REPLACE ALL vi_maked WITH "KAWASAKI"        FOR ALLTRIM(vi_maket) = "KAWA"
		REPLACE ALL vi_maked WITH "LAND ROVER"      FOR ALLTRIM(vi_maket) = "LAND"
		REPLACE ALL vi_maked WITH "LEXUS"           FOR ALLTRIM(vi_maket) = "LEXU"
		REPLACE ALL vi_maked WITH "LINCOLN"         FOR ALLTRIM(vi_maket) = "LINC"
		REPLACE ALL vi_maked WITH "MACK TRUCK"      FOR ALLTRIM(vi_maket) = "MACK"
		REPLACE ALL vi_maked WITH "MAZDA"           FOR ALLTRIM(vi_maket) = "MAZD"
		REPLACE ALL vi_maked WITH "MERCURY"         FOR ALLTRIM(vi_maket) = "MERC"
		REPLACE ALL vi_maked WITH "MERCURY"         FOR ALLTRIM(vi_maket) = "MERK"
		REPLACE ALL vi_maked WITH "MERCEDES-BENZ"   FOR ALLTRIM(vi_maket) = "MERZ"
		REPLACE ALL vi_maked WITH "MITSUBISHI"      FOR ALLTRIM(vi_maket) = "MITS"
		REPLACE ALL vi_maked WITH "NISSAN"          FOR ALLTRIM(vi_maket) = "NISS"
		REPLACE ALL vi_maked WITH "OLDSMOBILE"      FOR ALLTRIM(vi_maket) = "OLDS"
		REPLACE ALL vi_maked WITH "PLYMONTH"        FOR ALLTRIM(vi_maket) = "PLYM"
		REPLACE ALL vi_maked WITH "PONTIAC"         FOR ALLTRIM(vi_maket) = "PONT"
		REPLACE ALL vi_maked WITH "PORSCHE"         FOR ALLTRIM(vi_maket) = "PORS"
		REPLACE ALL vi_maked WITH "RANGE ROVER"     FOR ALLTRIM(vi_maket) = "RANG"
		REPLACE ALL vi_maked WITH "SAAB"            FOR ALLTRIM(vi_maket) = "SAAB"
		REPLACE ALL vi_maked WITH "SATURN"          FOR ALLTRIM(vi_maket) = "SATU"
		REPLACE ALL vi_maked WITH "SUBARU"          FOR ALLTRIM(vi_maket) = "SUBA"
		REPLACE ALL vi_maked WITH "SUZUKI"          FOR ALLTRIM(vi_maket) = "SUZU"
		REPLACE ALL vi_maked WITH "TOYOTA"          FOR ALLTRIM(vi_maket) = "TOYO"
		REPLACE ALL vi_maked WITH "TOYOTA"          FOR ALLTRIM(vi_maket) = "TOYT"
		REPLACE ALL vi_maked WITH "VOLKSWAGEN"      FOR ALLTRIM(vi_maket) = "VOLK"
		REPLACE ALL vi_maked WITH "VOLKSWAGEN"      FOR ALLTRIM(vi_maket) = "VW"
		REPLACE ALL vi_maked WITH "VOLVO"           FOR ALLTRIM(vi_maket) = "VOLV"
	ENDDO

	@11,2 SAY "Cleaning up data....Done!                            "
	@13,2 SAY "The operation(s) is completed."

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
