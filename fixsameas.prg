*
*	Correct the PMAST PM_SAMEAS field.
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON
_VFP.CAPTION = "Fixing Pmast's SameAs Part Field"

PRIVATE ival1, ival2

ival1 = 0
ival2 = 0

@04,2 SAY "This program will correct the Hallmark's VW/Hyundai Parts "
@05,2 SAY "File with the Orig. Hallmark's Part File from the uploaded "
@06,2 SAY "data or Master Tape File. Press [ESC] to quit."
@10,2 SAY "Part File# 1 (Fixed) = "
@11,2 SAY "Part File# 2 (Fixed) = "

SELECT 0
USE "N:\APPS\ACSS\pmast01.DBF" SHARED ALIAS p01

SELECT 0
USE "N:\APPS\ACSS\pmast01.DBF" SHARED ALIAS p02
SET ORDER TO PM_PART
GO TOP

SELECT p01
DO WHILE !EOF()
	SELECT p02
	SEEK ALLTRIM(p01.pm_part)
	IF FOUND()
		REPLACE p02.pm_sameas WITH p01.pm_sameas
		ival = ival + 1
		@10,23 SAY ival
	ENDIF
	SELECT p01
	SKIP
ENDDO
*!*	CLOSE DATA ALL

*!*	SELECT 0
*!*	USE "N:\APPS\ACSS\pmast02.DBF" SHARED ALIAS p01

*!*	SELECT 0
*!*	USE "N:\APPS\ACSS\pmast02.DBF" SHARED ALIAS p02
*!*	SET ORDER TO PM_PART
*!*	GO TOP

*!*	SELECT p01
*!*	DO WHILE !EOF()
*!*		SELECT p02
*!*		SEEK ALLTRIM(p01.pm_part)
*!*		IF FOUND()
*!*			REPLACE p02.pm_sameas WITH p01.pm_sameas
*!*			ival2 = ival2 + 1
*!*			@11,23 SAY ival2
*!*		ENDIF
*!*		SELECT p01
*!*		SKIP
*!*	ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
