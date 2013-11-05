*
*	Add MASOLD01 Salesmen to Vinmas
*
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET DELETED ON
SET SAFETY OFF

PRIVATE isale
isale = 0

@04,2 SAY ""
@05,2 SAY ""
@06,2 SAY ""
@10,2 SAY "Salesman (UPD)  = "

SELECT 0
USE "N:\Apps\Acss\masold01.dbf" SHARED ALIAS mas01

SELECT 0
USE "N:\Apps\Acss\vinmas.dbf"   SHARED ALIAS vin01
INDEX ON ALLTRIM(vi_vin) TO l
GO TOP

DO WHILE !EOF()
	SELECT vin01
	SEEK ALLTRIM(mas01.vi_vin)
	IF FOUND()
		REPLACE vin01.vi_slsm WITH mas01.vi_slsm
		isale = isale + 1
		@10,23 SAY isale
	ENDIF
	SELECT mas01
	SKIP
ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
