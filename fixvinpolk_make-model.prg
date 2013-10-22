CLOSE DATABASES ALL
CLEAR
SET EXCLUSIVE  OFF
SET SAFETY OFF
SET DELETED OFF

SELECT 0
USE "W:\Conversion Data\Data Files\BarrettChevrolet\f_i\DATA\vinmas" SHARED ALIAS vin02 && Incorrect File
*!* SET FILTER TO ALLTRIM(vi_vstt) != "I"
GO TOP

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
		REPLACE vin02.vi_yr     WITH UPPER(ALLTRIM(vin01.pk_yr))
		REPLACE vin02.vi_maket  WITH UPPER(ALLTRIM(vin01.pk_make))
		REPLACE vin02.vi_maked  WITH UPPER(ALLTRIM(vin01.pk_make))
		REPLACE vin02.vi_modelt WITH UPPER(ALLTRIM(vin01.pk_model))
		REPLACE vin02.vi_modeld WITH UPPER(ALLTRIM(vin01.pk_model))
		REPLACE vin02.vi_bodyt  WITH UPPER(ALLTRIM(vin01.pk_body))
		REPLACE vin02.vi_engint WITH UPPER(ALLTRIM(vin01.pk_cyl))
*!*			REPLACE vin02.rm_year   WITH UPPER(vin01.pk_yr)
*!*			REPLACE vin02.rm_make   WITH UPPER(vin01.pk_make)
*!*			REPLACE vin02.rm_model  WITH UPPER(vin01.pk_model)
	ELSE
		mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,8)
		SEEK ALLTRIM(mypolkvin)
		IF FOUND()
			REPLACE vin02.vi_yr     WITH UPPER(ALLTRIM(vin01.pk_yr))
			REPLACE vin02.vi_maket  WITH UPPER(ALLTRIM(vin01.pk_make))
			REPLACE vin02.vi_maked  WITH UPPER(ALLTRIM(vin01.pk_make))
			REPLACE vin02.vi_modelt WITH UPPER(ALLTRIM(vin01.pk_model))
			REPLACE vin02.vi_modeld WITH UPPER(ALLTRIM(vin01.pk_model))
			REPLACE vin02.vi_bodyt  WITH UPPER(ALLTRIM(vin01.pk_body))
			REPLACE vin02.vi_engint WITH UPPER(ALLTRIM(vin01.pk_cyl))
*!*			REPLACE vin02.rm_year   WITH UPPER(vin01.pk_yr)
*!*			REPLACE vin02.rm_make   WITH UPPER(vin01.pk_make)
*!*			REPLACE vin02.rm_model  WITH UPPER(vin01.pk_model)
		ELSE
			mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,7) + "*"
			SEEK ALLTRIM(mypolkvin)
			IF FOUND()
				REPLACE vin02.vi_yr     WITH UPPER(ALLTRIM(vin01.pk_yr))
				REPLACE vin02.vi_maket  WITH UPPER(ALLTRIM(vin01.pk_make))
				REPLACE vin02.vi_maked  WITH UPPER(ALLTRIM(vin01.pk_make))
				REPLACE vin02.vi_modelt WITH UPPER(ALLTRIM(vin01.pk_model))
				REPLACE vin02.vi_modeld WITH UPPER(ALLTRIM(vin01.pk_model))
				REPLACE vin02.vi_bodyt  WITH UPPER(ALLTRIM(vin01.pk_body))
				REPLACE vin02.vi_engint WITH UPPER(ALLTRIM(vin01.pk_cyl))
*!*			REPLACE vin02.rm_year   WITH UPPER(vin01.pk_yr)
*!*			REPLACE vin02.rm_make   WITH UPPER(vin01.pk_make)
*!*			REPLACE vin02.rm_model  WITH UPPER(vin01.pk_model)
			ELSE
				mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,6) + "**"
				SEEK ALLTRIM(mypolkvin)
				IF FOUND()
					REPLACE vin02.vi_yr     WITH UPPER(ALLTRIM(vin01.pk_yr))
					REPLACE vin02.vi_maket  WITH UPPER(ALLTRIM(vin01.pk_make))
					REPLACE vin02.vi_maked  WITH UPPER(ALLTRIM(vin01.pk_make))
					REPLACE vin02.vi_modelt WITH UPPER(ALLTRIM(vin01.pk_model))
					REPLACE vin02.vi_modeld WITH UPPER(ALLTRIM(vin01.pk_model))
					REPLACE vin02.vi_bodyt  WITH UPPER(ALLTRIM(vin01.pk_body))
					REPLACE vin02.vi_engint WITH UPPER(ALLTRIM(vin01.pk_cyl))
