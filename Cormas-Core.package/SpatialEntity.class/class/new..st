- instance creation
new: aSpaceModel
	
	| anEntity |
	"x := aSpaceModel newEntity: self. Ne marche pas : dead lock"
	anEntity := super new.
	aSpaceModel notNil
		ifTrue:
			[anEntity spaceModel: aSpaceModel.
			anEntity collector: aSpaceModel cormasModel collector.
			aSpaceModel cormasModel collect: anEntity.
			anEntity initOcc].
	^anEntity