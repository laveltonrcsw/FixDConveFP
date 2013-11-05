CLOSE DATA ALL
SET SAFETY OFF
SET EXCLU OFF

PRIVATE ivin
ivin = 0

@04,2 SAY "VINMAS (H/U) = "
USE "n:\apps\vinmas.dbf" IN 0
* set filter to "H" $ alltrim(vi_stk) .or. "U" $ alltrim(vi_stk)
SET FILTER TO vi_maket = "HONDA" .AND. vi_nu = "N" .OR. vi_nu = "T" .AND. vi_comp = "01"
SELECT vinmas
GO TOP
DO WHILE !EOF()
	IF RLOCK()
		REPLACE vi_comp  WITH "02"
		REPLACE vi_ocomp WITH "02"
		ivin = ivin + 1
		@04,28 SAY ivin
		SKIP
	ELSE
		SKIP
	ENDIF
ENDDO
CLOSE DATA ALL
RETURN




