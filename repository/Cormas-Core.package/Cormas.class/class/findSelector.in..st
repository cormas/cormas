+ utilities - code management
findSelector: selector in: aClass

"Answer an Array with the class and method for this selector,
	or nil if the selector is not found.
	NicolasBecu 5/28/2015 19:38 -> copy from VW for Pharo integration"

	| meth |
	meth := aClass class compiledMethodAt: selector ifAbsent: [nil].
	meth == nil ifFalse: [^Array with: self with: meth].
	^aClass superclass == nil
		ifTrue: [nil]
		ifFalse: [Cormas findSelector: selector in: aClass superclass]