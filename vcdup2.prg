CLOSE DATA ALL
SET DELETED ON
SELECT 0
USE "M:\Visual FoxPro Projects\Data_Conversions\HarreldChevrolet\vinmas.dbf" SHARED
INDEX ON ALLTRIM(vi_vin) TO l
SET INDEX TO l
GO TOP
x = ALLTRIM(vi_vin)
SKIP
DO WHILE !EOF()
	IF ALLTRIM(vi_vin) == x
		SKIP -1
		IF ALLTRIM(vi_cust) = "1"
			SKIP
			IF !EMPTY(ALLTRIM(vi_deal))
				SKIP
			ELSE
				DELETE
			ENDIF
		ELSE
			SKIP
			IF ALLTRIM(vi_cust) = "2"
				DELETE
			ELSE
				SKIP -1
				DELETE
				SKIP
			ENDIF
		ENDIF
	ENDIF
	x = ALLTRIM(vi_vin)
	IF !EOF()
		SKIP
	ENDIF
ENDDO
SET DELETED OFF
CLOSE DATA ALL
RETURN
