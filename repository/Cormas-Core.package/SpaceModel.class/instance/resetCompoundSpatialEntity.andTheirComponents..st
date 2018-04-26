private - init
resetCompoundSpatialEntity: compoundClass andTheirComponents: componentClass
	
	(self spatialEntities at: componentClass name)
		do:
			[:c | 
			(c theCSE includesKey: compoundClass name)
				ifTrue:
					[c theCSE
						at: compoundClass name
						put: nil]].
	self spatialEntities
		at: compoundClass name
		put: OrderedCollection new.
	self cormasModel initializeTheEntity: compoundClass	"self changed: #createRegularAggregatesImagesFor: with: compoundClass"