action
modifyInfo: infoName
	
	selectedClass
		compile:
			(infoName asString ,
					'\"return a String "\ ^self id printString\" ^ self class name asString "')
				withCRs
		classified: 'info'
		notifying: nil.
	self editMethod: infoName fromClass: selectedClass	"selectedClass infoDict at: infoName put: OrderedCollection new"