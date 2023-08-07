Extension { #name : #CMSpatialEntity }

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
