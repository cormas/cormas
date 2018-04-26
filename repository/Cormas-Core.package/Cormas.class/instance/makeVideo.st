video
makeVideo
	"ask spaceInterfaces for making video"
	
	self spaceModel
		snapGridTimeForMovie: self stepCounter value
		makingMovie: self cormasModel currentSimulationEnded	"self spaceInterfaces do: 
			[:spaceInterface | 
			spaceInterface snapGridTimeForMovie: self stepCounter value.
			self currentSimulation currentSimulationEnded ifTrue: [spaceInterface makeMovie]]"