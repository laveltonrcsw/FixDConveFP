*
*	Correcting the parts in Hallmark's VW/Hyundai Sale History.
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON
*SET DEFAULT TO "N:\APPS\ACSS"
_VFP.CAPTION = "Fixing Hallmark's VW/Hyundai Sales History"

PRIVATE ival1, ival2, ival3, ival4, ival5, ival6, jpart, ppart, rpart, rpartindex
PRIVATE jpartindex, ppartindex, rpartindex
ival1       = 0
ival2       = 0
ival3       = 0
ival4       = 0
ival5       = 0
ival6       = 0

jpart       = ""
ppart       = ""
rpart		= ""

jpartindex  = ""
ppartindex  = ""
rpartindex  = ""

@04,2 SAY "This program will correct the Hallmark's VW/Hyundai Sales "
@05,2 SAY "History with the Orig. Hallmark's Sales History from the  "
@06,2 SAY "uploaded data. Press [ESC] to quit."

@10,2 SAY "PRTADJ01  #1 (VW) = "
@11,2 SAY "PRTADJ02  #2 (VW) = "

@12,2 SAY "PRTINQ01  #1 (VW) = "
@13,2 SAY "PRTINQ02  #2 (VW) = "

@14,2 SAY "PSALES01  #1 (VW) = "
@15,2 SAY "PSALES02  #2 (VW) = "

SELECT 0
USE "N:\APPS\ACSS\pmast01.DBF" SHARED ALIAS p01   && Correct File

SELECT 0
USE "N:\APPS\ACSS\prtadj01.DBF" SHARED ALIAS p02  && Incorrect File
INDEX ON STRTRAN(UPPER(ALLTRIM(p02.pj_part)),'-') TO l
GO TOP

SELECT p01
DO WHILE !EOF()
	IF ALLTRIM(p01.pm_source) != "VW"
		SKIP
		LOOP
	ENDIF
	jpart = STRTRAN(UPPER(ALLTRIM(p01.pm_part)),' ')
	*!*		IF jpart = "1J0863323R4TE"
	*!*			SET STEP ON
	*!*		ENDIF
	SELECT p02
	SEEK jpart
	IF FOUND()
		jpartindex  = ALLTRIM(p02.pj_part)
		DO WHILE jpartindex == ALLTRIM(p02.pj_part)
			REPLACE p02.pj_part  WITH p01.pm_part
			*		REPLACE p02.pm_oldsrc  WITH ""
			*		REPLACE p02.pm_newsrc  WITH ""
			ival1 = ival1 + 1
			@10,28 SAY ival1
			SKIP
		ENDDO
	ENDIF
	SELECT p01
	SKIP
ENDDO
CLOSE DATA ALL

SELECT 0
USE "N:\APPS\ACSS\pmast02.DBF" SHARED ALIAS p01   && Correct File

SELECT 0
USE "N:\APPS\ACSS\prtadj02.DBF" SHARED ALIAS p02  && Incorrect File
INDEX ON STRTRAN(UPPER(ALLTRIM(p02.pj_part)),'-') TO l
GO TOP

SELECT p01
DO WHILE !EOF()
	IF ALLTRIM(p01.pm_source) != "VW"
		SKIP
		LOOP
	ENDIF
	jpart = STRTRAN(UPPER(ALLTRIM(p01.pm_part)),' ')
	*!*		IF jpart = "1J0863323R4TE"
	*!*			SET STEP ON
	*!*		ENDIF
	SELECT p02
	SEEK jpart
	IF FOUND()
		jpartindex  = ALLTRIM(p02.pj_part)
		DO WHILE jpartindex == ALLTRIM(p02.pj_part)
			REPLACE p02.pj_part  WITH p01.pm_part
			*		REPLACE p02.pm_oldsrc  WITH ""
			*		REPLACE p02.pm_newsrc  WITH ""
			ival2 = ival2 + 1
			@11,28 SAY ival2
			SKIP
		ENDDO
	ENDIF
	SELECT p01
	SKIP
ENDDO
CLOSE DATA ALL

SELECT 0
USE "N:\APPS\ACSS\pmast01.DBF" SHARED ALIAS p01   && Correct File

SELECT 0
USE "N:\APPS\ACSS\prtinq01.DBF" SHARED ALIAS p02  && Incorrect File
INDEX ON STRTRAN(UPPER(ALLTRIM(p02.pih_part)),'-') TO l
GO TOP

