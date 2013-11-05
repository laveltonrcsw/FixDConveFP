CLOSE DATABASES ALL
CLEAR
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON
SET CENTURY ON

PRIVATE icus
icus  = 0

@09,2 SAY "Cust No. (Cusmas) = "

SELECT 0
USE "C:\ACS\lrc\badcusmas.dbf" ALIAS bcu

SELECT 0
USE "N:\Apps\Acss\cusmas.dbf" ALIAS cus
INDEX ON ALLTRIM(fcustno) TO l
GO TOP

DO WHILE !EOF()
	SELECT cus
	SEEK ALLTRIM(bcu.fcustno)
	IF FOUND()
		DELETE
		icus = icus + 1
		@09,26 SAY icus
	ENDIF
	SELECT bcu
	SKIP
ENDDO

@11,2 SAY "The operation(s) is completed."

INKEY(2)

CLOSE DATABASES ALL
RETURN
