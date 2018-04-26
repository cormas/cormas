updating
update: aSymbol with: aValue from: aSender
	
	self builder window isOpen ifFalse: [^nil].
	aSender == self linkedSI
		ifTrue:
			[aSymbol == #timeChanged ifTrue: [^self prepareTable].
			aSymbol == #windowClosed ifTrue: [^self closeRequest].
			aSymbol = #openedEntityInspectors_IsTheOnlyOne
				ifTrue:
					[aValue key add: self.
					self isOnlyInspector ifTrue: [aValue value: true]].
			^aValue].
	^super update: aSymbol with: aValue from: aSender