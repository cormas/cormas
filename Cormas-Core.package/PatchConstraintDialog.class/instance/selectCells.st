actions
selectCells
	
	| collec |
	self shouldBeEmptyPatches value
		ifTrue: [collec := self cells select: [:e | e noOccupant]]
		ifFalse: [collec := self cells].
	((att1 value isNil not and: [att1Ope value ~= ''])
		and: [att1Value value isNil not])
		ifTrue:
			[collec := collec
				select:
					[:e | 
					(e perform: att1 value asSymbol)
						perform: att1Ope value asSymbol
						with: att1Value value]].
	((att2 value isNil not and: [att2Ope value ~= ''])
		and: [att2Value value isNil not])
		ifTrue:
			[collec := collec
				select:
					[:e | 
					(e perform: att2 value asSymbol)
						perform: att2Ope value asSymbol
						with: att2Value value]].
	self selectedCells: collec.
	self close