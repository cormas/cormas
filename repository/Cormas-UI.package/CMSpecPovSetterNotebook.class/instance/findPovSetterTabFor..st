initialization
findPovSetterTabFor: anEntity

	| modelClass |
	
	modelClass := (anEntity inheritsFrom: CMArcEntity)
		ifTrue: [ CMSpecPovSetter_Agent  ]
		ifFalse: [ 
			anEntity isSpatialClass 
				ifTrue: [ CMSpecPovSetter_SpatialEntity ]
				ifFalse: [ CMSpecPovSetter_Agent ] ].
	^ (modelClass for: self projectManager) setModelClass: anEntity