*
*	Replaces the empty pmast's PM_DATE with the pmast's PM_ADATE.
*
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DEFAULT TO "N:\Apps\acss"
_VFP.CAPTION = "Fixing Pmast's Part Entry Date"

PRIVATE ival
ival = 0

SELECT 0
USE pmast01 SHARED ALIAS pmt
INDEX ON ALLTRIM(pm_part) TO l
SET ORDER TO l

GO TOP

@04,2 SAY "This program will replace the Pmast's Entry Date "
@05,2 SAY "with the Pmast's Last Activity Date if the entry "
@06,2 SAY "date is greater than the activity date. Press "
@07,2 SAY "[ESC] to quit."

@10,2 SAY "Entry Date(s): (Fixed) = "

DO WHILE !EOF()
	SELECT pmt
	IF pmt.pm_date > pmt.pm_adate
		ival = ival + 1
		REPLACE pmt.pm_date WITH pmt.pm_adate
		@10,28 SAY ival
	ENDIF
	SELECT pmt
	SKIP
ENDDO

@12,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN