CLEAR
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET DELETED OFF
SET SAFETY OFF

PRIVATE iops
iops = 0
@10,2 SAY "OP-Code(s): (Fixed) = "

SELECT 0
USE "C:\ACS\initdata\fixopcodes\newopcode.dbf" SHARED ALIAS ops01

SELECT 0
USE "N:\Apps\Acss\opcode.dbf" SHARED ALIAS ops02
INDEX ON ALLTRIM(rp_mastrec) TO l
GO TOP

DO WHILE !EOF()
	SELECT ops02
	SEEK ALLTRIM(ops01.rp_mastrec)
	IF FOUND() &&.and. ALLTRIM(ops01.rp_mastrec) == ALLTRIM(ops02.rp_mastrec)
		REPLACE ops02.rp_code WITH ops01.rp_code
		iops = iops + 1
		@10,28 SAY iops
	ENDIF
	SELECT ops01
	SKIP
ENDDO

@12,2 SAY "The operation(s) is completed."

INKEY(5)


CLOSE DATABASES ALL
RETURN