SELECT p01
DO WHILE !EOF()
	IF ALLTRIM(p01.pm_source) != "VW"
		SKIP
		LOOP
	ENDIF
	ppart = STRTRAN(UPPER(ALLTRIM(p01.pm_part)),' ')
	*!*		IF ppart = "1J0863323R4TE"
	*!*			SET STEP ON
	*!*		ENDIF
	SELECT p02
	SEEK ppart
	IF FOUND()
		ppartindex  = ALLTRIM(p02.pih_part)
		DO WHILE ppartindex == ALLTRIM(p02.pih_part)
			REPLACE p02.pih_part  WITH p01.pm_part
			REPLACE p02.pih_desc  WITH p01.pm_desc
			ival3 = ival3 + 1
			@12,28 SAY ival3
			SKIP
		ENDDO
	ENDIF
	SELECT p01
	SKIP
ENDDO
CLOSE DATA ALL

SELECT 0
USE "N:\APPS\ACSS\pmast02.DBF" SHARED ALIAS p01   && Correct File

SELECT 0
USE "N:\APPS\ACSS\prtinq02.DBF" SHARED ALIAS p02  && Incorrect File
INDEX ON STRTRAN(UPPER(ALLTRIM(p02.pih_part)),'-') TO l
GO TOP

SELECT p01
DO WHILE !EOF()
	IF ALLTRIM(p01.pm_source) != "VW"
		SKIP
		LOOP
	ENDIF
	ppart = STRTRAN(UPPER(ALLTRIM(p01.pm_part)),' ')
	*!*		IF ppart = "1J0863323R4TE"
	*!*			SET STEP ON
	*!*		ENDIF
	SELECT p02
	SEEK ppart
	IF FOUND()
		ppartindex  = ALLTRIM(p02.pih_part)
		DO WHILE ppartindex == ALLTRIM(p02.pih_part)
			REPLACE p02.pih_part  WITH p01.pm_part
			REPLACE p02.pih_desc  WITH p01.pm_desc
			ival4 = ival4 + 1
			@13,28 SAY ival4
			SKIP
		ENDDO
	ENDIF
	SELECT p01
	SKIP
ENDDO
CLOSE DATA ALL

SELECT 0
USE "N:\APPS\ACSS\pmast01.DBF" SHARED ALIAS p01   && Correct File

SELECT 0
USE "N:\APPS\ACSS\psales01.DBF" SHARED ALIAS p02  && Incorrect File
INDEX ON STRTRAN(UPPER(ALLTRIM(p02.ri_part)),'-') TO l
GO TOP

SELECT p01
DO WHILE !EOF()
	IF ALLTRIM(p01.pm_source) != "VW"
		SKIP
		LOOP
	ENDIF
	rpart  = STRTRAN(UPPER(ALLTRIM(p01.pm_part)),' ')
	*!*		IF rpart = "1J2721403A"
	*!*			SET STEP ON
	*!*		ENDIF
	SELECT p02
	SEEK rpart
	IF FOUND()
		rpartindex  = ALLTRIM(p02.ri_part)
		DO WHILE rpartindex == ALLTRIM(p02.ri_part)
			REPLACE p02.ri_part WITH p01.pm_part
			*		REPLACE p02.ri_srce  WITH p01.ri_srce
			ival5 = ival5 + 1
			@14,28 SAY ival5
			SKIP
		ENDDO
	ENDIF
	SELECT p01
	SKIP
ENDDO
CLOSE DATA ALL

SELECT 0
USE "N:\APPS\ACSS\pmast02.DBF" SHARED ALIAS p01   && Correct File

SELECT 0
USE "N:\APPS\ACSS\psales02.DBF" SHARED ALIAS p02  && Incorrect File
INDEX ON STRTRAN(UPPER(ALLTRIM(p02.ri_part)),'-') TO l
GO TOP

SELECT p01
DO WHILE !EOF()
	IF ALLTRIM(p01.pm_source) != "VW"
		SKIP
		LOOP
	ENDIF
	rpart = STRTRAN(UPPER(ALLTRIM(p01.pm_part)),' ')
	*!*		IF rpart = "1J2721403A"
	*!*			SET STEP ON
	*!*		ENDIF
	SELECT p02
	SEEK rpart
	IF FOUND()
		rpartindex  = ALLTRIM(p02.ri_part)
		DO WHILE rpartindex == ALLTRIM(p02.ri_part)
			REPLACE p02.ri_part  WITH p01.pm_part
			*		REPLACE p02.ri_srce  WITH p01.pm_source
			ival6 = ival6 + 1
			@15,28 SAY ival6
			SKIP
		ENDDO
	ENDIF
	SELECT p01
	SKIP
ENDDO
CLOSE DATA ALL

@17,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
