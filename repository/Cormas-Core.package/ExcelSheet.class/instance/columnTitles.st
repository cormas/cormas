accessing
columnTitles
	"Answer an array with information (title) of the columns, from currentCol.
Ex: #('Time' 'cash_famA' 'cash_famB')"
	
	| range info |
	range := sheet getRange: 'A1:' , self previousColumn , '1'.
	[info := range value copy] ensure: [range release].
	^info at: 1