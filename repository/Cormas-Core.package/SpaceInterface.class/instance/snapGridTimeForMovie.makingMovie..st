grid recorder
snapGridTimeForMovie: t makingMovie: aBoolean
	"Called by changed sent from Cormas (added while removing spaceInterfaces from Cormas)"
	
	self snapGridTimeForMovie: t.
	aBoolean ifTrue: [self makeMovie]