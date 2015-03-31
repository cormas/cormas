adding-removing
updateFigureForEntityReference: anEntityReference ifPovNameIs: aPovName
	"update the figure corresponding to anEntityReference (and its model, namely currentPov) in case the current values of the povResult and infoResult of the model of figure are different from the one of a updatedPovSpec which is newly calculated using the povSelector and infoName of the model of the figure.
	This method allows to manage figures which have a same enityType but not a same povSelector or povName"
	
	| aFig currentPov aSelector newPov currentPatch updatedPovSpec startPatch stopPatch |
	aFig := self findRegisteredFigureFor: anEntityReference.
	aFig ifNil: [^nil].
	currentPov := aFig model.
	aSelector := currentPov name.
	(currentPov povResult ~= aPovName
		or: [aSelector = #nil or: [aSelector = #delimitors]]) ifTrue: [^nil].	"Delimitors are updated only when the components of a spatialSet is changed"
	updatedPovSpec := anEntityReference entity
		getPovSpecForSelector: aSelector
		andInfo: currentPov infoName.
	currentPov povResult: updatedPovSpec povResult.
	currentPov povResult cormasHelper isTypeColorValue
		ifTrue:
			[currentPov color: currentPov povResult.
			aFig fillColor: currentPov color]
		ifFalse:
			["In this case, it means the shape of entity has to be updated"
			"in the cas of a spatialEntity this is simple because the shape remains the same. Only the color changes. (a spatialEntitySet which composition changed is handled by the method redisplayCompoundSpatialEntity:"
			anEntityReference entityClass isSpatialClass
				ifTrue:
					[currentPov
						color:
							(anEntityReference entityClass getColorAtPov: currentPov povResult).
					aFig fillColor: currentPov color]
				ifFalse:
					["it is then an Occupant or an Arc that has a different shape"
					newPov := anEntityReference entityClass createEntityPOVwithSpec:
							updatedPovSpec.
					newPov entityReference: anEntityReference.
					anEntityReference entityClass isArcClass
						ifTrue:
							["It is then an arc"
							startPatch := anEntityReference entity startNode patch.
							stopPatch := anEntityReference entity stopNode patch.
							self remove: aFig.
							self
								addFigureForArcPov: newPov
								start: (EntityReference on: startPatch)
								end: (EntityReference on: stopPatch)]
						ifFalse:
							["It is then an Occupant"
							currentPatch := anEntityReference entity patch.
							Dev todo:
									'Ici on fait un appel au serveur via le message entity. A voir comment optimiser pour qu''il n''yest pas d''apel au serveur'.
							self remove: aFig.
							self
								addFigureForOccupantPov: newPov
								on: (EntityReference on: currentPatch)]]].
	currentPov infoResult ~= updatedPovSpec infoResult
		ifTrue:
			[currentPov infoResult: updatedPovSpec infoResult.
			aFig setText: updatedPovSpec infoResult]