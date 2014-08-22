CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
_VFP.CAPTION = "Find Cove Ford Customers"

PRIVATE icust1, icust2
icust1 = 0
icust2 = 0

SELECT 0
USE "N:\Data_Conversions\COVE FORD\F&I\fimast.DBF" SHARED ALIAS fi01

SELECT 0
USE "N:\Data_Conversions\COVE FORD\vinmas.DBF" SHARED ALIAS svc01
INDEX ON ALLTRIM(vi_vin) TO l
SET ORDER TO l
GO TOP

@04,2 SAY ""
@05,2 SAY ""
@06,2 SAY ""
@10,2 SAY "Customer (SV1)  = "
@11,2 SAY "Customer (SV2)  = "

DO WHILE !EOF()
	SELECT svc01
	SEEK ALLTRIM(fi01.vin)
	IF FOUND()
		REPLACE svc01.vi_cust WITH fi01.dealnum
		icust1 = icust1 + 1
		@10,23 SAY icust1
	ENDIF
	SELECT fi01
	SKIP
ENDDO
CLOSE DATABASES ALL

*!*	SELECT 0
*!*	USE "C:\Data_Conversion\fimast.DBF" SHARED ALIAS fi01

*!*	SELECT 0
*!*	USE "C:\Data_Conversion\svc2.DBF" SHARED ALIAS svc01
*!*	INDEX ON ALLTRIM(vi_vin) TO l
*!*	SET ORDER TO l
*!*	GO TOP

*!*	DO WHILE !EOF()
*!*		SELECT svc01
*!*		SEEK ALLTRIM(fi01.vin)
*!*		IF FOUND()
*!*			REPLACE svc01.vi_cust WITH fi01.dealnum
*!*			icust2 = icust2 + 1
*!*			@11,23 SAY icust2
*!*		ENDIF
*!*		SELECT fi01
*!*		SKIP
*!*	ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