*!*			REPLACE vin02.rm_year   WITH UPPER(vin01.pk_yr)
*!*			REPLACE vin02.rm_make   WITH UPPER(vin01.pk_make)
*!*			REPLACE vin02.rm_model  WITH UPPER(vin01.pk_model)
				ELSE
					mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,5) + "***"
					SEEK ALLTRIM(mypolkvin)
					IF FOUND()
						REPLACE vin02.vi_yr     WITH UPPER(ALLTRIM(vin01.pk_yr))
						REPLACE vin02.vi_maket  WITH UPPER(ALLTRIM(vin01.pk_make))
						REPLACE vin02.vi_maked  WITH UPPER(ALLTRIM(vin01.pk_make))
						REPLACE vin02.vi_modelt WITH UPPER(ALLTRIM(vin01.pk_model))
						REPLACE vin02.vi_modeld WITH UPPER(ALLTRIM(vin01.pk_model))
						REPLACE vin02.vi_bodyt  WITH UPPER(ALLTRIM(vin01.pk_body))
						REPLACE vin02.vi_engint WITH UPPER(ALLTRIM(vin01.pk_cyl))
*!*			REPLACE vin02.rm_year   WITH UPPER(vin01.pk_yr)
*!*			REPLACE vin02.rm_make   WITH UPPER(vin01.pk_make)
*!*			REPLACE vin02.rm_model  WITH UPPER(vin01.pk_model)
					ELSE
						mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,3) + "*****"
						SEEK ALLTRIM(mypolkvin)
						IF FOUND()
							REPLACE vin02.vi_yr     WITH UPPER(ALLTRIM(vin01.pk_yr))
							REPLACE vin02.vi_maket  WITH UPPER(ALLTRIM(vin01.pk_make))
							REPLACE vin02.vi_maked  WITH UPPER(ALLTRIM(vin01.pk_make))
							REPLACE vin02.vi_modelt WITH UPPER(ALLTRIM(vin01.pk_model))
							REPLACE vin02.vi_modeld WITH UPPER(ALLTRIM(vin01.pk_model))
							REPLACE vin02.vi_bodyt  WITH UPPER(ALLTRIM(vin01.pk_body))
							REPLACE vin02.vi_engint WITH UPPER(ALLTRIM(vin01.pk_cyl))
*!*			REPLACE vin02.rm_year   WITH UPPER(vin01.pk_yr)
*!*			REPLACE vin02.rm_make   WITH UPPER(vin01.pk_make)
*!*			REPLACE vin02.rm_model  WITH UPPER(vin01.pk_model)
						ELSE
							mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,1) + "*" + SUBSTR(vin02.vi_vin,12,3) + "***"
							SEEK ALLTRIM(mypolkvin)
							IF FOUND()
								REPLACE vin02.vi_yr     WITH UPPER(ALLTRIM(vin01.pk_yr))
								REPLACE vin02.vi_maket  WITH UPPER(ALLTRIM(vin01.pk_make))
								REPLACE vin02.vi_maked  WITH UPPER(ALLTRIM(vin01.pk_make))
								REPLACE vin02.vi_modelt WITH UPPER(ALLTRIM(vin01.pk_model))
								REPLACE vin02.vi_modeld WITH UPPER(ALLTRIM(vin01.pk_model))
								REPLACE vin02.vi_bodyt  WITH UPPER(ALLTRIM(vin01.pk_body))
								REPLACE vin02.vi_engint WITH UPPER(ALLTRIM(vin01.pk_cyl))
*!*			REPLACE vin02.rm_year   WITH UPPER(vin01.pk_yr)
*!*			REPLACE vin02.rm_make   WITH UPPER(vin01.pk_make)
*!*			REPLACE vin02.rm_model  WITH UPPER(vin01.pk_model)
							ELSE
								mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,1) + "**" + SUBSTR(vin02.vi_vin,13,1) + "****"
								SEEK ALLTRIM(mypolkvin)
								IF FOUND()
									REPLACE vin02.vi_yr     WITH UPPER(ALLTRIM(vin01.pk_yr))
									REPLACE vin02.vi_maket  WITH UPPER(ALLTRIM(vin01.pk_make))
									REPLACE vin02.vi_maked  WITH UPPER(ALLTRIM(vin01.pk_make))
									REPLACE vin02.vi_modelt WITH UPPER(ALLTRIM(vin01.pk_model))
									REPLACE vin02.vi_modeld WITH UPPER(ALLTRIM(vin01.pk_model))
									REPLACE vin02.vi_bodyt  WITH UPPER(ALLTRIM(vin01.pk_body))
									REPLACE vin02.vi_engint WITH UPPER(ALLTRIM(vin01.pk_cyl))
*!*			REPLACE vin02.rm_year   WITH UPPER(vin01.pk_yr)
*!*			REPLACE vin02.rm_make   WITH UPPER(vin01.pk_make)
*!*			REPLACE vin02.rm_model  WITH UPPER(vin01.pk_model)
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
DO WHILE !EOF()
    mymodellen = ALINES(mymodelt,ALLTRIM(vin02.vi_modelt)," ")
    DO CASE
        CASE mymodellen = 2
            REPLACE vin02.vi_modelt WITH mymodelt(1)
        CASE mymodellen = 3
            REPLACE vin02.vi_modelt WITH mymodelt(1)
        CASE mymodellen = 4
            REPLACE vin02.vi_modelt WITH mymodelt(1)
    ENDCASE
    SKIP
ENDDO

CLOSE DATABASES ALL
RETURN
