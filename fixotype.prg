CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF

PRIVATE ival
ival = 0

SELECT 0
USE "C:\acs\initdata\fixmissingotype\fpmast01" SHARED ALIAS pmt01

SELECT 0
USE "N:\apps\acss\pmast01" SHARED ALIAS pmt02
INDEX ON ALLTRIM(pm_part) TO l
SET ORDER TO l
GO TOP

@10,2 SAY "O-Types: (Fixed) = "

DO WHILE !EOF()
	SELECT pmt02
	SEEK ALLTRIM(pmt01.pm_part)
	IF FOUND()
		REPLACE pmt02.pm_otype WITH pmt01.pm_otype
		ival = ival + 1
		@10,28 SAY ival
	ENDIF
	SELECT pmt01
	SKIP
ENDDO

@12,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
