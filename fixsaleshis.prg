*
*	Fix Victory Ford Missing Oct & Nov Sales History.
*
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DEFAULT TO "N:\Apps\acss"
*SET DEFAULT TO "N:\Data_Conversions\"
_VFP.CAPTION = "Fix Victory Ford Missing Sales History."

PRIVATE ioct, inov
ioct = 0
inov = 0

@04,2 SAY "This program will fix the missing sales history "
@05,2 SAY "for Victory Ford.                               "
@06,2 SAY "Press [ESC] to quit.                            "
@08,2 SAY "Part No. (OCT)  = "
@09,2 SAY "Part No. (NOV)  = "

SELECT 0
*USE "N:\Data_Conversions\PM110502" SHARED ALIAS p02
USE "N:\APPS\ACSS\ARCHIVES\PM110502" SHARED ALIAS p02

SELECT 0
USE pmast02 SHARED ALIAS p01
INDEX ON ALLTRIM(pm_part) TO l
SET ORDER TO l

GO TOP

DO WHILE !EOF()
	SELECT p01
	SEEK ALLTRIM(p02.pm_part)
	IF FOUND()
		REPLACE p01.pm_sold10 WITH p02.pm_sold10
		ioct = ioct + 1
		@08,23 SAY ioct
	ENDIF
	SELECT p02
	SKIP
ENDDO

CLOSE DATABASES ALL

SELECT 0
*USE "N:\Data_Conversions\PM120502" SHARED ALIAS p03
USE "N:\APPS\ACSS\ARCHIVES\PM120502" SHARED ALIAS p03

SELECT 0
USE pmast02 SHARED ALIAS p01
INDEX ON ALLTRIM(pm_part) TO l
SET ORDER TO l

GO TOP

DO WHILE !EOF()
	SELECT p01
	SEEK ALLTRIM(p03.pm_part)
	IF FOUND()
		REPLACE p01.pm_sold11 WITH p03.pm_sold11
		inov = inov + 1
		@09,23 SAY inov
	ENDIF
	SELECT p03
	SKIP
ENDDO

@11,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
