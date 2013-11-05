*
*	Correct Delete Records.
*
*
CLOSE DATABASES ALL
CLEAR
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE OFF
_VFP.CAPTION = "Correct Delete Records"

PRIVATE ivin, icus, irec
ivin    = 0
icus    = 0
irec	= 0

@04,2 SAY "Correct Delete Records..."
@05,2 SAY ""
@06,2 SAY ""
@07,2 SAY ""
@09,2 SAY "Vins No. (Delete ) = "
@10,2 SAY "Cust No. (Delete ) = "

SELECT 0
USE "C:\ACS\_del_cus\vinmas.dbf" ALIAS veh01
set filter to deleted()

SELECT 0
USE "N:\APPS\ACSS\vinmas.dbf" ALIAS veh02
go top
irec = recno()

DO WHILE !EOF()
	SELECT veh02
	go irec
	IF alltrim(veh01.vi_vin) == alltrim(veh02.vi_vin)
		DELETE
		ivin = ivin + 1
		@09,23 SAY ivin
	ENDIF
	SELECT veh01
	SKIP
	irec = recno()
ENDDO
CLOSE DATABASES ALL

irec = 0
SELECT 0
USE "C:\ACS\_del_cus\cusmas.dbf" ALIAS cus01
set filter to deleted()

SELECT 0
USE "N:\APPS\ACSS\cusmas.dbf" ALIAS cus02
go top
irec = recno()

DO WHILE !EOF()
	SELECT cus02
	go irec
	IF alltrim(cus01.fcustno) == alltrim(cus02.fcustno)
		DELETE
		icus = icus + 1
		@10,23 SAY icus
	ENDIF
	SELECT cus01
	SKIP
	irec = recno()
ENDDO

@13,2 SAY "The operation(s) is completed."

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
