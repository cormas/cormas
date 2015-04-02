+ procedures
isMovedTo: startCell
	"the startNode of the Arc is moved to aSpatialEntityElement.
	aSpatialEntityElement = <SpatialEntityElement>"
	"the entity is moved to aSpatialEntityElement.
	aSpatialEntityElement = <SpatialEntityElement>"
	
	| alreadySituated_start |
	alreadySituated_start := self isSituated.	"Log the movement"
	startCell spaceModel logMovementOf: self from: patch to: startCell.
	self moveStartNodeTo: startCell.
	(startCell occupants: self class name) add: self.
	stopNode patch ifNil: [^nil].
	alreadySituated_start
		ifTrue:
			["self halt."
			Dev todo:
					'a priori ca ne marche pas car la notification renvoi √† un moveOccupant qui n''a pas √©t√© pr√©vu pour des Arcs. D''un autre cot√© je ne vois pas pouquoi on devrait avoir des "moving arcs" puisqu''ils ne bougent pas d''eux memes, mais que lorsqu''un de leur node bouge'.
			self currentSimulation
				registerEntityChange: #movingArc
				with:
					(EntityReference on: startCell) -> (EntityReference on: stopNode patch)
				from: (EntityReference on: self)]
		ifFalse:
			[self currentSimulation
				registerEntityChange: #newArc
				with:
					(EntityReference on: startCell) -> (EntityReference on: stopNode patch)
				from: (EntityReference on: self)]