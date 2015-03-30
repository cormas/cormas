alphabet
columnAsNumber: aColumnName
	"return the number of the column's name of Excel : 
 ExcelSheet columnAsNumber: 'AB' => 28 "
	
	^self allColumns indexOf: aColumnName