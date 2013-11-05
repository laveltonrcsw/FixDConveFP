CLOSE DATABASES ALL
CLEAR
SET DELE ON
SELECT 1
USE "M:\Visual FoxPro Projects\Data_Conversions\New\vinmas.dbf" SHARED
INDEX ON ALLTRIM(vi_vin)TO l
SET INDEX TO l
GO TOP
v = ALLTRIM(vi_vin)
SKIP
DO WHILE !EOF()
	IF ALLTRIM(vi_vin) == v .and. EMPTY(ALLTRIM(vi_deal))
		DELETE
	ENDIF
	v = ALLTRIM(vi_vin)
	SKIP

ENDDO
CLOSE DATA ALL
RETURN
