* Pré-processamento das bases de dados da ./RAIS *

foreach year in "2013" "2014" "2015":
	
	foreach uf in AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO:

		log using ./RAIS/`uf'`year'.log,replace

		insheet using ./RAIS/`uf'`year'.txt, delimiter (";")

		keep municpio faixaetria tamanhoestabelecimento cnae95classe msadmisso msdesligamento municpio tipoadmisso tipovnculo vnculoativo3112 sexotrabalhador tamanhoestabelecimento escolaridadeaps2005 faixatempoemprego faixaremunmdiasm vlremunmdianom vlremundezembronom

		gen dsexoma=sexotrabalhador==1
		destring cnae95classe, replace
		gen indcnae95=cnae95classe/1000
		replace indcnae95=floor(indcnae95)
		gen industry=1 if indcnae95 >= 1 & indcnae95 <= 3
		replace industry= 1 if indcnae95 ==5
		replace industry= 2 if indcnae95 ==10
		replace industry= 2 if indcnae95 ==11
		replace industry= 2 if indcnae95 ==13
		replace industry= 2 if indcnae95 ==14
		replace industry= 3 if indcnae95 ==45
		replace industry= 4 if indcnae95 ==40
		replace industry= 4 if indcnae95 ==41
		replace industry= 4 if indcnae95 ==90
		replace industry= 5 if indcnae95 >= 15 & indcnae95 <= 37
		replace industry= 6 if indcnae95 >= 50 & indcnae95 <= 52
		replace industry= 6 if indcnae95 == 55
		replace industry= 6 if indcnae95 >= 60 & indcnae95 <= 67
		replace industry= 6 if indcnae95 >= 70 & indcnae95 <= 75
		replace industry= 6 if indcnae95 == 80
		replace industry= 6 if indcnae95 == 85
		replace industry= 6 if indcnae95 >= 91 & indcnae95 <= 93
		replace industry= 6 if indcnae95 == 95
		replace industry= 6 if indcnae95 == 99
		replace escolaridadeaps2005 = 10 if escolaridadeaps2005== 9
		replace escolaridadeaps2005 = 11 if escolaridadeaps2005== 9
		gen admi=( msadmisso>0 & msadmisso<13)
		gen admjan = msadmisso==1
		gen admfev = msadmisso==2
		gen admmar = msadmisso==3
		gen admabri= msadmisso==4
		gen admmaio = msadmisso==5
		gen admjun = msadmisso==6
		gen admjul = msadmisso==7
		gen admago = msadmisso==8
		gen admset = msadmisso==9
		gen admout = msadmisso==10
		gen admnov = msadmisso==11
		gen admdez = msadmisso==12
		gen des=( msdesligamento >0 & msadmisso<13)
		gen desjan = msdesligamento == 1
		gen desfev = msdesligamento == 2
		gen desmar = msdesligamento == 3
		gen desabri= msdesligamento == 4
		gen desmaio = msdesligamento == 5
		gen desjun = msdesligamento == 6
		gen desjul = msdesligamento == 7
		gen desago = msdesligamento == 8
		gen desset = msdesligamento == 9
		gen desout = msdesligamento == 10
		gen desnov = msdesligamento == 11
		gen desdez = msdesligamento == 12
		gen vincativodez= vnculoativo3112==1

		destring vlremundezembronom  vlremunmdianom, replace dpcomma

		gen uf=`uf'

		collapse(sum) admi-vincativodez vlremundezembronom vlremunmdianom, by (municpio tamanhoestabelecimento uf industry faixaetria dsexoma faixatempoemprego faixaremunmdiasm escolaridadeaps2005)

		tab dsexoma, gen(sexo)

		gen year=`year'

		save ./RAIS/`year'_`uf'.dta

		log close
		clear

