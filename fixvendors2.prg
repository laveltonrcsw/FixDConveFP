CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON

PRIVATE ival
ival = 0

@10,2 SAY "Vendors (Fixed) = "

SELECT 0
USE "C:\ACS\initdata\FixVendors\vendors.DBF" SHARED ALIAS ven01
GO TOP

SELECT 0
USE "N:\Apps\Acss\cusmas.DBF" SHARED ALIAS cus02
INDEX ON ALLTRIM(fcustno) TO N
GO TOP

SELECT ven01
GO TOP

DO WHILE !EOF()
	SELECT cus02
	GO TOP
	SEEK ALLTRIM(ven01.fcustno)
	IF FOUND()
		REPLACE cus02.cm_vencode WITH ALLTRIM(cus02.fcustno)
		REPLACE cus02.cm_vendor  WITH "V"
		ival = ival + 1
		@10,23 SAY ival
	ENDIF
	SELECT ven01
	SKIP
ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(3)

CLOSE DATABASES ALL
RETURN
