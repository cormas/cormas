model entities
warnCormasModelThat: oldName changeTo: newClass
	
	| entities |
	(newClass inheritsFrom: CMSpatialEntity)
		ifTrue:
			["spaceModel"
			self spaceModel
				ifNotNil:
					[:sm | 
					entities := sm spatialEntities
						at: oldName
						ifAbsent: [nil].
					entities isNil ifTrue: [^nil].
					sm spatialEntities
						at: newClass name
						put: entities.
					sm spatialEntities removeKey: oldName.
					sm activeSpatialEntity = oldName asSymbol
						ifTrue: [sm activeSpatialEntity: newClass name]].	"cormasModel"
			(newClass inheritsFrom: CMSpatialEntityElement)
				ifTrue: [self cormasModel theESE: entities].
			(newClass inheritsFrom: CMSpatialEntityAggregate)
				ifTrue:
					[self cormasModel
						perform: ('the' , newClass name asString , 's:') asSymbol
						with: entities]].
	self alert_SaveModel