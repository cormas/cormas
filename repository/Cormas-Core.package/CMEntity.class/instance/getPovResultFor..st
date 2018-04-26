- displaying
getPovResultFor: selectorName
	"Returns the povSymbol for a selectorName"
	
	selectorName ifNil: [^nil].
	^selectorName = #nil
		ifFalse:
			[self perform: selectorName	"ifNil:
					[Dialog warn: 'The pov metod #' , selectorName , ' did not return a symbol or a colorValue, but a nil value.
This is not allowed!']"]
		ifTrue: [selectorName]