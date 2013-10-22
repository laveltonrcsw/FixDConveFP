*
*	Correct the PMAST PM_SAMEAS field.
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON
_VFP.CAPTION = "Correcting the Big M GM Dashes in PMAST01"

PRIVATE ival1

ival1 = 0

@05,2 SAY "GM Dashes (Fixed) = "

SELECT 0
USE "C:\ACS\initdata\fixgmdashes\sshis.DBF" SHARED ALIAS p01

SELECT 0
USE "N:\APPS\ACSS\PMAST01.DBF" SHARED ALIAS p02
SET ORDER TO pm_part
GO TOP

SELECT p01
DO WHILE !EOF()
	SELECT p02
	SEEK ALLTRIM(p01.part02)
	IF FOUND()
		REPLACE p02.pm_part   WITH ALLTRIM(p01.PART)
		REPLACE p02.pm_sameas WITH ALLTRIM(p01.sameas)
		ival1 = ival1 + 1
		@05,23 SAY ival1
	ENDIF
	SELECT p01
	SKIP
ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
