navigation
previousColumn
	"return the previous column name.
ex: curent column = 'B'  -> 'A'
ex: curent column = 'AB'  -> 'AA'
! If currentCOl = 'A', return the last one ('IV' ) "
	
	self currentCol = 'A' ifTrue: [^'IV'].
	self currentCol size = 1
		ifTrue: [^self previousChar: self currentCol last].
	self currentCol last = $A
		ifFalse:
			[^self currentCol first asSymbol asString
				, (self previousChar: self currentCol last)]
		ifTrue:
			[self currentCol first = $A
				ifFalse: [^(self previousChar: self currentCol first) , 'Z']
				ifTrue: [^'Z']]