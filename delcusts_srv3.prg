*
*	Delete customers for Vorderman VW
*
CLOSE DATABASES ALL
CLEAR
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON
SET CENTURY ON
_VFP.CAPTION = "Delete customers for Vorderman VW"

PRIVATE icus, iven, iemp, cur_bal
icus    = 0
ivin    = 0
iven    = 0
iemp	= 0
cur_bal = 0

@04,2 SAY "This program will delete customers from Vorderman    "
@05,2 SAY "VW's Cusmas if they have numbers in the First Name   "
@06,2 SAY ", Last Name, or FCompany field.                      "
@07,2 SAY ""
@09,2 SAY "Cust No. (Cusmas ) = "
@10,2 SAY "Vend No. (Vendors) = "
@11,2 SAY "Empl No. (Employe) = "

**** Step 1 ***** Remove All Customers with Numbers in the First Name, Last Name or FCompany

SELECT 0
USE "C:\Development Projects\Visual FoxPro Projects\Data_Conversions\VordermanVW2\delcusmas_digits.dbf" EXCLUSIVE ALIAS delcus
ZAP
GO TOP

SELECT 0
USE "C:\Development Projects\Visual FoxPro Projects\Data_Conversions\VordermanVW2\delcusmas.dbf" ALIAS cus
INDEX ON ALLTRIM(fcustno) TO l
GO TOP

SELECT cus
DO WHILE !EOF()
	IF !EMPTY(ALLTRIM(cus.cm_vendor))
		iven = iven + 1
		@10,23 SAY iven
		SKIP
		LOOP
	ENDIF

	IF ALLTRIM(SUBSTR(cus.fcustno,1,1)) = "0" .OR. VAL(ALLTRIM(fcustno)) =< 10 .AND. VAL(ALLTRIM(fcustno)) >= 1
		iemp = iemp + 1
		@11,23 SAY iemp
		SKIP
		LOOP
	ENDIF

	IF ISDIGIT(SUBSTR(fcompany,1,4))
		SCATTER TO g
		SELECT delcus
		APPEND BLANK
		GATHER FROM g
		SELECT cus
		DELETE
		icus = icus + 1
		@09,23 SAY icus
	ENDIF
	SELECT cus
	SKIP
ENDDO

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
