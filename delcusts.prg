*
*	Delete customers for Clean-List Online.
*
*
CLOSE DATABASES ALL
CLEAR
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON
SET DEFAULT TO "X:\Lavelton\DELCUSTS"

_VFP.CAPTION = "Delete customers for Clean-List Online"

PRIVATE icus, prvdate
icus    = 0
prvdate = CTOD("")
cus_del = .T.

@04,2 SAY "This program will delete customers from Kia Store    "
@05,2 SAY "East's Cusmas if they have not contact the store     "
@06,2 SAY "since 01/01/01 and customers that don't live in KY   "
@07,2 SAY "or IN unless adate is greater than 08/01/05.         "
@09,2 SAY "Cust No. (1st Pass) = "
@10,2 SAY "Cust No. (2nd Pass) = "

**** Step 1 ***** Remove All Customers and Date < 01/01/2001

SELECT 0
USE vinmas ALIAS veh
SET ORDER TO vi_cust

SELECT 0
USE cusmas ALIAS cus
GO TOP

DO WHILE !EOF()
	IF VAL(cus.fcustno) < 20
		SKIP
		LOOP
	ENDIF
	IF !EMPTY(cus.cm_vendor)
		SKIP
		LOOP
	ENDIF
	SELECT veh
	SEEK ALLTRIM(cus.fcustno)
	IF FOUND()
		DO WHILE vi_cust == cus.fcustno
			IF veh.vi_dsld > CTOD("01/01/2001") .AND. !EMPTY(veh.vi_dsld)
				cus_del = .F.
			ENDIF
			IF veh.vi_tdlv > CTOD("01/01/2001") .AND. !EMPTY(veh.vi_tdlv)
				cus_del = .F.
			ENDIF
			IF veh.vi_service > CTOD("01/01/2001") .AND. !EMPTY(veh.vi_service)
				cus_del = .F.
			ENDIF
			SKIP
		ENDDO
		IF cus_del
			SELECT veh
			SEEK ALLTRIM(cus.fcustno)
			DO WHILE vi_cust == cus.fcustno
				DELETE
				SKIP
			ENDDO
			SELECT cus
			DELETE
			icus = icus + 1
			@09,23 SAY icus
			cus_del = .T.
		ENDIF
	ENDIF
	SELECT cus
	SKIP
ENDDO

CLOSE DATABASES ALL

**** Step 2 ***** Remove All Customers Not KY or IN and Date < 08/01/2005

SELECT 0
USE vinmas ALIAS veh
SET ORDER TO vi_cust

SELECT 0
USE cusmas ALIAS cus

GO TOP
cus_del = .T.
DO WHILE !EOF()
	IF VAL(cus.fcustno) < 20
		SKIP
		LOOP
	ENDIF
	IF !EMPTY(cus.cm_vendor)
		SKIP
		LOOP
	ENDIF

	IF ALLTRIM(cus.fstate) = "KY" .OR. ALLTRIM(cus.fstate) = "IN"
		SKIP
		LOOP
	ENDIF

	SELECT veh
	SEEK ALLTRIM(cus.fcustno)
	IF FOUND()
		DO WHILE vi_cust == cus.fcustno
			IF veh.vi_dsld > CTOD("08/01/2005") .AND. !EMPTY(veh.vi_dsld)
				cus_del = .F.
			ENDIF
			IF veh.vi_tdlv > CTOD("08/01/2005") .AND. !EMPTY(veh.vi_tdlv)
				cus_del = .F.
			ENDIF
			IF veh.vi_service > CTOD("08/01/2005") .AND. !EMPTY(veh.vi_service)
				cus_del = .F.
			ENDIF
			SKIP
		ENDDO
	ENDIF
	IF cus_del
		SELECT veh
		SEEK ALLTRIM(cus.fcustno)
		DO WHILE vi_cust == cus.fcustno
			DELETE
			SKIP
		ENDDO
		SELECT cus
		DELETE
		icus = icus + 1
		@10,23 SAY icus
	ENDIF
	cus_del = .T.
	SELECT cus
	SKIP
ENDDO

CLOSE DATABASES ALL

**** Step 3 ***** Recall All Customers Created By The Dealer
SELECT 0
USE cusmas
GOTO 22350
RECALL REST
CLOSE DATABASES ALL

SELECT 1
USE vinmas
GOTO 31739
RECALL REST
CLOSE DATABASES ALL

INKEY(3)

CLOSE DATABASES ALL
RETURN
