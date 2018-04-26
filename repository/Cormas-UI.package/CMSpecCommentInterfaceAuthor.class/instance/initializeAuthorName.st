initialization
initializeAuthorName

	self authorName
		ghostText: 'Name';
		entryCompletion: nil;
		autoAccept: true;
		acceptBlock: validateBlock;
		whenTextChanged: [ : t | 
			t isEmpty 
				ifTrue: [ self beInvalid ]
				ifFalse: [ self beValid ] ].