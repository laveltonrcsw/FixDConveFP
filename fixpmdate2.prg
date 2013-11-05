CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF

PRIVATE ival
ival = 0

SELECT 0
USE "C:\ACS\initdata\_pmdate\inv_entry_date_01" SHARED ALIAS inv01

SELECT 0
USE "N:\APPS\acss\pmast01" SHARED ALIAS inv02
INDEX ON ALLTRIM(pm_part) TO l
SET ORDER TO l
GO TOP

@10,2 SAY "Entry Date(s): (Fixed) = "

DO WHILE !EOF()
	SELECT inv02
	SEEK ALLTRIM(inv01.pm_part)
	IF FOUND() .AND. inv02.pm_date > inv01.pm_date
		ival = ival + 1
		REPLACE inv02.pm_date WITH inv01.pm_date
		@10,28 SAY ival
	ENDIF
	SELECT inv01
	SKIP
ENDDO

@12,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
