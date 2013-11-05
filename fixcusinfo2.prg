*
*	Fixing Cusmas Phone and Phone 2
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON
_VFP.CAPTION = "Fixing Cusmas Phone and Phone 2"

PRIVATE ival

ival = 0

@04,2 SAY ""
@05,2 SAY ""
@06,2 SAY ""
@10,2 SAY "Customers (Fixed) = "

SELECT 0
USE "C:\ACS\Download\cusmas.DBF" SHARED ALIAS c01

SELECT 0
USE "N:\Apps\Acss\cusmas.DBF" SHARED ALIAS c02
SET ORDER TO fcustno

GO TOP

DO WHILE !EOF()
	SELECT c02
	SEEK c01.fcustno
*	SET STEP ON
	IF FOUND()
		REPLACE c02.fphone  WITH c01.fphone
		REPLACE c02.fphone2 WITH c01.fphone2
		ival = ival + 1
		@10,23 SAY ival
	ENDIF
	SELECT c01
	SKIP
ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
