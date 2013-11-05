*
*	Delete all menus for ACS modules.
*
*
CLOSE DATABASES ALL
CLEAR
SET EXCLUSIVE OFF
SET SAFETY OFF

** Delete the AC Menu
USE N:\Apps\Acss\acmenu
DELETE ALL
APPEND FROM c:\acs\ab\acmenu
CLOSE DATABASES ALL

** Delete the PS Menu
USE N:\Apps\Acss\psmenu
DELETE ALL
APPEND FROM c:\acs\ab\psmenu
CLOSE DATABASES ALL

** Delete the NU Menu
USE N:\Apps\Acss\numenu
DELETE ALL
APPEND FROM c:\acs\ab\numenu
CLOSE DATABASES ALL