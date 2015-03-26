updating
update: anAspectSymbol with: aParameter from: aSender
	
	anAspectSymbol == #name ifTrue: [^self recomputePreferredBounds].
	^super update: anAspectSymbol with: aParameter from: aSender