actions
addNewPassivelEntityGUI
	
	| superClass newName |
	newName := self getNewClassNameFromGUI.
	newName isNil
		ifTrue: [^self cormas warn: 'Please enter a name for the new class!'].
	self passiveEntitySuperclass value isNil
		ifTrue: [^self cormas warn: 'Please tick a super class!'].
	superClass := self passiveEntitySuperclass value class.
	self cormas addNewClassType: 'Passive' inheritingFrom: superClass name:
			newName initProtocol: false stepProtocol: false.
	self closeRequest