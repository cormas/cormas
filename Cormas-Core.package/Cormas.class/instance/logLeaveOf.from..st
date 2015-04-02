simulation
logLeaveOf: anAgentLocation from: srcSpatialEntity
	"Log the disparition of an agent from a spatial entity"
	
	self useExternalVisualization
		ifTrue:
			[xmlModel sendLeaveToExternalVisualizerOf: anAgentLocation from:
					srcSpatialEntity].
	self exportPlaybackLog
		ifTrue:
			[xmlModel writeLeaveToPlaybackLogOf: anAgentLocation from: srcSpatialEntity]