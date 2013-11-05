*
*	Add Dick Krieg Salesmen to Vinmas
*
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DEFAULT TO "N:\Apps\acss\"

PRIVATE isale
isale = 0

@04,2 SAY ""
@05,2 SAY ""
@06,2 SAY ""
@10,2 SAY "Salesman (UPD)  = "

* use salesmen exclus
* zap
* append from SALESMAN.txt sdf
* delete all for empty(alltrim(vin))
* pack
* replace all vin with alltrim(vin)
* replace all smens with alltrim(smens)
* replace all sname with alltrim(sname)
* replace all dealer with alltrim(dealer)
* replace all smens with padl(alltrim(smens),6,"0") for !empty(smens)

SELECT 0
USE salesmen SHARED ALIAS sal01

SELECT 0
USE vinmas SHARED ALIAS vin01
INDEX ON ALLTRIM(vi_vin) TO l
SET ORDER TO l
GO TOP

DO WHILE !EOF()
	SELECT vin01
	SEEK ALLTRIM(sal01.vin)
	IF FOUND()
		REPLACE vin01.vi_slsm WITH sal01.smens
		isale = isale + 1
		@10,23 SAY isale
	ENDIF
	SELECT sal01
	SKIP
ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
