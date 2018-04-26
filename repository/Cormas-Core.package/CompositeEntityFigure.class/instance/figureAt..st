accessing
figureAt: point
	"redefined in order to access the subfigures in case the Composite figure shows only its outlines"
	
	self isOpaque ifFalse: [^nil].
	^super figureAt: point