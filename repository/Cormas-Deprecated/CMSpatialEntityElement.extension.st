Extension { #name : #CMSpatialEntityElement }

{ #category : #'*Cormas-Deprecated' }
CMSpatialEntityElement >> numCol [
	"This method was renamed to columnNumber
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #columnNumber instead'.
	^ self columnNumber
]

{ #category : #'*Cormas-Deprecated' }
CMSpatialEntityElement >> numLine [
	"This method was renamed to rowNumber
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #rowNumber instead'.
	^ self rowNumber
]

{ #category : #'*Cormas-Deprecated' }
CMSpatialEntityElement >> orderedNeighbourhood [
	"Use neighbourhood instead of this method. They are the same thing
	orderedNeighbourhood is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #neighbourhood instead'.
	^ self neighbourhood
]

{ #category : #'*Cormas-Deprecated' }
CMSpatialEntityElement >> orderedNeighbourhood: aCollection [
	"Use neighbourhood: instead of this method. They are the same thing
	orderedNeighbourhood: is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #neighbourhood: instead'.
	^ self neighbourhood: aCollection
]
