interface opening
inactivateTargetFilePath
	
	(self wrapperAt: #inputTargetPath)
		ifNotNil: [:w | w widget controller: NoController new]