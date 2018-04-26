initialization
initializeAuthorEmail

	self authorEmail
		ghostText: 'e-mail';
		entryCompletion: nil;
		autoAccept: true;
		acceptBlock: validateBlock;
		whenTextChanged: [ : t | 
			t isEmpty 
				ifTrue: [ self beInvalid ]
				ifFalse: [ self beValid ] ].