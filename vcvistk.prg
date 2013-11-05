CLEAR
CLOSE DATA ALL
SET EXCLUS OFF
c   = 0
c1  = ''

SELECT 2
USE masold01
INDEX ON vi_stk TO stk1

SELECT masold01
SET INDEX TO stk1
GO TOP
c1 = masold01.vi_stk
SKIP
DO WHILE !EOF()
	IF masold01.vi_stk = c1
		*	    brow
		c = c + 1
		SELECT masold01
	ENDIF
	c1 = masold01.vi_stk
	SKIP
ENDDO

@12,10 SAY 'Stock----->'
@12,22 SAY c

CLOSE DATA ALL
RETURN
