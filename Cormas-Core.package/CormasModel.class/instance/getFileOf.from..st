- binary storage
getFileOf: aClassName from: fileNameString
	
	^(fileNameString tokensBasedOn: $.) first , '.' , aClassName asString