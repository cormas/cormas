global variables
selectedVariableBinding
	
	| name |
	name := self selectedVariableName.
	name isNil ifTrue: [^nil].
	^(name includes: $.)
		ifTrue: [name asQualifiedReference bindingOrNil]
		ifFalse: [self nameSpace bindingFor: name asSymbol]