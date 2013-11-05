*
*	Replaces dup. vi_stk with S (1st), R (2nd), T (3rd) etc. if founded.
*	SELECT vi_vin, vi_cust, count(vi_stk) FROM vinmas GROUP BY vinmas.vi_stk;
*	vinmas.vi_vin HAVING Count(vinmas.stk) > 1
*
CLOSE DATABASES ALL
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETED ON
SET DEFAULT TO "N:\Apps\acss"
_VFP.CAPTION = "Fixing Vinmas's Duplicate Stock Numbers"

PRIVATE vc1
vc1 = 0

@04,2 SAY "This program will replace the Vinmas's Duplicate "
@05,2 SAY "Stock Numbers with the same Stock Number followed "
@06,2 SAY "by a 'S' at the end of the number. Press [ESC] to quit."

SELECT 0
USE vinmas
INDEX ON vi_stk + vi_cust TO l
GO TOP

vc1 = vinmas.vi_stk
SKIP

DO WHILE !EOF()
	IF vinmas.vi_stk = vc1 .AND. vi_cust <> "     1"
		REPLACE vi_stk WITH PADL(ALLTRIM(vi_stk) + "S", 6)
		SKIP
	ENDIF
	vc1 = vinmas.vi_stk
	SELECT vinmas
	IF !EOF()
		SKIP
	ENDIF
ENDDO

@08,2 SAY "The operation(s) is completed."

INKEY(5)

CLOSE DATABASES ALL
RETURN

