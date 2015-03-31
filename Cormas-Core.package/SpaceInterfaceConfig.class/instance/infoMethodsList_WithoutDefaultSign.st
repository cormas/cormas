aspects
infoMethodsList_WithoutDefaultSign
	
	| aList aDefInfoWithSign |
	aList := self infoMethodsList list copy.
	aDefInfoWithSign := aList
		detect: [:m | self isItDefault: m]
		ifNone: [^self infoMethodsList copy].
	aList remove: aDefInfoWithSign.
	aList add: (self defaultInfo at: self observedEntitiesList selection).
	aList sort: [:x :y | x < y].
	^MultiSelectionInList with: aList