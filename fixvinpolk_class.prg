CLOSE DATABASES ALL
CLEAR
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETED OFF

SELECT 0
USE "W:\Conversion Data\Data Files\MitchellChevrolet\f_i\final\MASOLD01" SHARED ALIAS vin02 && Incorrect File
*!* SET FILTER TO ALLTRIM(vi_vstt) != "I"

SELECT 0
USE "W:\Conversion Data\Data Files\POLKVIN.DBF" SHARED ALIAS vin01 && Correct File
SET FILTER TO !EMPTY(ALLTRIM(pk_vin))
INDEX ON ALLTRIM(pk_vin) TO l
GO TOP
DO WHILE !EOF()
    SELECT vin01
    mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,1) + "*******"
    SEEK ALLTRIM(mypolkvin)
    IF FOUND()
        REPLACE vin02.vi_class WITH UPPER(vin01.pk_type)
    ELSE
        mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,8)
        SEEK ALLTRIM(mypolkvin)
        IF FOUND()
            REPLACE vin02.vi_class WITH UPPER(vin01.pk_type)
        ELSE
            mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,7) + "*"
            SEEK ALLTRIM(mypolkvin)
            IF FOUND()
                REPLACE vin02.vi_class WITH UPPER(vin01.pk_type)
            ELSE
                mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,6) + "**"
                SEEK ALLTRIM(mypolkvin)
                IF FOUND()
                    REPLACE vin02.vi_class WITH UPPER(vin01.pk_type)
                ELSE
                    mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,5) + "***"
                    SEEK ALLTRIM(mypolkvin)
                    IF FOUND()
                        REPLACE vin02.vi_class WITH UPPER(vin01.pk_type)
                    ELSE
                        mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,3) + "*****"
                        SEEK ALLTRIM(mypolkvin)
                        IF FOUND()
                            REPLACE vin02.vi_class WITH UPPER(vin01.pk_type)
                        ELSE
                            mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,1) + "*" + SUBSTR(vin02.vi_vin,12,3) + "***"
                            SEEK ALLTRIM(mypolkvin)
                            IF FOUND()
                                REPLACE vin02.vi_class WITH UPPER(vin01.pk_type)
                            ELSE
                                mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,1) + "**" + SUBSTR(vin02.vi_vin,13,1) + "****"
                                SEEK ALLTRIM(mypolkvin)
                                IF FOUND()
                                    REPLACE vin02.vi_class WITH UPPER(vin01.pk_type)
                                ENDIF
                            ENDIF
                        ENDIF
                    ENDIF
                ENDIF
            ENDIF
        ENDIF
    ENDIF

    SELECT vin02
    SKIP
ENDDO

SELECT vin02
GO TOP
REPLACE ALL vi_class WITH "C" FOR ALLTRIM(vi_class) = "P"
GO TOP
REPLACE ALL vi_class  WITH "C" FOR EMPTY(ALLTRIM(vi_class))
REPLACE ALL vi_cclass WITH ""
GO TOP
*!* REPLACE ALL vi_nu    WITH "U" FOR VAL(vi_yr) > 1910 .AND. VAL(vi_yr) < YEAR(DATE()) &&.AND. EMPTY(ALLTRIM(vi_nu))
*!* REPLACE ALL vi_nu    WITH "N" FOR VAL(vi_yr) > 2012 &&.AND. EMPTY(ALLTRIM(vi_nu))
REPLACE ALL vi_nu    WITH "T" FOR ALLTRIM(vi_nu) = "N" .AND. ALLTRIM(vi_class) = "T"
REPLACE ALL vi_nu    WITH "K" FOR ALLTRIM(vi_nu) = "U" .AND. ALLTRIM(vi_class) = "T"
REPLACE ALL vi_nu    WITH "O" FOR ALLTRIM(vi_class) != "C" .AND. ALLTRIM(vi_class) != "T"

**** For McCrocklin Only ****

*!*	GO TOP
*!*	REPLACE ALL vi_lotl  WITH ""
*!*	REPLACE ALL vi_lotl  WITH "01" FOR ALLTRIM(vi_class) = "C"
*!*	REPLACE ALL vi_lotl  WITH "01" FOR ALLTRIM(vi_class) = "T"
*!*	REPLACE ALL vi_lotl  WITH "01" FOR ALLTRIM(vi_class) = "V"
*!*	REPLACE ALL vi_lotl  WITH "02" FOR ALLTRIM(vi_bodyt) = "3W" .AND. ALLTRIM(vi_class) = "O"
*!*	REPLACE ALL vi_lotl  WITH "02" FOR ALLTRIM(vi_bodyt) = "4W" .AND. ALLTRIM(vi_class) = "O"
*!*	REPLACE ALL vi_lotl  WITH "02" FOR ALLTRIM(vi_bodyt) = "LC" .AND. ALLTRIM(vi_class) = "O"
*!*	REPLACE ALL vi_lotl  WITH "02" FOR ALLTRIM(vi_bodyt) = "MA" .AND. ALLTRIM(vi_class) = "O"
*!*	REPLACE ALL vi_lotl  WITH "02" FOR ALLTRIM(vi_bodyt) = "MP" .AND. ALLTRIM(vi_class) = "O"
*!*	REPLACE ALL vi_lotl  WITH "02" FOR ALLTRIM(vi_bodyt) = "MR" .AND. ALLTRIM(vi_class) = "O"
*!*	REPLACE ALL vi_lotl  WITH "02" FOR ALLTRIM(vi_bodyt) = "PC" .AND. ALLTRIM(vi_class) = "O"
*!*	REPLACE ALL vi_lotl  WITH "02" FOR ALLTRIM(vi_bodyt) = "PL" .AND. ALLTRIM(vi_class) = "O"
*!*	REPLACE ALL vi_lotl  WITH "02" FOR ALLTRIM(vi_bodyt) = "SL" .AND. ALLTRIM(vi_class) = "O"
*!*	GO TOP

CLOSE DATABASES ALL
RETURN
