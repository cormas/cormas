initialize-release
openOn: aModel
	
	| win |
	cormasModel := aModel.
	self prepareClasses.
	win := (self allButOpenInterface: #windowSpec) window.
	win open	"win openIn: (10 @ 20 extent: win maximumSize)"