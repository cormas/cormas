actions
addNewSpatialEntityGUI
	
	| superClass newName aClass |
	newName := self getNewClassNameFromGUI.
	newName isNil
		ifTrue: [^self cormas warn: 'Please enter a name for the new class!'].
	self spatialEntitySuperclass value isNil
		ifTrue: [^self cormas warn: 'Please tick a super class!'].
	aClass := self spatialEntitySuperclass value = #SpatialEntityCell
		ifTrue: [self cellOrCA value]
		ifFalse: [self spatialEntitySuperclass value].
	superClass := CormasModel classFromSymbol: aClass.
	self cormas addNewClassType: 'Spatial' inheritingFrom: superClass name:
			newName initProtocol: false stepProtocol: false.
	self closeRequest