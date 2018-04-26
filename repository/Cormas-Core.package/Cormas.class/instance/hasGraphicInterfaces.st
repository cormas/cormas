testing
hasGraphicInterfaces
	"true if cormas has some SpaceInterfaces or displayChartsWin openened.
	added while removing spaceInterfaces from Cormas"
	
	^self spaceModel
		ifNotNil:
			[:sm | sm hasGraphicInterfaces or: [self displayChartsWin notEmpty]]
		ifNil: [false]