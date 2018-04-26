alphabet
getAlphabet
	"ExcelSheet getAlphabet = OrderedCollection ($A $B $C ... $Z) = 26 letters"
	
	| c |
	c := OrderedCollection new: 26.
	1
		to: 127
		do:
			[:i | 
			(Character value: i) isAlphabetic
				ifTrue: [c add: (String with: (Character value: i) asUppercase)]].
	^c