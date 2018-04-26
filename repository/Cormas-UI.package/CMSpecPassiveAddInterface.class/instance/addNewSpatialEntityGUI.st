callbacks
addNewSpatialEntityGUI
	
	| superClass newName aClass |

	aClass := self spatialEntitySuperclass value = #CMSpatialEntityCell
		ifTrue: [self cellOrCA value]
		ifFalse: [self spatialEntitySuperclass value].
	superClass := aClass class.
	self cormas addNewClassType: 'Spatial' inheritingFrom: superClass name:
			newName initProtocol: false stepProtocol: false.
	self closeRequest