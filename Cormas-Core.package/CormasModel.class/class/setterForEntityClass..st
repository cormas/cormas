compiling
setterForEntityClass: aClass
	"efficiently create the setter selector for the entity class aClass (avoid concatenation).
	ex : Object -> #theObjects:

	self basicNew setterForEntityClass: Object 
	"
	
	| className getter |
	className := aClass name.
	getter := String new: className size + 5.
	getter replaceFrom: 1 to: 3 with: 'the' startingAt: 1.
	getter
		replaceFrom: 4
		to: getter size - 2
		with: className
		startingAt: 1.
	getter
		at: getter size - 1
		put: $s.
	getter
		at: getter size
		put: $:.
	^getter asSymbol