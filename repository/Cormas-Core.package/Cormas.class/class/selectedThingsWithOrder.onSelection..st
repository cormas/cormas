util_export
selectedThingsWithOrder: aBlock onSelection: aNameSpace
	
	| things |
	things := OrderedCollection new.
	things add: aNameSpace.
	things addAll: aNameSpace allClasses.
	things addAll: aNameSpace allNameSpaces.
	things := SystemUtils sortForLoading: things.
	aBlock value: things