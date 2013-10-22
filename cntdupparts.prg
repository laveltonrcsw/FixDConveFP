CLOSE DATA ALL
CLEAR
SET EXCLUSIVE ON
SET EXACT ON

pt  = 0
pt1 = ''

SELECT 0
USE "M:\Visual FoxPro Projects\LC's Projects\FixDConve\dup"
ZAP

SELECT 0
USE "M:\Visual FoxPro Projects\Data_Conversions\New\OakleyMotors\PMAST01"
INDEX ON pm_part TO l
GO TOP
pt1 = pmast01.pm_part
SKIP
DO WHILE !EOF()
	IF pmast01.pm_part = pt1
		pt = pt + 1
		SELECT 0
		SELECT dup
		APPEN BLANK
		REPLACE pm_source WITH pmast01.pm_source
		REPLACE pm_part   WITH pmast01.pm_part
		REPLACE pm_date   WITH pmast01.pm_date
		REPLACE pm_adate  WITH pmast01.pm_adate
		REPLACE pm_otype  WITH pmast01.pm_otype
		REPLACE pm_onhand WITH pmast01.pm_onhand
		SELECT pmast01
	ENDIF
	pt1 = pmast01.pm_part
	SKIP
ENDDO

@10,10 SAY 'Parts-->'
@10,22 SAY pt

CLOSE DATA ALL
RETURN
