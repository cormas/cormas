actions
addNewSocialEntityGUI
	
	| newName superClass |
	(newName := self getNewClassNameFromGUI) isNil
		ifTrue: [ ^ self alertMessage: self translator tMissingClassName ].
	superClass := self getAgentSuperclassFromGUI.
	self projectManager 
		addNewClassType: 'Social' 
		inheritingFrom: superClass 
		name: newName 
		initProtocol: false 
		stepProtocol: false.
	self closeRequest