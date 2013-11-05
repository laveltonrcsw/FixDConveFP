CLOSE DATABASES ALL
CLEAR
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE OFF
SET CENTURY ON
SET EXACT ON
_VFP.CAPTION = "Undelete customers for Vorderman VW"

PRIVATE iven, icus, irec

iven    = 0
icus    = 0
irec    = 0

@04,2 SAY "This program will undelete customers from Vorderman  "
@05,2 SAY "VW's Cusmas if they have not contact the store       "
@06,2 SAY "since 12/31/02, Press [ESC] to quit.                 "
@07,2 SAY ""
@09,2 SAY "Cust No. (Cusmas ) = "
@10,2 SAY "Vins No. (Vinmas ) = "

**** Step 1 ***** Undelete All Customers and Date < 12/31/2002

SELECT 0
USE "C:\ACS\lrc\delcusmas.DBF" SHARED ALIAS cus01

SELECT 0
USE "N:\Apps\Acss\cusmas.DBF" SHARED ALIAS cus02
INDEX ON ALLTRIM(fcustno) TO l
SET FILTER TO DELETED()
GO TOP

SELECT cus01
DO WHILE !EOF()
	SELECT cus02
	SEEK ALLTRIM(cus01.fcustno)
	IF FOUND() .AND. DELETED()
		RECALL
		icus = icus + 1
		@09,23 SAY icus
	ENDIF
	SELECT cus01
	SKIP
ENDDO
CLOSE DATABASES ALL

SELECT 0
USE "C:\ACS\lrc\delvinmas.dbf" SHARED ALIAS veh01

SELECT 0
USE "N:\Apps\Acss\vinmas.DBF" SHARED ALIAS veh02
INDEX ON ALLTRIM(vi_vin) TO l
SET FILTER TO DELETED()
GO TOP

SELECT veh01
DO WHILE !EOF()
	SELECT veh02
	SEEK ALLTRIM(veh01.vi_vin)
	IF FOUND() .AND. DELETED()
*		IF !EMPTY(veh02.vi_service)
*			IF veh02.vi_service < CTOD("12/31/02")
				RECALL
				iven = iven + 1
				@10,23 SAY iven
*			ENDIF
*		ENDIF
	ENDIF
	SELECT veh01
	SKIP
ENDDO
CLOSE DATABASES ALL

@15,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
