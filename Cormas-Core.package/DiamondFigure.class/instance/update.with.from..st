updating
update: anAspectSymbol with: aParameter from: aSender
	
	anAspectSymbol == #name ifTrue: [^self recomputePreferredBounds].
	anAspectSymbol = #deleted ifTrue: [^self deletionUpdateFrom: aSender].
	^super update: anAspectSymbol with: aParameter from: aSender