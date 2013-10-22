*
*	Fix Hallmark VW/Hyundai Sales History.
*
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
_VFP.CAPTION = "Fix Hallmark VW/Hyundai Sales History."

PRIVATE ival1, ival2
ival1 = 0
ival2 = 0

@04,2 SAY "This program will fix the missing sales history "
@05,2 SAY "for Hallmark VW/Hyundai.                        "
@06,2 SAY "Press [ESC] to quit.                            "
@08,2 SAY "Part No. (01)  = "
@09,2 SAY "Part No. (02)  = "

SELECT 0
USE "C:\ACS\initdata\SHIS\delpart01.dbf" SHARED ALIAS p03

SELECT 0
USE "N:\APPS\ACSS\pmast01.dbf" SHARED ALIAS p01
INDEX ON ALLTRIM(pm_part) TO l
SET ORDER TO l

GO TOP

DO WHILE !EOF()
	SELECT p01
	SEEK ALLTRIM(p03.pm_part)
	IF FOUND()
		replace p01.pm_date   with p03.pm_date
		REPLACE p01.pm_sold01 WITH p03.pm_sold01
		REPLACE p01.pm_sold02 WITH p03.pm_sold02
		REPLACE p01.pm_sold03 WITH p03.pm_sold03
		REPLACE p01.pm_sold04 WITH p03.pm_sold04
		REPLACE p01.pm_sold05 WITH p03.pm_sold05
		REPLACE p01.pm_sold06 WITH p03.pm_sold06
		REPLACE p01.pm_sold07 WITH p03.pm_sold07
		REPLACE p01.pm_sold08 WITH p03.pm_sold08
		REPLACE p01.pm_sold09 WITH p03.pm_sold09
		REPLACE p01.pm_sold10 WITH p03.pm_sold10
		REPLACE p01.pm_sold11 WITH p03.pm_sold11
		REPLACE p01.pm_sold12 WITH p03.pm_sold12
		ival1 = ival1 + 1
		@08,23 SAY ival1
	ENDIF
	SELECT p03
	SKIP
ENDDO
close data all

SELECT 0
USE "C:\ACS\initdata\SHIS\delpart02.dbf" SHARED ALIAS p03

SELECT 0
USE "N:\APPS\ACSS\pmast02.dbf" SHARED ALIAS p01
INDEX ON ALLTRIM(pm_part) TO l
SET ORDER TO l

GO TOP

DO WHILE !EOF()
	SELECT p01
	SEEK ALLTRIM(p03.pm_part)
	IF FOUND()
		replace p01.pm_date   with p03.pm_date
		REPLACE p01.pm_sold01 WITH p03.pm_sold01
		REPLACE p01.pm_sold02 WITH p03.pm_sold02
		REPLACE p01.pm_sold03 WITH p03.pm_sold03
		REPLACE p01.pm_sold04 WITH p03.pm_sold04
		REPLACE p01.pm_sold05 WITH p03.pm_sold05
		REPLACE p01.pm_sold06 WITH p03.pm_sold06
		REPLACE p01.pm_sold07 WITH p03.pm_sold07
		REPLACE p01.pm_sold08 WITH p03.pm_sold08
		REPLACE p01.pm_sold09 WITH p03.pm_sold09
		REPLACE p01.pm_sold10 WITH p03.pm_sold10
		REPLACE p01.pm_sold11 WITH p03.pm_sold11
		REPLACE p01.pm_sold12 WITH p03.pm_sold12
		ival2 = ival2 + 1
		@09,23 SAY ival2
	ENDIF
	SELECT p03
	SKIP
ENDDO

@11,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
