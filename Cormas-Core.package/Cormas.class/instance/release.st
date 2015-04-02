initialize-release
release
	
	super release.	"Clean up the xmlModel"
	xmlModel isNil
		ifFalse:
			[xmlModel release.
			xmlModel := nil]