*
*	Undelete customers for Carriage Inc.
*
*
CLOSE DATABASES ALL
CLEAR
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE OFF
SET CENTURY ON
_VFP.CAPTION = "Undelete customers for Carriage Inc."

PRIVATE iven, icus, irec

iven    = 0
icus    = 0
irec    = 0

@04,2 SAY "This program will undelete customers from Carriage   "
@05,2 SAY "Inc.'s Cusmas if they have not contact the store     "
@06,2 SAY "since 06/30/04, Press [ESC] to quit.                 "
@07,2 SAY ""
@09,2 SAY "Cust No. (Cusmas ) = "
@10,2 SAY "Vins No. (Vinmas ) = "

**** Step 1 ***** Remove All Customers and Date < 06/30/2004

SELECT 0
*USE "N:\DEL_CUS\_BAK\del_cus.DBF" SHARED ALIAS cus01
USE "C:\ACS\DEL_FIX\del_cus.DBF" SHARED ALIAS cus01

SELECT 0
*USE "N:\DEL_CUS\cusmas.DBF" SHARED ALIAS cus02
USE "N:\APPS\ACSS\cusmas.DBF" SHARED ALIAS cus02
INDEX ON Alltrim(fcustno) TO l
Set Filter to Deleted()
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
*USE "N:\DEL_CUS\_BAK\del_vin.DBF" SHARED ALIAS veh01
USE "C:\ACS\DEL_FIX\del_vin.DBF" SHARED ALIAS veh01

SELECT 0
*USE "N:\DEL_CUS\vinmas.DBF" SHARED ALIAS veh02
USE "N:\APPS\ACSS\vinmas.DBF" SHARED ALIAS veh02
INDEX ON ALLTRIM(vi_vin) TO l
Set Filter to Deleted()
GO TOP

SELECT veh01
DO WHILE !EOF()
	SELECT veh02
	SEEK ALLTRIM(veh01.vi_vin)
	IF FOUND() .AND. DELETED()
		IF !EMPTY(veh02.vi_service)
			IF veh02.vi_service < CTOD("06/30/2004")
				RECALL
				iven = iven + 1
				@10,23 SAY iven
			ENDIF
		ENDIF
	ENDIF
	SELECT veh01
	SKIP
ENDDO
CLOSE DATABASES ALL

*!*	SELECT 0
*!*	USE "N:\DEL_CUS\cusmas.dbf" ALIAS cus01
*!*	set filter to deleted()

*!*	SELECT 0
*!*	USE "N:\DEL_CUS\_BAK\cusmas.dbf" ALIAS cus02
*!*	go top
*!*	irec = recno()

*!*	DO WHILE !EOF()
*!*		SELECT cus01
*!*		go irec
*!*		IF alltrim(cus01.fcustno) == alltrim(cus02.fcustno) .and. deleted()
*!*	*	    set step on
*!*			RECALL
*!*			icus = icus + 1
*!*			@09,23 SAY icus
*!*		ENDIF
*!*		SELECT cus02
*!*		SKIP
*!*		irec = recno()
*!*	ENDDO
*!*	CLOSE DATABASES ALL

*!*	irec    = 0

*!*	SELECT 0
*!*	USE "N:\DEL_CUS\vinmas.dbf" ALIAS veh01
*!*	set filter to deleted()

@15,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
