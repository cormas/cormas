navigation
nextColumn
	"return the next column name.
ex: curent column = 'A'  -> 'B'
ex: curent column = 'AA'  -> 'AB'
ex: curent column = 'ZZ'  -> 'AAA'
ex: curent column = 'CZ'  -> 'DA'
(! Only 256 columns in Excel. Last column = 'IV' ) not with Excel 97"
	
	| nonZ i chr |
	self currentCol last = $Z
		ifFalse:
			[currentCol := self currentCol asTwoByteString.
			currentCol
				at: self currentCol size
				put: (self incrChar: self currentCol last).
			^self currentCol]
		ifTrue:
			[nonZ := self currentCol select: [:ch | (ch = $Z) not].
			nonZ isEmpty
				ifTrue:
					[^'A'
						,
							(String
								new: self currentCol size
								withAll: $A)]
				ifFalse:
					[i := self currentCol findLast: [:ch | ch = nonZ last].
					chr := self incrChar: (self currentCol at: i).
					currentCol := self currentCol asTwoByteString.
					self currentCol at: i put: chr.
					i + 1
						to: self currentCol size
						do:
							[:j | 
							self currentCol
								at: j
								put: (self incrChar: (self currentCol at: j))].
					^self currentCol]]	"	self currentCol size = 1 ifTrue: [
							self currentCol first = $Z 
									ifFalse: [^self incrChar: self currentCol first]
									ifTrue: [^'AA']].
	self currentCol last = $Z 
		ifFalse: [^(self currentCol first asSymbol asString , (self incrChar: self currentCol last))]
		ifTrue: [^(self incrChar: self currentCol first)	, 'A']."