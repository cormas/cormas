testing
hasGraphicInterfaces
	"check if some interfaces are opened. This hack was added while removing spaceInterfaces from cormas"
	
	^self dependents contains: [:each | each isKindOf: SpaceInterface]