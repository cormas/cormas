landscape indices
meanPatchSize: aClass
	"return the data (a number) to be recorded"
	
	| size aggregates |
	aggregates := self cormasModel
		perform: ('the' , aClass name asString , 's') asSymbol.
	size := 0.
	aggregates do: [:a | size := size + a components size].
	^size / aggregates size