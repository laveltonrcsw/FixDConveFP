CLOSE DATABASES ALL
CLEAR
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON
_VFP.CAPTION = "Delete customers for BMG-Bradley Chevrolet"

PRIVATE ivin
ivin = 0


@04,2 SAY "This program will delete customers from BMG-Bradley  "
@05,2 SAY "Chevrolet's Cusmas/Vinmas if they have a vin year    "
@06,2 SAY "less than 1998, zipcode = 46106-47203, and customer  "
@07,2 SAY "class = R, Press [ESC] to quit.                      "
@08,2 SAY ""
@09,2 SAY "Vins No. (Vinmas) = "

**** Step 1 *****

SELECT 0
USE "M:\Visual FoxPro Projects\Data_Conversions\BMGBradley\EXPORT.DBF"   SHARED ALIAS vin02

SELECT 0
USE "\\acsserver\support\APPS\brdchev\vinmas02.DBF" SHARED ALIAS vin01
INDEX ON ALLTRIM(vi_vin) TO l
GO TOP

DO WHILE !EOF()
	SELECT vin01
	SEEK ALLTRIM(vin02.vi_vin)
	IF FOUND()
		DELETE
		ivin = ivin + 1
		@09,28 SAY ivin
	ENDIF
	SELECT vin02
	SKIP
ENDDO

@15,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN


*** Export.dbf Layout ***
* FCUSTNO, VI_VIN, VINCOUNT(N,10), TG_CNAME, TG_YR, ZAPME(L,1)
* TG: TGRP0974.DBF & CDX
