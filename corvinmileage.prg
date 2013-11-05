CLEAR
CLOSE DATABASES ALL
SET SAFETY OFF
SET EXCLUS OFF

SELECT 0
USE "n:\apps\acss\stdetl" SHARED ALIAS vin02
INDEX on td_edte TO l
GO TOP

SELECT 0
USE "n:\apps\acss\vinmas" SHARED ALIAS vin01
INDEX ON ALLTRIM(vi_vin) TO m
GO TOP

DO WHILE !EOF()
	SELECT vin01
	SEEK ALLTRIM(vin02.td_vin)
	IF FOUND()
		DO WHILE ALLTRIM(vin01.vi_vin) == ALLTRIM(vin02.td_vin) .AND. !EOF()
			REPLACE vin01.vi_misd WITH vin02.td_smil
			SKIP
		ENDDO
	ENDIF
	SELECT vin02
	SKIP
ENDDO

CLOSE DATA ALL
RETURN
