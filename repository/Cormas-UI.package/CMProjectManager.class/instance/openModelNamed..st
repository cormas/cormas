callbacks
openModelNamed: aString
	" Request a file to be opened as CORMAS project "

	(FDOpenFileDialog new
		title: ('Choose st file');
		extensionFilters: 	{ 'st files' -> #(st) };
		defaultFolder:  FileLocator imageDirectory / 'Models'/ aString ;
		openModal)	
			
		ifNotNil: [ : fileRef | 
			[ fileRef readStream fileInDisplayingProgress ]
			on: Exception
			do: [ : ex | 
				self alertMessage: ex messageText. 
				openStatus := false ].
			openStatus := true.
			^ fileRef fullName ]
		ifNil: [ openStatus := false ]