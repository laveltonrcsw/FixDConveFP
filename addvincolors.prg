CLOSE DATA ALL
SELECT 0
USE instock
GO TOP

REPLACE ALL vi_colort WITH 'BLU'  FOR AT('BLUE',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'BLK'  FOR AT('BLACK',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'RED'  FOR AT('RED',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'WHT'  FOR AT('WHITE',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'GRN'  FOR AT('GREEN',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'GRY'  FOR AT('GREY',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'GRY'  FOR AT('GRAY',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'BRN'  FOR AT('BROWN',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'SLV'  FOR AT('SILVER',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'BLU'  FOR AT('INDIGO',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'GRN'  FOR AT('EMERALD',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'TAN'  FOR AT('TAN',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'MRN'  FOR AT('MAROON',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'GRH'  FOR AT('GRAPH',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'YEL'  FOR AT('YELLOW',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'SLV'  FOR AT('PEW',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'TAN'  FOR AT('SAND',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'TEL'  FOR AT('TEAL',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'GRN'  FOR AT('FOREST',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'BLU'  FOR AT('ROYAL',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'SAND' FOR AT('BEIGH',SUBSTR(vinclr,1,8))> 0
REPLACE ALL vi_colort WITH 'GLD'  FOR AT('GOLD',SUBSTR(vinclr,1,8))> 0
GO TOP

REPLACE ALL vi_clre   WITH 'AM' FOR ALLTRIM(vi_colort) = "AME"
REPLACE ALL vi_clre   WITH 'BG' FOR ALLTRIM(vi_colort) = "BEI"
REPLACE ALL vi_clre   WITH 'BG' FOR ALLTRIM(vi_colort) = "BGE"
REPLACE ALL vi_clre   WITH 'BK' FOR ALLTRIM(vi_colort) = "BLK"
REPLACE ALL vi_clre   WITH 'BL' FOR ALLTRIM(vi_colort) = "BLU"
REPLACE ALL vi_clre   WITH 'BR' FOR ALLTRIM(vi_colort) = "BRN"
REPLACE ALL vi_clre   WITH 'BR' FOR ALLTRIM(vi_colort) = "BRO"
REPLACE ALL vi_clre   WITH 'BZ' FOR ALLTRIM(vi_colort) = "BRZ"
REPLACE ALL vi_clre   WITH 'CR' FOR ALLTRIM(vi_colort) = "CRM"
REPLACE ALL vi_clre   WITH 'DB' FOR ALLTRIM(vi_colort) = "DBL"
REPLACE ALL vi_clre   WITH 'GD' FOR ALLTRIM(vi_colort) = "GLD"
REPLACE ALL vi_clre   WITH 'GR' FOR ALLTRIM(vi_colort) = "GRN"
REPLACE ALL vi_clre   WITH 'GY' FOR ALLTRIM(vi_colort) = "GRY"
REPLACE ALL vi_clre   WITH 'LB' FOR ALLTRIM(vi_colort) = "LBL"
REPLACE ALL vi_clre   WITH 'MR' FOR ALLTRIM(vi_colort) = "MAR"
REPLACE ALL vi_clre   WITH 'MR' FOR ALLTRIM(vi_colort) = "MRN"
REPLACE ALL vi_clre   WITH 'MU' FOR ALLTRIM(vi_colort) = "MUL"
REPLACE ALL vi_clre   WITH 'PR' FOR ALLTRIM(vi_colort) = "PLE"
REPLACE ALL vi_clre   WITH 'PK' FOR ALLTRIM(vi_colort) = "PNK"
REPLACE ALL vi_clre   WITH 'RE' FOR ALLTRIM(vi_colort) = "RED"
REPLACE ALL vi_clre   WITH 'SV' FOR ALLTRIM(vi_colort) = "SIL"
REPLACE ALL vi_clre   WITH 'SV' FOR ALLTRIM(vi_colort) = "SLV"
REPLACE ALL vi_clre   WITH 'TN' FOR ALLTRIM(vi_colort) = "TAN"
REPLACE ALL vi_clre   WITH 'WH' FOR ALLTRIM(vi_colort) = "WHI"
REPLACE ALL vi_clre   WITH 'WH' FOR ALLTRIM(vi_colort) = "WHT"
REPLACE ALL vi_clre   WITH 'YL' FOR ALLTRIM(vi_colort) = "YEL"
REPLACE ALL vi_clre   WITH 'GD' FOR ALLTRIM(vi_colort) = "GLD"

CLOSE DATA ALL
RETURN
