initialize-release
addCheckName: aSymbol description: aString action: aBlock
	"utility method for check construction"
	
	self
		addCheck:
			(PackagingCheck name: aSymbol description: aString action: aBlock)