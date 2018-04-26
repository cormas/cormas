accessing method dictionary
findMethod: method forClass: aClass
	"Answer an Array with the class and selector for this method,
	or nil if the method is not found."
	
	| sel |
	sel := aClass
		compiledMethodAt: method
		ifAbsent: [nil].
	sel == nil ifFalse: [^Array with: aClass with: sel].
	^aClass superclass == nil
		ifTrue: [nil]
		ifFalse:
			[self
				findMethod: method
				forClass: aClass superclass]