cd 
mkdir 

use 2015_DF/2015_DF.dta
append using 2015_GO/2015_GO.dta
append using 2015_MS/2015_MS.dta
append using 2015_MT/2015_MT.dta
save ./processed/centro-oeste_2015.dta
clear

use 2015_AL/2015_AL.dta
append using 2015_BA/2015_BA.dta
append using 2015_CE/2015_CE.dta
append using 2015_MA/2015_MA.dta
append using 2015_PB/2015_PB.dta
append using 2015_PE/2015_PE.dta
append using 2015_PI/2015_PI.dta
append using 2015_RN/2015_RN.dta
append using 2015_SE/2015_SE.dta
save ./processed/nordeste_2015.dta
clear

use 2015_AM/2015_AM.dta
append using 2015_AP/2015_AP.dta
append using 2015_PA/2015_PA.dta
append using 2015_RO/2015_RO.dta
append using 2015_RR/2015_RR.dta
append using 2015_TO/2015_TO.dta
save ./processed/norte_2015.dta
clear

use using 2015_ES/2015_ES.dta
append using 2015_MG/2015_MG.dta
append using 2015_RJ/2015_RJ.dta
* append using 2015_SP/2015_SP.dta
save ./processed/sudeste_2015.dta
clear

use 2015_PR/2015_PR.dta
append using 2015_RS/2015_RS.dta
append using 2015_SC/2015_SC.dta
save ./processed/sul_2015.dta
clear
