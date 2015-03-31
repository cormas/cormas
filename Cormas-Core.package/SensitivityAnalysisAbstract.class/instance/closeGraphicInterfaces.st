actions
closeGraphicInterfaces
	"((self cormas spaceInterfaces isNil or: [self cormas spaceInterfaces isEmpty])
		and: [self cormas displayChartsWin isNil or:[self cormas displayChartsWin isEmpty]]) ifTrue: [^nil]."
	
	self cormas hasGraphicInterfaces ifFalse: [^self].
	(self cormas confirm:
			'In order to speed up the analysis, Graphic Interfaces should be closed.
	Do you want Cormas to close these windows?')
		ifTrue: [self cormas closeGraphicWindows]