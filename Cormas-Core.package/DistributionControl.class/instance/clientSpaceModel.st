private accessing
clientSpaceModel
	"return a ClientSpaceModel on the remote spaceModel.
	you should not acccess direcly this method. Use spaceModel"
	
	^clientSpaceModel
		ifNil: [clientSpaceModel := ClientSpaceModel new on: self]