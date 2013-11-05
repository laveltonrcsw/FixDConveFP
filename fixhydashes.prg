*
*	Correcting the parts in Hallmark's VW/Hyundai PMAST.
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON
*SET DEFAULT TO "N:\Apps\acss"
_VFP.CAPTION = "Fixing Hallmark's VW/Hyundai PMAST"

PRIVATE ival1, ival2, spart, ssame
ival1  = 0
ival2  = 0
spart  = ""

@04,2 SAY "This program will correct the Hallmark's VW/Hyundai Parts "
@05,2 SAY "File with the Orig. Hallmark's Part File from the uploaded "
@06,2 SAY "data or Master Tape File. Press [ESC] to quit."
@10,2 SAY "Part File# 1 (Fixed) = "
@11,2 SAY "Part File# 2 (Fixed) = "

SELECT 0
USE "N:\APPS\ACSS\vw.DBF" SHARED ALIAS p01  && Correct File

SELECT 0
USE "N:\APPS\ACSS\pmast01.DBF" SHARED ALIAS p02   && Incorrect File
REPLACE ALL pm_part   WITH STRTRAN(UPPER(ALLTRIM(pm_part)),'-')   FOR ALLTRIM(pm_source) = "VW"
REPLACE ALL pm_sameas WITH STRTRAN(UPPER(ALLTRIM(pm_sameas)),'-') FOR ALLTRIM(pm_source) = "VW"
DELETE ALL FOR ALLTRIM(pm_desc) = "** PART ADDED BY MAN"
SET ORDER TO pm_part
GO TOP

SELECT p01
DO WHILE !EOF()
	spart = STRTRAN(UPPER(ALLTRIM(p01.pt_partno)),' ')
	ssame = STRTRAN(UPPER(ALLTRIM(p01.pt_sspart)),' ')
*!*		IF spart = "1J0863323R4TE"
*!*			SET STEP ON
*!*		ENDIF
	SELECT p02
	SEEK spart
	IF FOUND()
		REPLACE p02.pm_part WITH p01.pt_partno
		IF p02.pm_sameas = ssame
			REPLACE p02.pm_sameas WITH p01.pt_sspart
		ENDIF
		REPLACE p02.pm_desc  WITH p01.pt_desc
		REPLACE p02.pm_base  WITH p02.pm_part
		*!*			REPLACE p02.pm_part   WITH p01.pm_part
		*!*			REPLACE p02.pm_sameas WITH p01.pm_sameas
		*!*			REPLACE p02.pm_sameas WITH SUBSTR(UPPER(ALLTRIM(p02.pm_sameas)),3)
		*!*			REPLACE p02.pm_ordrsrc WITH p01.pm_ordrsrc
		ival1 = ival1 + 1
		@10,23 SAY ival1
	ENDIF
	SELECT p01
	SKIP
ENDDO
CLOSE DATA ALL

SELECT 0
USE "N:\APPS\ACSS\vw.DBF" SHARED ALIAS p01  && Correct File

SELECT 0
USE "N:\APPS\ACSS\pmast02.DBF" SHARED ALIAS p02   && Incorrect File
REPLACE ALL pm_part   WITH STRTRAN(UPPER(ALLTRIM(pm_part)),'-')   FOR ALLTRIM(pm_source) = "VW"
REPLACE ALL pm_sameas WITH STRTRAN(UPPER(ALLTRIM(pm_sameas)),'-') FOR ALLTRIM(pm_source) = "VW"
DELETE ALL FOR ALLTRIM(pm_desc) = "** PART ADDED BY MAN"
SET ORDER TO pm_part
GO TOP

SELECT p01
DO WHILE !EOF()
	spart = STRTRAN(UPPER(ALLTRIM(p01.pt_partno)),' ')
	ssame = STRTRAN(UPPER(ALLTRIM(p01.pt_sspart)),' ')
*!*		IF spart = "1J0863323R4TE"
*!*			SET STEP ON
*!*		ENDIF
	SELECT p02
	SEEK spart
	IF FOUND()
		REPLACE p02.pm_part WITH p01.pt_partno
		IF p02.pm_sameas = ssame
			REPLACE p02.pm_sameas WITH p01.pt_sspart
		ENDIF
		REPLACE p02.pm_desc  WITH p01.pt_desc
		REPLACE p02.pm_base  WITH p02.pm_part
		*!*			REPLACE p02.pm_part   WITH p01.pm_part
		*!*			REPLACE p02.pm_sameas WITH p01.pm_sameas
		*!*			REPLACE p02.pm_sameas WITH SUBSTR(UPPER(ALLTRIM(p02.pm_sameas)),3)
		*!*			REPLACE p02.pm_ordrsrc WITH p01.pm_ordrsrc
		ival2 = ival2 + 1
		@11,23 SAY ival2
	ENDIF
	SELECT p01
	SKIP
ENDDO

*!*	SELECT p02
*!*	GO TOP
*!*	replace all pm_base with pm_part

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
