actions
saveThenQuitImage
	"save the image"
	
	self closeRequest.
	self mainWindow ifNotNil: [:win | win checkForEvents].
	[(Delay forSeconds: 1) wait.
	ObjectMemory
		saveAs: self targetImagePath asString
		thenQuit: true] fork