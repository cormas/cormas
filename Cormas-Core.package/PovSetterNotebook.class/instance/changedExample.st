change messages
changedExample
	
	| sel modelClass povSetter |
	sel := self majorKeys selection.
	sel isNil ifTrue: [^self].
	modelClass := cormasModel classFromSymbol: sel.
	(modelClass inheritsFrom: ArcEntity)
		ifTrue: [povSetter := PovSetter_Arc new]
		ifFalse:
			[modelClass isSpatialClass
				ifTrue: [povSetter := PovSetter_SpatialEntity new]
				ifFalse: [povSetter := PovSetter_Agent new]].
	povSetter cormas: cormas.
	(self builder componentAt: #pageHolder) widget client: povSetter spec:
			#windowSpec.
	povSetter setModelClass: modelClass