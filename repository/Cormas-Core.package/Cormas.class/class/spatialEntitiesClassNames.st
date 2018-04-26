accessing
spatialEntitiesClassNames
	
	| collec |
	collec := OrderedCollection new.
	self cmEnvironment allClasses "should be allEntityClasses ??" 
		do: [ : aClass | 
			(aClass inheritsFrom: CMSpatialEntity)
				ifTrue: [ collec add: aClass name asString ] ].
	^collec