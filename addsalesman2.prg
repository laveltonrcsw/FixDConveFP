CLOSE DATABASES ALL
SET SAFETY OFF
SET EXCLUSIVE OFF


PRIVATE isale
isale  = 0

@04,2 SAY ""
@05,2 SAY ""
@06,2 SAY ""
@10,2 SAY "Salesman (438)  = "
@11,2 SAY "Salesman (445)  = "
@12,2 SAY "Salesman (471)  = "
@13,2 SAY "Salesman (490)  = "
@14,2 SAY "Salesman (405)  = "
@15,2 SAY "Salesman (412)  = "
@16,2 SAY "Salesman (462)  = "

SELECT 0
USE "N:\APPS\acss\vinmas.dbf" SHARED ALIAS vin01
SET FILTER TO vi_comp = "02" .AND. EMPTY(vi_slsm) .AND. vi_vstt = "S"
INDEX ON ALLTRIM(vi_vin) TO l
GO TOP

DO WHILE !EOF()
	SELECT vin01
	REPLACE vin01.vi_slsm WITH "000438"
	isale = isale + 1
	@10,23 SAY isale
	IF isale = 1338
		isale  = 0
		EXIT
	ENDIF
	SELECT vin01
	SKIP
ENDDO
CLOSE DATABASES ALL

SELECT 0
USE "N:\APPS\acss\vinmas.dbf" SHARED ALIAS vin01
SET FILTER TO vi_comp = "02" .AND. EMPTY(vi_slsm) .AND. vi_vstt = "S"
INDEX ON ALLTRIM(vi_vin) TO l
GO TOP

DO WHILE !EOF()
	SELECT vin01
	REPLACE vin01.vi_slsm WITH "000445"
	isale = isale + 1
	@11,23 SAY isale
	IF isale = 1338
		isale  = 0
		EXIT
	ENDIF
	SELECT vin01
	SKIP
ENDDO
CLOSE DATABASES ALL

SELECT 0
USE "N:\APPS\acss\vinmas.dbf" SHARED ALIAS vin01
SET FILTER TO vi_comp = "02" .AND. EMPTY(vi_slsm) .AND. vi_vstt = "S"
INDEX ON ALLTRIM(vi_vin) TO l
GO TOP

DO WHILE !EOF()
	SELECT vin01
	REPLACE vin01.vi_slsm WITH "000471"
	isale = isale + 1
	@12,23 SAY isale
	IF isale = 1338
		isale  = 0
		EXIT
	ENDIF
	SELECT vin01
	SKIP
ENDDO
CLOSE DATABASES ALL

SELECT 0
USE "N:\APPS\acss\vinmas.dbf" SHARED ALIAS vin01
SET FILTER TO vi_comp = "02" .AND. EMPTY(vi_slsm) .AND. vi_vstt = "S"
INDEX ON ALLTRIM(vi_vin) TO l
GO TOP

DO WHILE !EOF()
	SELECT vin01
	REPLACE vin01.vi_slsm WITH "000490"
	isale = isale + 1
	@13,23 SAY isale
	IF isale = 1338
		isale  = 0
		EXIT
	ENDIF
	SELECT vin01
	SKIP
ENDDO
CLOSE DATABASES ALL

SELECT 0
USE "N:\APPS\acss\vinmas.dbf" SHARED ALIAS vin01
SET FILTER TO vi_comp = "02" .AND. EMPTY(vi_slsm) .AND. vi_vstt = "S"
INDEX ON ALLTRIM(vi_vin) TO l
GO TOP

DO WHILE !EOF()
	SELECT vin01
	REPLACE vin01.vi_slsm WITH "000405"
	isale = isale + 1
	@14,23 SAY isale
	IF isale = 1338
		isale  = 0
		EXIT
	ENDIF
	SELECT vin01
	SKIP
ENDDO
CLOSE DATABASES ALL

SELECT 0
USE "N:\APPS\acss\vinmas.dbf" SHARED ALIAS vin01
SET FILTER TO vi_comp = "02" .AND. EMPTY(vi_slsm) .AND. vi_vstt = "S"
INDEX ON ALLTRIM(vi_vin) TO l
GO TOP

DO WHILE !EOF()
	SELECT vin01
	REPLACE vin01.vi_slsm WITH "000412"
	isale = isale + 1
	@15,23 SAY isale
	IF isale = 1338
		isale  = 0
		EXIT
	ENDIF
	SELECT vin01
	SKIP
ENDDO
CLOSE DATABASES ALL

SELECT 0
USE "N:\APPS\acss\vinmas.dbf" SHARED ALIAS vin01
SET FILTER TO vi_comp = "02" .AND. EMPTY(vi_slsm) .AND. vi_vstt = "S"
INDEX ON ALLTRIM(vi_vin) TO l
GO TOP

DO WHILE !EOF()
	SELECT vin01
	REPLACE vin01.vi_slsm WITH "000462"
	isale = isale + 1
	@16,23 SAY isale
	IF isale = 1338
		isale  = 0
		EXIT
	ENDIF
	SELECT vin01
	SKIP
ENDDO

@18,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN


