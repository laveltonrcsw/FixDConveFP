CLOSE DATA ALL
CLEAR
SET SAFETY OFF
SET EXCLUS OFF
SET DEFAULT TO "N:\Apps\Acss\"

SELECT 0
USE "C:\ACS\initdata\_addsercmnt\vinserial" SHARED ALIAS vin02 && Incorrect File

SELECT 0
USE vinmas SHARED ALIAS vin01 && Correct File
INDEX ON ALLTRIM(vi_vin) TO l
GO TOP

DO WHILE !EOF()
	SELECT vin01
	SEEK ALLTRIM(vin02.vi_vin)
	IF FOUND()
		IF !EMPTY(ALLTRIM(vin01.vi_cmnt))
			REPLACE vin01.vi_cmnt WITH vin01.vi_cmnt + ", " + vin02.vi_cmnt
		ELSE
			REPLACE vin01.vi_cmnt WITH vin02.vi_cmnt
		ENDIF
	ENDIF
	SELECT vin02
	SKIP
ENDDO
CLOSE DATA ALL
RETURN
