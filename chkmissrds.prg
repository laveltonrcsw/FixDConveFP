CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE OFF
_VFP.CAPTION = "Checking For Missing Records"

PRIVATE ival

ival = 0

@04,2 SAY ""
@05,2 SAY ""
@06,2 SAY ""
@10,2 SAY "Customers (Missing) = "

SELECT 0
USE "N:\Data_Conversions\cust3.DBF" SHARED ALIAS c01

SELECT 0
USE "N:\Data_Conversions\cust1.DBF" SHARED ALIAS c02
INDEX ON ALLTRIM(CUST) TO l
GO TOP

DO WHILE !EOF()
	SELECT c02
	SEEK ALLTRIM(c01.CUST)
	IF FOUND()
		* skip
	ELSE
		ival = ival + 1
		@11,23 SAY ival
	ENDIF
	SELECT c01
	SKIP
ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
