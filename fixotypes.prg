CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF

PRIVATE iotyp
iotyp = 0

@04,2 SAY ""
@05,2 SAY ""
@06,2 SAY ""
@10,2 SAY "O-Types (UPD)  = "

SELECT 0
USE "C:\ACS\lrc\NEWPMAST01.DBF" SHARED ALIAS new01

SELECT 0
USE "N:\Apps\Acss\pmast01.dbf" SHARED ALIAS pmt01
INDEX ON ALLTRIM(pm_part) TO l
GO TOP

DO WHILE !EOF()
	SELECT pmt01
	SEEK ALLTRIM(new01.pm_part)
	IF FOUND()
		REPLACE pmt01.pm_otype WITH new01.pm_otype
		iotyp = iotyp + 1
		@10,23 SAY iotyp
	ENDIF
	SELECT new01
	SKIP
ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN

*!*	replace all pm_desc with SUBSTR(ALLTRIM(pm_desc),4) for SUBSTR(ALLTRIM(pm_desc),1,3) = "600"
*!*	replace all pm_desc with SUBSTR(ALLTRIM(pm_desc),4) for SUBSTR(ALLTRIM(pm_desc),1,3) = "500"
*!*	replace all pm_desc with SUBSTR(ALLTRIM(pm_desc),4) for SUBSTR(ALLTRIM(pm_desc),1,3) = "400"
*!*	replace all pm_desc with SUBSTR(ALLTRIM(pm_desc),4) for SUBSTR(ALLTRIM(pm_desc),1,3) = "300"
*!*	replace all pm_desc with SUBSTR(ALLTRIM(pm_desc),4) for SUBSTR(ALLTRIM(pm_desc),1,3) = "200"
*!*	replace all pm_desc with SUBSTR(ALLTRIM(pm_desc),4) for SUBSTR(ALLTRIM(pm_desc),1,3) = "100"
*!*	replace all pm_desc with SUBSTR(ALLTRIM(pm_desc),4) for SUBSTR(ALLTRIM(pm_desc),1,3) = "101"
*!*	replace all pm_desc with SUBSTR(ALLTRIM(pm_desc),4) for SUBSTR(ALLTRIM(pm_desc),1,3) = "102"
*!*	replace all pm_desc with ALLTRIM(pm_desc)

