video
snapGridTimeForMovie: t makingMovie: aBoolean
	"ask spaceInterfaces for making video"
	
	self
		changed: #snapGridTimeForMovie
		with: (Array with: t with: aBoolean)