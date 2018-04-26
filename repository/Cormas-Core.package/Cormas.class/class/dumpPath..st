+ utilities - files
dumpPath: aModelClassName
	" Answer a <FileReference> corresponding to the path of the current model 'dump' directory.
	aModelClassName = <String>"

	^ self application dumpPath: aModelClassName
