- binary storage
installNewEntities: arrayOfEntitiesSameClass
	"set the attribute theXXXs of a Class = arrayOfEntitiesSameClass"
	
	| aClass coll newPatch |
	arrayOfEntitiesSameClass isEmpty ifTrue: [^nil].
	aClass := arrayOfEntitiesSameClass first class.
	coll := arrayOfEntitiesSameClass asOrderedCollection.
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
					["the patch may be an old instance. We must re-localize the agent"
					inst patch
						ifNotNil:
							[newPatch := self theESE at: inst patch id.
							(inst isKindOf: ArcEntity)
								ifTrue:
									[(inst startNode notNil and: [inst stopNode notNil])
										ifTrue:
											[| destination |
											destination := self theESE at: inst stopNode patch id.
											inst leave.
											inst isMovedFrom: newPatch to: destination]]
								ifFalse:
									[inst leave.
									inst moveTo: newPatch]]]].
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