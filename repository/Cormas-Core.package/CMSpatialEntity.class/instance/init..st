- initialize-release
init: aSpaceModel
	"self spaceModel: aSpaceModel.
	self privateInit.
	self spaceModel cormasModel class locatedClasses isEmpty ifFalse: [self initOcc: self spaceModel cormasModel class locatedClasses]"
	
	