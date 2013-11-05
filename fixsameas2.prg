*
*	Correct the PMAST PM_SAMEAS field.
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON

SELECT 0
*USE "C:\ACS\initdata\_pmast\pmast01.DBF" SHARED ALIAS p01
USE "N:\Data_Conversions\RandallMotors\pmast02.DBF" SHARED ALIAS p01

SELECT 0
*USE "N:\Apps\Acss\pmast01.DBF" SHARED ALIAS p02
USE "N:\Data_Conversions\RandallMotors\_bak\pmast01.DBF" SHARED ALIAS p02
SET ORDER TO pm_part
GO TOP

SELECT p01
DO WHILE !EOF()
	SELECT p02
	SEEK ALLTRIM(p01.pm_part)
	IF FOUND()
		REPLACE p02.pm_sameas WITH p01.pm_sameas
	ENDIF
	SELECT p01
	SKIP
ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
