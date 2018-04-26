change messages
changedExample
	
	| sel modelClass povSetter |
	
	self halt.
	(sel := self tabManager selectedTab) isNil 
		ifTrue: [ ^ self ].
	((modelClass := ('CM' , sel label) asClass) inheritsFrom: CMArcEntity)
		ifTrue: [povSetter := PovSetter_Arc new]
		ifFalse: [ 
			modelClass isSpatialClass
				ifTrue: [ povSetter := CMSpecPovSetter_SpatialEntity new ]
				ifFalse: [ povSetter := CMSpecPovSetter_Agent new ] ].
	povSetter cormas: cormas.
	(self builder componentAt: #pageHolder) widget client: povSetter spec:
			#windowSpec.
	povSetter setModelClass: modelClass