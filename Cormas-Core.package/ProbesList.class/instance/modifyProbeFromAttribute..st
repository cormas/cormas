action
modifyProbeFromAttribute: attributeName
	
	| aClass selector |
	self listEntities selection notNil
		ifTrue:
			[aClass := self listEntities selection = 'Global'
				ifTrue: [self cormasModel]
				ifFalse:
					[self cormasModel environment at: self listEntities selection asSymbol].
			selector := Dialog
				request: self probeNameFromAttribute
				initialAnswer: attributeName asString , 'X'
				onCancel: [^self].
			aClass
				compile:
					(selector ,
							'\"modify this instruction to calculate the number to be recorded"\^self '
						, attributeName asString , ' messageX') withCRs
				classified: 'probes'
				notifying: nil.
			self
				editMethod: selector asSymbol
				fromClass: aClass.
			self listEntitiesChanged]