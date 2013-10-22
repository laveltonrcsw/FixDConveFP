CLOSE DATA ALL
CLEAR
SET SAFETY OFF
SET EXCLUS OFF

SELECT 0
USE "W:\Conversion Data\Data Files\WolfAutoCenter\final\VINMAS.DBF" SHARED ALIAS vin02 && Incorrect File

SELECT 0
USE "N:\APPS\ACSS\POLKVIN.DBF" SHARED ALIAS vin01 && Correct File
SET FILTER TO !EMPTY(ALLTRIM(pk_vin))
INDEX ON ALLTRIM(pk_vin) TO l
GO TOP
DO WHILE !EOF()
	SELECT vin01
	mypolkvin = LEFT(vin02.vi_vin,8) + "*" + SUBSTR(vin02.vi_vin,10,1) + "*******"
	SEEK ALLTRIM(mypolkvin)
	IF FOUND()
		REPLACE vin02.vi_maked  WITH UPPER(vin01.pk_make)
*		REPLACE vin02.vi_modeld WITH UPPER(vin01.pk_model)
		REPLACE vin02.vi_bodyt  WITH UPPER(vin01.pk_body)
		REPLACE vin02.vi_engint WITH UPPER(vin01.pk_cyl)
		REPLACE vin02.vi_class  WITH UPPER(vin01.pk_type)
	ENDIF
	SELECT vin02
	SKIP
ENDDO

SELECT vin02
GO TOP
REPLACE ALL vi_maket WITH LEFT(vi_maked,8) FOR EMPTY(ALLTRIM(vi_maket))
REPLACE ALL vi_class WITH "C" FOR ALLTRIM(vi_class) = "P"

