star moving
randomJump
"Purpose: moves to a spatial entity randomly picked from the whole grid "

	"patch ifNil: [^nil]."
	self moveTo: (Cormas selectRandomlyFrom: patch grid)