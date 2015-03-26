- binary storage
installNewEntities: aClass fromClone: cloneCormasModel
	"set the attribute theXXXs of a Class = arrayOfEntitiesSameClass"
	
	| coll |
	coll := (cloneCormasModel theEntities: aClass) copy.
	self
		perform: (self setterForEntityClass: aClass)
		with: coll.
	coll
		do:
			[:inst | 
			inst collector: self collector.
			inst isSpatialEntity ifTrue: [inst spaceModel: self spaceModel].
			inst isClassLocation
				ifTrue:
					[inst patch
						ifNotNil:
							[(inst isKindOf: ArcEntity)
								ifTrue:
									[(inst startNode notNil and: [inst stopNode notNil])
										ifTrue:
											[self
												registerEntityChange: #newArc
												with:
													(EntityReference on: inst startCell) -> (EntityReference on: inst stopCell)
												from: (EntityReference on: inst)]]
								ifFalse:
									[self
										registerEntityChange: #newOccupant
										with: (EntityReference on: inst patch)
										from: (EntityReference on: inst)]]]].
	aClass isSpatialClass
		ifTrue:
			[self spaceModel spatialEntities
				at: aClass name
				put: coll.
			aClass isSpatialEntityElementClass
				ifTrue:
					["newCells notification also dispatch the request to remoteSpaceModels to rebuild the cell figures"
					self spaceModel
						sendCellsToClientSpaceModels: (EntityReference onEntities: coll).	"dispatch the info that cells have been modifyed to all opened spaceInterfaces"
					self spaceModel changed: #newCells]
				ifFalse: [self registerSpaceModelChange: #newAggregates with: aClass]].
	aClass CurrentId: coll size