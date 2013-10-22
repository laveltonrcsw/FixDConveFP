CLOSE DATA ALL
CLEAR
SET SAFETY OFF
SET EXCLUS OFF

SELECT 0
USE "C:\ACS\fixssparts\OLDPMAST01" SHARED ALIAS PMT02 &&Get The Monthly Backup From The Archive Directory.

SELECT 0
USE "N:\APPS\ACSS\PMAST01" SHARED ALIAS PMT01
INDEX ON ALLTRIM(PM_PART) TO l
GO TOP

DO WHILE !EOF()
	SELECT PMT01
	SEEK ALLTRIM(PMT02.PM_PART)
	IF FOUND() .and. EMPTY(ALLTRIM(PMT01.PM_SAMEAS))
		REPLACE PMT01.PM_SAMEAS WITH alltrim(PMT02.PM_SAMEAS)
	ENDIF
	SELECT PMT02
	SKIP
ENDDO

CLOSE DATA ALL
RETURN