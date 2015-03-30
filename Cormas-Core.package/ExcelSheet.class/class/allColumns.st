alphabet
allColumns
	"return an array containing all the column's names of Excel : 
 ExcelSheet allColumns = OrderedCollection ('A' 'B' 'C' ... 'Z' 'AA' 'AB' ... 'IV')"
	
	| c string |
	c := OrderedCollection new: 256.
	0
		to: 255
		do:
			[:i | 
			i > 25
				ifFalse: [string := self getAlphabet at: i + 1]
				ifTrue:
					[string := (self getAlphabet at: (i quo: 26))
						, (self getAlphabet at: i \\ 26 + 1)].
			c add: string].
	^c