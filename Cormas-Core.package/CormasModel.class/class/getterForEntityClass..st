compiling
getterForEntityClass: aClass
	"efficiently create the getter selector for the entity class aClass (avoid concatenation).
	ex : self getterForEntityClass: Object -> #theObjects

	self basicNew getterForEntityClass: Object
	"
	
	| className getter |
	className := aClass name.
	getter := String new: className size + 4.
	getter replaceFrom: 1 to: 3 with: 'the' startingAt: 1.
	getter
		replaceFrom: 4
		to: getter size - 1
		with: className
		startingAt: 1.
	getter
		at: getter size
		put: $s.
	^getter asSymbol