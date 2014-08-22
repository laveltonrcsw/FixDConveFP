CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON

PRIVATE ival
ival = 0

@10,2 SAY "Vendors (Fixed) = "

SELECT 0
USE "C:\ACS\initdata\vendors.DBF" SHARED ALIAS ven01
GO TOP

SELECT 0
USE "N:\APPS\ACSS\vinmas.DBF" SHARED ALIAS vin01
INDEX ON ALLTRIM(vi_cust) TO l
GO TOP

SELECT 0
USE "N:\APPS\ACSS\romast01.DBF" SHARED ALIAS rom01
INDEX ON ALLTRIM(rm_cust) TO m
GO TOP

SELECT 0
USE "N:\APPS\ACSS\cusmas.DBF" SHARED ALIAS cus02
INDEX ON ALLTRIM(fcustno) TO N
GO TOP

SELECT ven01
GO TOP

DO WHILE !EOF()
	SELECT cus02
	SEEK ALLTRIM(ven01.cm_vencode)
	IF FOUND()
		*      wait window cus02.fcustno
		REPLACE cus02.fcustno WITH ven01.fcustno
	ENDIF

	SELECT vin01
	SEEK ven01.cm_vencode
	IF FOUND()
		DO WHILE ALLTRIM(ven01.cm_vencode) == ALLTRIM(vin01.vi_cust)
			REPLACE vin01.vi_cust WITH PADL(ALLTRIM(ven01.fcustno),6)
			SKIP
			SELECT vin01
			GO TOP
			SEEK ven01.cm_vencode
		ENDDO
	ENDIF

	SELECT cus02
	GO TOP
	SEEK ALLTRIM(ven01.fcustno)
	IF FOUND()
		DO WHILE ALLTRIM(ven01.fcustno) == ALLTRIM(cus02.fcustno)
			IF cus02.cm_vendor = "V"
				REPLACE cus02.fcustno WITH PADL(ALLTRIM(ven01.cm_vencode),6)
				REPLACE cus02.cm_vencode WITH ven01.cm_vencode
			ENDIF
			SKIP
		ENDDO
	ENDIF

	SELECT rom01
	SEEK ALLTRIM(ven01.cm_vencode)
	IF FOUND()
		DO WHILE ALLTRIM(rom01.rm_cust) == ALLTRIM(ven01.cm_vencode)
			REPLACE rom01.rm_cust WITH PADL(ALLTRIM(ven01.fcustno),6)
			*			REPLACE rom01.rm_name WITH ven01.fcompany
			SKIP
			SELECT rom01
			GO TOP
			SEEK ven01.cm_vencode
		ENDDO
	ENDIF
	ival = ival + 1
	@10,23 SAY ival

	SELECT ven01
	SKIP
ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(3)

CLOSE DATABASES ALL
RETURN


