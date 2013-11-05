*
*	Fix Kahlo Jeep Web1000 Bin Locations.
*
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
*SET DEFAULT TO "N:\Apps\acss"
_VFP.CAPTION = "Fix Kahlo Jeep Web1000 Bin Locations"

PRIVATE ibin
ibin = 0

SELECT 0
USE "C:\ACS\initdata\invbin01" SHARED ALIAS pb01

SELECT 0
USE "N:\APPS\ACSS\pmast0b" SHARED ALIAS p01
INDEX ON ALLTRIM(pm_part) TO l
SET ORDER TO l

GO TOP

@04,2 SAY "This program will fix the Web1000 bin locations "
@05,2 SAY "for Kahlo Jeep.                                 "
@06,2 SAY "Press [ESC] to quit.                            "
@10,2 SAY "Bin Loc. (UPD)  = "

DO WHILE !EOF()
	SELECT p01
	SEEK ALLTRIM(pb01.pm_part)
	IF FOUND()
		REPLACE p01.pm_locat WITH pb01.pm_locat
		ibin = ibin + 1
		@10,23 SAY ibin
	ENDIF
	SELECT pb01
	SKIP
ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN