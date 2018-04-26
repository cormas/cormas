runtime mode accessing
runtimeMode
	"return the actual runtime mode for this image (usefull for adapting menus).
	3 values are supported : #developer, #modeler, #modelUser.
	the default value is #developer and is changed by the CormasPackager.
	"

	^ runtimeMode ifNil: [ runtimeMode := #developer ]