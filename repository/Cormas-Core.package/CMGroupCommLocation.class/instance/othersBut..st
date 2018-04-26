+ components - accessing
othersBut: x
	
	| collection |
	collection := OrderedCollection new.
	self components do: [:other | other ~= x ifTrue: [collection add: other]].
	^collection