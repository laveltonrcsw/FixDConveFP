CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF

PRIVATE imas, ivin, ipro
imas = 0
ivin = 0
ipro = 0

*!*	SELECT 0
*!*	*USE "C:\Data_Conversion\Urse\fixmast.dbf" SHARED ALIAS fm01
*!*	USE "C:\ACS\lrc\fixmast.dbf" SHARED ALIAS fm01

*!*	SELECT 0
*!*	*USE "C:\Data_Conversion\Urse\MASOLD01.dbf" SHARED ALIAS mas01
*!*	USE "N:\APPS\ACSS\MASOLD01.dbf" SHARED ALIAS mas01
*!*	INDEX ON ALLTRIM(vi_deal) TO l
*!*	GO TOP

*!*	@10,2 SAY "FI  Dates (UPD)  = "

*!*	DO WHILE !EOF()
*!*		SELECT mas01
*!*		SEEK ALLTRIM(fm01.vi_deal)
*!*		IF FOUND() .AND. ALLTRIM(mas01.vi_vin) == ALLTRIM(fm01.vi_vin)
*!*			REPLACE mas01.vi_dsld   WITH fm01.vi_dsld
*!*			REPLACE mas01.vi_bkdate WITH fm01.vi_bkdate
*!*			REPLACE mas01.vi_xwxd   WITH fm01.vi_xwxd
*!*			imas = imas + 1
*!*			@10,23 SAY imas
*!*		ENDIF
*!*		SELECT fm01
*!*		SKIP
*!*	ENDDO
*!*	CLOSE DATABASES ALL

*!*	SELECT 0
*!*	*USE "C:\Data_Conversion\Urse\fixmast.dbf" SHARED ALIAS fm01
*!*	USE "C:\ACS\lrc\fixmast.dbf" SHARED ALIAS fm01

*!*	SELECT 0
*!*	*USE "C:\Data_Conversion\Urse\VINMAS.dbf" SHARED ALIAS vin01
*!*	USE "N:\APPS\ACSS\VINMAS.dbf" SHARED ALIAS vin01
*!*	INDEX ON ALLTRIM(vi_stk) TO l
*!*	GO TOP

*!*	@11,2 SAY "VIN Dates (UPD)  = "

*!*	DO WHILE !EOF()
*!*		SELECT vin01
*!*		SEEK ALLTRIM(fm01.vi_stk)
*!*		IF FOUND() .AND. ALLTRIM(vin01.vi_vin) == ALLTRIM(fm01.vi_vin)
*!*			REPLACE vin01.vi_dsld   WITH fm01.vi_dsld
*!*			REPLACE vin01.vi_bkdate WITH fm01.vi_bkdate
*!*			REPLACE vin01.vi_xwxd   WITH fm01.vi_xwxd
*!*			ivin = ivin + 1
*!*			@11,23 SAY ivin
*!*		ENDIF
*!*		SELECT fm01
*!*		SKIP
*!*	ENDDO
*!*	CLOSE DATABASES ALL

SELECT 0
*USE "N:\fixmast\fixmast.dbf" SHARED ALIAS fm01
USE "C:\ACS\lrc\fixmast.dbf" SHARED ALIAS fm01

SELECT 0
*USE "N:\fixmast\PROLD01.dbf" SHARED ALIAS pro01
USE "N:\APPS\ACSS\PROLD01.dbf" SHARED ALIAS pro01
INDEX ON ALLTRIM(ps_deal) TO l
GO TOP

@12,2 SAY "PRO Dates (UPD)  = "

DO WHILE !EOF()
	SELECT pro01
	SEEK ALLTRIM(fm01.vi_deal)
	IF FOUND() .AND. ALLTRIM(pro01.ps_vin) == ALLTRIM(fm01.vi_vin)
		REPLACE pro01.ps_crdte  WITH fm01.vi_bkdate
		REPLACE pro01.ps_avdte  WITH fm01.vi_bkdate
		REPLACE pro01.ps_closed WITH fm01.vi_bkdate
		ipro = ipro + 1
		@12,23 SAY ipro
	ENDIF
	SELECT fm01
	SKIP
enddo

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN



