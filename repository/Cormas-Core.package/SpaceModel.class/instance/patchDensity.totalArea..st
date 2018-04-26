landscape indices
patchDensity: aClass totalArea: aNumber
	"this method is created for cases where the totalArea is not equal to the total size of the grid"
	
	| aggregates |
	aggregates := self cormasModel
		perform: ('the' , aClass name asString , 's') asSymbol.
	^aggregates size / aNumber