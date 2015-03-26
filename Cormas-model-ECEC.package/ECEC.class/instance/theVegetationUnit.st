accessing
theVegetationUnit
	
	^self theVegetationUnits isEmpty
		ifTrue: [nil]
		ifFalse: [self theVegetationUnits first]