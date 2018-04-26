deprecated
prepareExcelConnexion
	
	| listePrinc colonne ligne excelClient resultat |
	self warn: 'Be sure that Excel is open'.
	colonne := 0.
	excelClient := ExcelClient new.
	listePrinc := self cormasModel class charts.
	listePrinc
		do:
			[:nom | 
			colonne := colonne + 1.
			ligne := 1.
			excelClient
				execute:
						'[SELECT("R' , ligne printString , 'C' , colonne printString , '")]';
				execute: '[FORMULA("' , nom printString , '")]'.
			(self cormasModel perform: nom) value
				do:
					[:coord | 
					ligne := ligne + 1.
					resultat := coord first.
					excelClient
						execute:
								'[SELECT("R' , ligne printString , 'C' , colonne printString , '")]';
						execute: '[FORMULA("' , resultat printString , '")]']]