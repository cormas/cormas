actions
onlyInspector
	
	| item |
	item := (self builder menuAt: #optionMenu) atNameKey: #onlyInspector.
	item isOn
		ifTrue: [item beOff]
		ifFalse: [item beOn].
	item isOn
		ifTrue:
			[self linkedSI openedEntityInspectors_IsTheOnlyOne key
				do: [:ei | ei ~= self ifTrue: [ei closeRequest]]]