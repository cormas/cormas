operation
saveAndRelease
	"save and release all the connexions"
	
	self excelDictionary
		keysAndValuesDo:
			[:aName :aFile | 
			filename := directory construct: aName asString.
			aFile saveFile.
			aFile justRelease].
	excelDictionary := nil.
	COMSessionManager shutdownImage	"terminateServer allOwnedInterfaces"