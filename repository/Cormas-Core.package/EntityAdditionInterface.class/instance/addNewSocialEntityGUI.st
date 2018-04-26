actions
addNewSocialEntityGUI
	
	| newName superClass |
	newName := self getNewClassNameFromGUI.
	newName isNil
		ifTrue: [^self cormas warn: 'Please enter a name for the new class!'].
	superClass := self getAgentSuperclassFromGUI.
	self cormas addNewClassType: 'Social' inheritingFrom: superClass name:
			newName initProtocol: false stepProtocol: false.
	self closeRequest