*
*	Delete customers for Carriage Inc.
*
*
CLOSE DATABASES ALL
CLEAR
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON
SET CENTURY ON
_VFP.CAPTION = "Delete customers for Carriage Inc."

PRIVATE icus, iven, ivin, iarc, iemp, cur_bal
icus    = 0
ivin    = 0
iven    = 0
iarc    = 0
iemp	= 0
cur_bal = 0

@04,2 SAY "This program will delete customers from Carriage     "
@05,2 SAY "Inc.'s Cusmas if they have not contact the store     "
@06,2 SAY "since 06/30/04, Press [ESC] to quit.                 "
@07,2 SAY ""
@09,2 SAY "Cust No. (Cusmas ) = "
@10,2 SAY "Vins No. (Vinmas ) = "
@11,2 SAY "Vend No. (Vendors) = "
@12,2 SAY "Empl No. (Employe) = "
@13,2 SAY "ARCl No. (AR Cust) = "

**** Step 1 ***** Remove All Customers and Date < 06/30/2004

SELECT 0
USE "N:\APPS\ACSS\vinmas.dbf" ALIAS veh
INDEX ON ALLTRIM(vi_cust) TO l

SELECT 0
USE "N:\APPS\ACSS\cusmas.dbf" ALIAS cus
GO TOP

DO WHILE !EOF()
	IF !EMPTY(ALLTRIM(cus.cm_vendor))
		iven = iven + 1
		@11,23 SAY iven
		SKIP
		LOOP
	ENDIF

	IF ALLTRIM(SUBSTR(cus.fcustno,1,1)) = "0"
		iemp = iemp + 1
		@12,23 SAY iemp
		SKIP
		LOOP
	ENDIF

*!*		IF cus.cm_amtdue < 0
*!*			iarc = iarc + 1
*!*			@13,23 SAY iarc
*!*			SKIP
*!*			LOOP
*!*		ENDIF

	SELECT veh
	SEEK ALLTRIM(cus.fcustno)
	IF FOUND()
		dididel =.T.
		DO WHILE veh.vi_cust == cus.fcustno
			IF !EMPTY(veh.vi_tdlv)
				IF veh.vi_tdlv < CTOD("06/30/2004")
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
*!*			SELECT cus
*!*			IF dididel
*!*				DELETE
*!*				icus = icus + 1
*!*				@09,23 SAY icus
*!*			ENDIF
	ENDIF
	SELECT cus
	SKIP
ENDDO

@15,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN

* WINSQL 4.5
* Select cusmas.fcustno, cusmas.cm_vendor, vinmas.vi_cust, vinmas.vi_vin, vinmas.vi_service from (cusmas INNER JOIN vinmas ON cusmas.fcustno = vinmas.vi_cust)
* Where cusmas.cm_vendor != "V" AND vinmas.vi_service < CTOD("06/30/2004") AND !Empty(vinmas.vi_service)
* Group By cusmas.cm_vendor, cusmas.fcustno, vinmas.vi_vin, vinmas.vi_cust

* Visual Studio SQL Query
* SELECT    cusmas.fcustno, vinmas.vi_vin, vinmas.vi_cust, vinmas.vi_service
* FROM      vinmas, cusmas
* WHERE     vinmas.vi_cust = cusmas.fcustno AND ((vinmas.vi_service < CTOD('06 / 30 / 2004')) AND (NOT (cusmas.cm_vendor = '"V"')) OR
*           (NOT (vinmas.vi_service = CTOD('//'))))
* ORDER BY vinmas.vi_service, cusmas.fcustno
