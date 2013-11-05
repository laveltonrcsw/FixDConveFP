CLOSE DATA ALL
CLEAR
SET SAFETY OFF
SET EXCLUS OFF
SET DEFAULT TO "N:\Apps\Acss\"

PRIVATE nval, ival, rcnt
nval = 0
ival = 0
rcnt = 0

@05,2 SAY "Part No. (Fixed) = "

SELECT 0
USE "C:\ACS\initdata\pmast01.dbf" SHARED ALIAS old01 && Incorrect File

SELECT 0
USE "N:\Apps\Acss\pmast01"        SHARED ALIAS new01 && Correct File
INDEX ON ALLTRIM(pm_part) TO l
GO TOP

DO WHILE !EOF()
    SELECT new01
    SEEK ALLTRIM(old01.pm_part)
    IF new01.pm_sold09 > old01.pm_cursold
        nval = new01.pm_sold09 - old01.pm_cursold
        ival = old01.pm_sold09 + nval
        REPLACE new01.pm_sold09 WITH ival
        rcnt = rcnt + 1
        @05,23 SAY rcnt
        nval = 0
        ival = 0
    ENDIF
    SELECT old01
    SKIP
ENDDO
CLOSE DATA ALL
RETURN
