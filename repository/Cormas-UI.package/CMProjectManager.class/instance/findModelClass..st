private
findModelClass: aFilename
	" Answer a <String> with the model class name found in aFilename"
 
	| ckDecl |
	self flag: #toReview.
	ckDecl := ((ChunkFileFormatParser for: aFilename asFileReference readStream) parseChunks
		select: [ : c | c isDoItDeclaration and: [ c contents beginsWith: 'CormasModel subclass:' ] ]) anyOne.
	^ ckDecl contents substrings third
		