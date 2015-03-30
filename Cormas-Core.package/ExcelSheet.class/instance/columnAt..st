navigation
columnAt: aNumber
	"return the 'aNumber' column name.
ex: self columnAt: 1   -> 'A'
ex: self columnAt: 76 -> 'BX'
! Only 256 columns in Excel. Last column = 'IV' "
	
	aNumber > 256
		ifTrue: [^self error: 'Number of column exceeds Excel capacities'].
	self currentCol size = 1
		ifTrue:
			[self currentCol first = $Z
				ifFalse: [^self incrChar: self currentCol first]
				ifTrue: [^'AA']].
	self currentCol last = $Z
		ifFalse:
			[^self currentCol first asSymbol asString
				, (self incrChar: self currentCol last)]
		ifTrue: [^(self incrChar: self currentCol first) , 'A']