transforming
scaleBy: aScaleFactor
	"Answer a new object scaled by the argument amount, which can be
	a Point or a scalar value."
	
	| newDelimitors |
	self components do: [:fig | fig scaleBy: aScaleFactor].
	newDelimitors := OrderedCollection new: self delimitors size.
	self delimitors
		do: [:line | newDelimitors add: (line scaledBy: aScaleFactor)].
	delimitors := newDelimitors.
	self recomputePreferredBounds