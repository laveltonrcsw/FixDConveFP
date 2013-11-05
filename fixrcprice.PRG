close data all
set safety off
set exclus off

select 0
use pmast01
go top
do while !eof()
	if pm_rtail = 0.00
		replace pm_rtail with pm_cost*0.50	&&// Change with every conversion //&&
	endif
	if pm_wsale = 0.00
		replace pm_wsale with pm_cost*0.20	&&// Change with every conversion //&&
	endif
	skip
enddo

close data all
return