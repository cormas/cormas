landscape indices
patchDensity: aClass
	"return the data (a number) to be recorded"
	
	| aggregates |
	aggregates := self cormasModel
		perform: ('the' , aClass name asString , 's') asSymbol.
	^aggregates size / (self column * self line)