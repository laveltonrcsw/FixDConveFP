CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON

PRIVATE ival
ival  = 0

SELECT 0
USE "N:\Apps\Acss\masold01.DBF" SHARED ALIAS mas01

SELECT 0
USE "N:\Apps\Acss\vinmas.DBF" SHARED ALIAS vin02
INDEX ON ALLTRIM(vi_cust) TO l
GO TOP

SELECT mas01
DO WHILE !EOF()
	SELECT vin02
	SEEK ALLTRIM(mas01.vi_cust)
	IF FOUND()
		REPLACE vin02.vi_bkdate WITH mas01.vi_bkdate
		ival = ival + 1
		@10,23 SAY ival
	ENDIF
	SELECT mas01
	SKIP
ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
