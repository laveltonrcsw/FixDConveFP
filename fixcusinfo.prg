*
*	Fix Cusmas's Company, First, Last and FCClass Data Conversion Information.
*
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETED ON
_VFP.CAPTION = "Fixing Data Conversion Information"

PRIVATE icus, icom, fspace, ipos
icus   = 0
icom   = 0
ipos   = 0
fspace = 0

@04,2 SAY "This program will fix the Cusmas's Company, First, "
@05,2 SAY "Last and FCClass fields. "
@07,2 SAY "Customer(s): (Fixed) = "
@08,2 SAY "Companies..: (Fixed) = "

SELECT 0
USE cusmas ALIAS cus
INDEX ON fcustno TO l
GO TOP

DO WHILE !EOF()
	fspace = OCCURS(" ", ALLTRIM(cus.fcompany))
	IF EMPTY(ALLTRIM(cus.cm_last)) .AND. EMPTY(ALLTRIM(cus.cm_frst))
		IF fspace  = 1
			*			@05,28 SAY SUBSTR(ALLTRIM(cus.fcompany),1,AT(" ",ALLTRIM(cus.fcompany)))
			REPLACE cm_frst WITH SUBSTR(ALLTRIM(fcompany),1,AT(" ",ALLTRIM(fcompany)))
			REPLACE cm_last WITH SUBSTR(ALLTRIM(fcompany),RAT(" ",ALLTRIM(fcompany))+1)
			*			REPLACE fcompany WITH SUBSTR(ALLTRIM(fcompany),RAT(" ",ALLTRIM(fcompany))+1) + ", " + SUBSTR(ALLTRIM(fcompany),1,AT(" ",ALLTRIM(fcompany)))
			icus = icus + 1
			@07,28 SAY icus
		ELSE
			REPLACE cm_last WITH ALLTRIM(fcompany)
			icom = icom + 1
			@08,28 SAY icom
		ENDIF
	ENDIF
	SELECT cus
	IF !EOF()
		SKIP
	ENDIF
ENDDO

@09,2 SAY "Checking Companies... "
SELECT cus
GO TOP
DO WHILE !EOF()
	IF !EMPTY(ALLTRIM(cus.cm_frst))
		REPLACE fcompany WITH ALLTRIM(cus.cm_last) + ", " + ALLTRIM(cus.cm_frst)
	ENDIF
	SELECT cus
	IF !EOF()
		SKIP
	ENDIF
ENDDO
@09,2 SAY "Checking Companies... Done!"

@10,2 SAY "Checking FCClass...   "
SELECT cus
GO TOP
DO WHILE !EOF()
	IF EMPTY(ALLTRIM(cus.cm_frst))
		REPLACE fcclass WITH "C"
	ELSE
		REPLACE fcclass WITH "R"
	ENDIF
	SELECT cus
	IF !EOF()
		SKIP
	ENDIF
ENDDO
@10,2 SAY "Checking FCClass...   Done!"

@11,2 SAY "Finalizing Cusmas...  "
SELECT cus
GO TOP
DO WHILE !EOF()
	REPLACE ALL cus.fcompany  WITH ALLTRIM(cus.fcompany)
	REPLACE ALL cus.cm_last   WITH ALLTRIM(cus.cm_last)
	REPLACE ALL cus.cm_frst   WITH ALLTRIM(cus.cm_frst)
	REPLACE ALL cus.faddr1    WITH ALLTRIM(cus.faddr1)
	REPLACE ALL cus.fcity     WITH ALLTRIM(cus.fcity)
	REPLACE ALL cus.fstate    WITH ALLTRIM(cus.fstate)
	REPLACE ALL cus.fzip      WITH ALLTRIM(cus.fzip)
	REPLACE ALL cus.fphone    WITH ALLTRIM(cus.fphone)
	REPLACE ALL cus.fphone2   WITH ALLTRIM(cus.fphone2)
	REPLACE ALL cus.cm_stts   WITH ALLTRIM(cus.cm_stts)
ENDDO
@11,2 SAY "Finalizing Cusmas...  Done!"

@13,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN
