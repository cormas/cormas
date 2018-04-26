compiling
createAttribute
	"Save definitively the changed parameters with the Initial value: compiles the attribute reader accessor and compiles the attribute_default method"
	
	| aRefactoring |
	targetClass withAllSuperclasses
		do:
			[:cl | 
			(cl instVarNames includes: self targetAttribute asString)
				ifTrue: [^targetAttribute]].	"Compile class adding the attribute"
	targetClass isMeta
		ifFalse:
			[aRefactoring := AddInstanceVariableRefactoring
				variable: targetAttribute asString
				class: targetClass.
			aRefactoring execute]
		ifTrue:
			[aRefactoring := AddInstanceVariableRefactoring
				variable: targetAttribute asString
				class: targetClass.
			aRefactoring transform.
			RefactoringManager instance addRefactoring: aRefactoring].
	^targetAttribute