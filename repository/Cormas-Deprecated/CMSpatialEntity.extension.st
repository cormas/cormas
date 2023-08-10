Extension { #name : #CMSpatialEntity }

{ #category : #'*Cormas-Deprecated' }
CMSpatialEntity >> hasOccupantType: aClass [
	"This method was renamed to hasOccupantsOfClass:
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #hasOccupantsOfClass: instead'.
	^ self hasOccupantsOfClass: aClass
]

{ #category : #'*Cormas-Deprecated' }
CMSpatialEntity >> noOccupant [

	"This method was renamed to hasNoOccupants
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #hasNoOccupants instead'.
	^ self hasNoOccupants
]

{ #category : #'*Cormas-Deprecated' }
CMSpatialEntity >> noOccupantBut: anObject [
	"This method was renamed to hasNoOccupantsExcept:
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #hasOccupantsExcept: instead'.
	^ self hasNoOccupantsExcept: anObject
]

{ #category : #'*Cormas-Deprecated' }
CMSpatialEntity >> noOccupantType: aClass [
	"This method is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #hasOccupantsOfClass: and #not instead'.
	^ (self hasOccupantsOfClass: aClass) not
]

{ #category : #'*Cormas-Deprecated' }
CMSpatialEntity >> occupants: aClassOrClassName [
	"This method was renamed to occupantsOfClassNamed:
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #occupantsOfClassNamed: instead'.
	^ self occupantsOfClassNamed: aClassOrClassName
]

{ #category : #'*Cormas-Deprecated' }
CMSpatialEntity >> occupantsAt: aClassOrClassName [
	"This method is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #occupantsOfClass: or occupantsOfClassNamed: instead'.
	
	^ aClassOrClassName isClass
		ifTrue: [ self occupantsOfClass: aClassOrClassName ]
		ifFalse: [ self occupantsOfClassNamed: aClassOrClassName ]
]

{ #category : #'*Cormas-Deprecated' }
CMSpatialEntity >> occupantsType: aClass [
	"This method was renamed to occupantsOfClass:
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #occupantsOfClass: instead'.
	^ self occupantsOfClass: aClass
]
