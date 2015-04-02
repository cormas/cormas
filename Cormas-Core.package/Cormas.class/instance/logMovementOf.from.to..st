simulation
logMovementOf: anAgentLocation from: srcSpatialEntity to: dstSpatialEntity
	"Log the movement of an agent from a spatial entity to another entity"
	
	useExternalVisualization
		ifTrue:
			[xmlModel sendMoveToExternalVisualizerOf: anAgentLocation from:
					srcSpatialEntity to: dstSpatialEntity].
	exportPlaybackLog
		ifTrue:
			[xmlModel writeMoveToPlaybackLogOf: anAgentLocation from: srcSpatialEntity
				to: dstSpatialEntity]