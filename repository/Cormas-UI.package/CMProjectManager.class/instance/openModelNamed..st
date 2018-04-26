callbacks
openModelNamed: aString
	" Request a file to be opened as CORMAS project "

	(self requestFileNameForOpen: 'st')
		ifNotNil: [ : fileRef | 
			[ fileRef readStream fileInDisplayingProgress ]
			on: Exception
			do: [ : ex | 
				self alertMessage: ex messageText. 
				openStatus := false ].
			openStatus := true.
			^ fileRef fullName ]
		ifNil: [ openStatus := false ]