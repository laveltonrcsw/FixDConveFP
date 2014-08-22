*
*	Removing Hallmark's VW/Hyundai Super Session Parts.
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON
_VFP.CAPTION = "Removing Hallmark's VW/Hyundai Super Session Parts"

PRIVATE ival1, ival2

ival1 = 0
ival2 = 0

@04,2 SAY "This program will remove Hallmark's VW/Hyundai Super       "
@05,2 SAY "Session parts from Pmast02 data file.                      "
@06,2 SAY "Press [ESC] to quit."
*!*	@10,2 SAY "Part File# 1 (SS) = "
@11,2 SAY "Part File# 2 (SS) = "

*!*	SELECT 0
*!*	USE "N:\APPS\ACSS\pmast01.DBF" SHARED ALIAS p01
*!*	SET ORDER TO pm_part
*!*	GO TOP

*!*	SELECT p01
*!*	DO WHILE !EOF()
*!*		IF !EMPTY(ALLTRIM(p01.pm_sameas)) .AND. p01.pm_onhand > 0
*!*			REPLACE p01.pm_sameas WITH ""
*!*	 		ival1 = ival1 + 1
*!*			@10,23 SAY ival1
*!*		ENDIF
*!*		SELECT p01
*!*		SKIP
*!*	ENDDO
*!*	CLOSE DATA ALL

SELECT 0
USE "N:\APPS\ACSS\pmast02.DBF" SHARED ALIAS p01
SET ORDER TO pm_part
GO TOP

SELECT p01
DO WHILE !EOF()
	IF !EMPTY(ALLTRIM(p01.pm_sameas)) .AND. p01.pm_onhand > 0
		REPLACE p01.pm_sameas WITH ""
 		ival2 = ival2 + 1
		@11,23 SAY ival2
	ENDIF
	SELECT p01
	SKIP
ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
