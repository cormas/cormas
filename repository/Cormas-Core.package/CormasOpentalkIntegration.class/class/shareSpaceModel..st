api
shareSpaceModel: aSpaceModel
	"
	CormasNS.Kernel.Cormas allInstances first shareCurrentSpaceModel
	"
	
	Transcript
		cr;
		show: 'sharing spaceModel'.
	self server namingService rebind: 'Cormas.SpaceModel' to: aSpaceModel