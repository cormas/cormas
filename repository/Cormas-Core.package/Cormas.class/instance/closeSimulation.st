main menu
closeSimulation
	
	self simNum value: ''.
	self simName value: ''.
	self cormasModel
		ifNotNil:
			[:sim | 
			process isNil
				ifFalse:
					[process terminate.
					process := nil].
			xmlModel
				ifNotNil:
					[xmlModel release.
					xmlModel := nil].
			sim spaceModel
				ifNotNil:
					[:sm | 
					sm
						cormasModel: nil;
						release.
					sim spaceModel: nil].
			sim closeRequest.
			self cormasModel: nil].
	self closeMyWindows