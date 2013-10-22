CLOSE DATABASES ALL
SET EXCLUSIVE ON
SET SAFETY OFF
_VFP.CAPTION = "Remove Dups"

PRIVATE icus, ivin, oldcus, oldvin
oldcus = ""
oldvin = ""
icus   = 0
ivin   = 0

@04,2 SAY ""
@05,2 SAY ""
@06,2 SAY ""
@10,2 SAY "Del Cus. (REM)  = "
@11,2 SAY "Del Veh. (REM)  = "

*!*	SELECT 0
*!*	USE "N:\Data_Conversions\COVE FORD\delcus.dbf" ALIAS del01
*!*	ZAP
*!*	USE

*!*	SELECT 0
*!*	USE "N:\Data_Conversions\COVE FORD\cusmas.dbf" ALIAS p01
*!*	INDEX ON ALLTRIM(fcustno) TO l
*!*	SET ORDER TO l
*!*	GO TOP
*!*	DO WHILE !EOF()
*!*		SELECT p01
*!*		oldcus = p01.fcustno
*!*		SKIP
*!*		IF p01.fcustno == oldcus
*!*			DELETE
*!*			icus = icus + 1
*!*			@10,23 SAY icus
*!*		ENDIF
*!*	ENDDO

*!*	SELECT p01
*!*	SET FILTER TO DELETED()
*!*	COPY TO "N:\Data_Conversions\COVE FORD\delcus.dbf"
*!*	PACK

SELECT 0
USE "N:\Data_Conversions\COVE FORD\delvin.dbf" ALIAS del02
ZAP
USE

SELECT 0
USE "N:\Data_Conversions\COVE FORD\vinmas.dbf" ALIAS p02
INDEX ON ALLTRIM(vi_vin) TO l
SET ORDER TO l
GO TOP
DO WHILE !EOF()
	SELECT p02
	oldvin = p02.vi_vin
	SKIP
	IF p02.vi_vin == oldvin
		DELETE
		ivin = ivin + 1
		@11,23 SAY ivin
	ENDIF
ENDDO

SELECT p02
SET FILTER TO DELETED()
COPY TO "N:\Data_Conversions\COVE FORD\delvin.dbf"
pack

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
