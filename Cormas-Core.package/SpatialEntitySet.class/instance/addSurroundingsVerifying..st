+ components - managing
addSurroundingsVerifying: aCondition
	"Purpose: swells on its outer perimeter by the surrounding components verifying a specified condition
Argument: aCondition = <BlockClosure>
Return value: <Boolean> (has it spread or not)
Example: self addSurroundingsVerifying: [:c | c isClosed not]"
	
	| newCells |
	newCells := self surround
		select:
			[:c | (c isComponentOf: self class) not and: [aCondition value: c]].
	self addComponents: newCells.
	^newCells isEmpty not