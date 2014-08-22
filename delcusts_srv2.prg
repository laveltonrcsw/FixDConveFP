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

PRIVATE icus, iven, ivin, iemp, cur_bal
icus    = 0
ivin    = 0
iven    = 0
iemp	= 0
cur_bal = 0

@04,2 SAY "This program will delete customers from Vorderman    "
@05,2 SAY "VW's Cusmas if they have not contact the store       "
@06,2 SAY "since 12/31/02, Press [ESC] to quit.                 "
@07,2 SAY ""
@09,2 SAY "Cust No. (Cusmas ) = "
@10,2 SAY "Vins No. (Vinmas ) = "
@11,2 SAY "Vend No. (Vendors) = "
@12,2 SAY "Empl No. (Employe) = "

**** Step 1 ***** Remove All Customers and Date < 12/31/2002

SELECT 0
USE "C:\ACS\lrc\delcusmas.dbf" EXCLUSIVE ALIAS delcus
ZAP
GO TOP

SELECT 0
USE "C:\ACS\lrc\delvinmas.dbf" EXCLUSIVE ALIAS delvin
ZAP
GO TOP

SELECT 0
USE "C:\ACS\cusmas.dbf" ALIAS cus
GO TOP

SELECT 0
USE "C:\ACS\vinmas.dbf" ALIAS veh
INDEX ON ALLTRIM(vi_cust) TO l
GO TOP

SELECT cus
DO WHILE !EOF()
	IF !EMPTY(ALLTRIM(cus.cm_vendor))
		iven = iven + 1
		@11,23 SAY iven
		SKIP
		LOOP
	ENDIF

	IF ALLTRIM(SUBSTR(cus.fcustno,1,1)) = "0" .OR. VAL(ALLTRIM(fcustno)) =< 10 .AND. VAL(ALLTRIM(fcustno)) >= 1
		iemp = iemp + 1
		@12,23 SAY iemp
		SKIP
		LOOP
	ENDIF

	SELECT veh
	SEEK ALLTRIM(cus.fcustno)
	IF FOUND()
		dididel =.T.
		DO WHILE veh.vi_cust == cus.fcustno
			IF !EMPTY(veh.vi_tdlv)
				IF veh.vi_tdlv < CTOD("12/31/2002")
					SCATTER TO g
					SELECT delvin
					APPEND BLANK
					GATHER FROM g					
					SELECT veh
					DELETE
					ivin = ivin + 1
					@10,23 SAY ivin
				ELSE
					dididel = .F.
				ENDIF
			ELSE
				dididel = .F.
			ENDIF
			SKIP
		ENDDO
		SELECT cus
		IF dididel
			SCATTER TO g
			SELECT delcus
			APPEND BLANK
			GATHER FROM g
			SELECT cus
			DELETE
			icus = icus + 1
			@09,23 SAY icus
		ENDIF
	ENDIF
	SELECT cus
	SKIP
ENDDO

@15,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