SELECT vin02
GO TOP
DO WHILE !EOF()
	DO CASE
			* Cars
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'AM'
			REPLACE vin02.vi_bodyd WITH 'Ambulance'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'CB'
			REPLACE vin02.vi_bodyd WITH 'Cab & Chassis'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'CP'
			REPLACE vin02.vi_bodyd WITH 'Coupe'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'CV'
			REPLACE vin02.vi_bodyd WITH 'Convertible'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'HB'
			REPLACE vin02.vi_bodyd WITH 'Hatchback'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'HR'
			REPLACE vin02.vi_bodyd WITH 'Hearse'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'HT'
			REPLACE vin02.vi_bodyd WITH 'Hardtop'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'IN'
			REPLACE vin02.vi_bodyd WITH 'Incomplete'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'LB'
			REPLACE vin02.vi_bodyd WITH 'Liftback'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'LM'
			REPLACE vin02.vi_bodyd WITH 'Limousine'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'NB'
			REPLACE vin02.vi_bodyd WITH 'Notchback'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'PK'
			REPLACE vin02.vi_bodyd WITH 'Pickup'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'PC'
			REPLACE vin02.vi_bodyd WITH 'Pickup'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'PN'
			REPLACE vin02.vi_bodyd WITH 'Panel'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'P2'
			REPLACE vin02.vi_bodyd WITH '2 Passenger'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'P4'
			REPLACE vin02.vi_bodyd WITH '4 Passenger'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'RD'
			REPLACE vin02.vi_bodyd WITH 'Roadster'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'SB'
			REPLACE vin02.vi_bodyd WITH 'Sport Hatchback'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'SC'
			REPLACE vin02.vi_bodyd WITH 'Sport Coupe'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'SD'
			REPLACE vin02.vi_bodyd WITH 'Sedan'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'SV'
			REPLACE vin02.vi_bodyd WITH 'Sport Van'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'SW'
			REPLACE vin02.vi_bodyd WITH 'Station Wagon'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'UT'
			REPLACE vin02.vi_bodyd WITH 'Utility'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = 'WW'
			REPLACE vin02.vi_bodyd WITH 'Wide Wheel Wagon'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '2D'
			REPLACE vin02.vi_bodyd WITH 'Sedan 2 Dr.'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '2F'
			REPLACE vin02.vi_bodyd WITH 'Formal Hardtop 2 Dr.'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '2L'
			REPLACE vin02.vi_bodyd WITH 'Liftback 3 Dr.'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '2P'
			REPLACE vin02.vi_bodyd WITH 'Pillard Hardtop 2 Dr.'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '2T'
			REPLACE vin02.vi_bodyd WITH 'Hardtop 2 Dr.'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '2W'
			REPLACE vin02.vi_bodyd WITH 'Wagon 2 Dr.'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '3D'
			REPLACE vin02.vi_bodyd WITH 'Runabout 3 Dr.'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '3P'
			REPLACE vin02.vi_bodyd WITH 'Coupe 3 Dr.'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '4D'
			REPLACE vin02.vi_bodyd WITH 'Sedan 4 Dr.'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '4H'
			REPLACE vin02.vi_bodyd WITH 'Hatchback 5 Dr.'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '4L'
			REPLACE vin02.vi_bodyd WITH 'Liftback 5 Dr.'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '4P'
			REPLACE vin02.vi_bodyd WITH 'Pillard Hardtop 4 Dr.'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '4T'
			REPLACE vin02.vi_bodyd WITH 'Hardtop 4 Dr.'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '4W'
			REPLACE vin02.vi_bodyd WITH 'Wagon 4 Dr.'
		CASE ALLTRIM(vin02.vi_class) = 'C' .AND. ALLTRIM(vin02.vi_bodyt) = '5D'
			REPLACE vin02.vi_bodyd WITH 'Sedan 5 Dr.'

			* Trucks
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'AC'
			REPLACE vin02.vi_bodyd WITH 'Auto Carrier'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'AR'
			REPLACE vin02.vi_bodyd WITH 'Armored Truck'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'BU'
			REPLACE vin02.vi_bodyd WITH 'Bus'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'CB'
			REPLACE vin02.vi_bodyd WITH 'Cab & Chassis'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'CC'
			REPLACE vin02.vi_bodyd WITH 'Conventional Cab'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'CG'
			REPLACE vin02.vi_bodyd WITH 'Cargo Van'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'CH'
			REPLACE vin02.vi_bodyd WITH 'Crew Chassis'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'CL'
			REPLACE vin02.vi_bodyd WITH 'Club Chassis'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'CM'
			REPLACE vin02.vi_bodyd WITH 'Concrete Mixer'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'CR'
			REPLACE vin02.vi_bodyd WITH 'Crane'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'CS'
			REPLACE vin02.vi_bodyd WITH 'Super Cab/Chassis'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'CU'
			REPLACE vin02.vi_bodyd WITH 'Custom Pickup'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'CV'
			REPLACE vin02.vi_bodyd WITH 'Convertible'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'CW'
			REPLACE vin02.vi_bodyd WITH 'Crew Pickup'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'CY'
			REPLACE vin02.vi_bodyd WITH 'Cargo Cutaway'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'DP'
			REPLACE vin02.vi_bodyd WITH 'Dump'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'DS'
			REPLACE vin02.vi_bodyd WITH 'Tractor Truck'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'EC'
			REPLACE vin02.vi_bodyd WITH 'Extended Cargo Van'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'EV'
			REPLACE vin02.vi_bodyd WITH 'Ext Van'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'EW'
			REPLACE vin02.vi_bodyd WITH 'Extended Window Van'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'FB'
			REPLACE vin02.vi_bodyd WITH 'Flat-bed'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'FC'
			REPLACE vin02.vi_bodyd WITH 'Forward Control'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'FT'
			REPLACE vin02.vi_bodyd WITH 'Fire Truck'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'GG'
			REPLACE vin02.vi_bodyd WITH 'Garbage'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'GL'
			REPLACE vin02.vi_bodyd WITH 'Gliders'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'GN'
			REPLACE vin02.vi_bodyd WITH 'Grain'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'HO'
			REPLACE vin02.vi_bodyd WITH 'Hopper'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'IC'
			REPLACE vin02.vi_bodyd WITH 'Incomplete Chassis'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'IE'
			REPLACE vin02.vi_bodyd WITH 'Incomplete Ext Van'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'LG'
			REPLACE vin02.vi_bodyd WITH 'Logger'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'LL'
			REPLACE vin02.vi_bodyd WITH 'Suburban & Carry All'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'LM'
			REPLACE vin02.vi_bodyd WITH 'Limousine'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'MH'
			REPLACE vin02.vi_bodyd WITH 'Motorized Home'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'MP'
			REPLACE vin02.vi_bodyd WITH 'Muli-Purpose'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'MV'
			REPLACE vin02.vi_bodyd WITH 'Maxi Van'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'MY'
			REPLACE vin02.vi_bodyd WITH 'Motorized Cutaway'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'PC'
			REPLACE vin02.vi_bodyd WITH 'Pickup'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'PK'
			REPLACE vin02.vi_bodyd WITH 'Pickup'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'PM'
			REPLACE vin02.vi_bodyd WITH 'Pickup w/ Camper'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'PN'
			REPLACE vin02.vi_bodyd WITH 'Panel'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'PS'
			REPLACE vin02.vi_bodyd WITH 'Super Cab Pickup'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'RD'
			REPLACE vin02.vi_bodyd WITH 'Roadster'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'S1'
			REPLACE vin02.vi_bodyd WITH 'One Seat'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'S2'
			REPLACE vin02.vi_bodyd WITH 'Two Seat'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'SN'
			REPLACE vin02.vi_bodyd WITH 'Step Van'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'SP'
			REPLACE vin02.vi_bodyd WITH 'Sport Pickup'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'ST'
			REPLACE vin02.vi_bodyd WITH 'Stake'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'SV'
			REPLACE vin02.vi_bodyd WITH 'Sports Van'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'SW'
			REPLACE vin02.vi_bodyd WITH 'Station Wagon'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'TB'
			REPLACE vin02.vi_bodyd WITH 'Tilt Cab'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'TL'
			REPLACE vin02.vi_bodyd WITH 'Tilt Tandem'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'TM'
			REPLACE vin02.vi_bodyd WITH 'Tandem'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'TN'
			REPLACE vin02.vi_bodyd WITH 'Tank'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'TR'
			REPLACE vin02.vi_bodyd WITH 'Tractor Truck'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'UT'
			REPLACE vin02.vi_bodyd WITH 'Utility'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'VC'
			REPLACE vin02.vi_bodyd WITH 'Van Camper'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'VD'
			REPLACE vin02.vi_bodyd WITH 'Display Van'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'VN'
			REPLACE vin02.vi_bodyd WITH 'Van'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'VT'
			REPLACE vin02.vi_bodyd WITH 'Vanette'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'VW'
			REPLACE vin02.vi_bodyd WITH 'Window Van'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'WK'
			REPLACE vin02.vi_bodyd WITH 'Tow Truck Wrecker'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'WW'
			REPLACE vin02.vi_bodyd WITH 'Wide Wheel Wagon'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'XT'
			REPLACE vin02.vi_bodyd WITH 'Travelall'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = 'YY'
			REPLACE vin02.vi_bodyd WITH 'Cutaway'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = '2W'
			REPLACE vin02.vi_bodyd WITH '2 Dr. Wagon'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = '3B'
			REPLACE vin02.vi_bodyd WITH '3 Dr. Ext. Cab'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = '3C'
			REPLACE vin02.vi_bodyd WITH '3 Dr. Ext. Cab'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = '4B'
			REPLACE vin02.vi_bodyd WITH '4 Dr. Ext. Cab'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = '4C'
			REPLACE vin02.vi_bodyd WITH '4 Dr. Ext. Cab'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = '4W'
			REPLACE vin02.vi_bodyd WITH '4 Dr. Wagon'
		CASE ALLTRIM(vin02.vi_class) = 'T' .AND. ALLTRIM(vin02.vi_bodyt) = '8V'
			REPLACE vin02.vi_bodyd WITH '8 Passenger Van'

			* Motorcycles
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'AT'
			REPLACE vin02.vi_bodyd WITH 'All Terrain'
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'EN'
			REPLACE vin02.vi_bodyd WITH 'Enduro'
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'MK'
			REPLACE vin02.vi_bodyd WITH 'Mini Bike'
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'MM'
			REPLACE vin02.vi_bodyd WITH 'Mini Moto Cross'
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'MP'
			REPLACE vin02.vi_bodyd WITH 'Moped'
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'MR'
			REPLACE vin02.vi_bodyd WITH 'Mini Road/Trail'
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'MS'
			REPLACE vin02.vi_bodyd WITH 'Motor Scooter'
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'MX'
			REPLACE vin02.vi_bodyd WITH 'Moto Cross'
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'MY'
			REPLACE vin02.vi_bodyd WITH 'Mini Cycle'
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'RC'
			REPLACE vin02.vi_bodyd WITH 'Racer'
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'RS'
			REPLACE vin02.vi_bodyd WITH 'Road/Street'
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'RT'
			REPLACE vin02.vi_bodyd WITH 'Road/Trail'
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'T '
			REPLACE vin02.vi_bodyd WITH 'Dirt'
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'TL'
			REPLACE vin02.vi_bodyd WITH 'Trail/Dirt'
		CASE ALLTRIM(vin02.vi_class) = 'M' .AND. ALLTRIM(vin02.vi_bodyt) = 'TR'
			REPLACE vin02.vi_bodyd WITH 'Trail'
	ENDCASE
	SKIP
ENDDO

SELECT vin02
GO TOP
REPLACE ALL vi_bodyd  WITH UPPER(ALLTRIM(vi_bodyd))
REPLACE ALL vi_cclass WITH UPPER(ALLTRIM(vi_class))
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

CLOSE DATA ALL
RETURN
