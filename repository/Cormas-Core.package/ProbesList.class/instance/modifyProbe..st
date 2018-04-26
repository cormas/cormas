action
modifyProbe: probeName
	
	| aClass comment |
	self listEntities selection notNil
		ifTrue:
			[aClass := self listEntities selection = 'Global'
				ifTrue: [self cormasModel]
				ifFalse:
					[self cormasModel environment at: self listEntities selection asSymbol].
			comment := '"return the data (a number) to be recorded"'.
			aClass
				compile: (probeName asString , '\' , comment , '\^x') withCRs
				classified: 'probes'
				notifying: nil.
			self editMethod: probeName fromClass: aClass]