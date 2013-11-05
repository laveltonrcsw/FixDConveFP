CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETED ON

PRIVATE ival2
ival2 = 0

@09,2 SAY "Part No. (01)  = "

SELECT 0
USE "C:\ACS\lrc\newpmast01.dbf" SHARED ALIAS p03

SELECT 0
USE "N:\Apps\Acss\pmast01.dbf" SHARED ALIAS p01
INDEX ON ALLTRIM(pm_part) TO l
SET FILTER TO pm_source = "VW"
GO TOP

DO WHILE !EOF()
	SELECT p01
	SEEK ALLTRIM(p03.pm_part)
	IF FOUND() .AND. ALLTRIM(p01.pm_locat) == ALLTRIM(p03.pm_locat) .AND. ALLTRIM(p01.pm_otype) == ALLTRIM(p03.pm_otype)
		REPLACE p01.pm_part   WITH p03.pm_altpart
		REPLACE p01.pm_base   WITH p03.pm_altpart
		REPLACE p01.pm_sameas WITH p03.pm_sameas
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



