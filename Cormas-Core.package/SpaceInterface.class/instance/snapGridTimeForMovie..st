grid recorder
snapGridTimeForMovie: t
	"Creates a image file (.JPG) of the grid at time t, into the movieFilename directory.
t = time <Integer>; movieFilename = <Filename>"
	
	| directory aName |
	video ifNil: [^self].
	directory := video directory.
	aName := (video tail tokensBasedOn: $.) first.
	self snapGridTime: t intoDirectory: directory basicName: aName