aspects
povMethodsList_WithoutDefaultSign
	
	| aList aDefPovWithSign |
	aList := self povMethodsList list copy.
	aDefPovWithSign := aList
		detect: [:m | self isItDefault: m]
		ifNone: [^self povMethodsList copy].
	aList remove: aDefPovWithSign.
	aList add: (self defaultPov at: self observedEntitiesList selection).
	aList sort: [:x :y | x < y].
	^MultiSelectionInList with: aList