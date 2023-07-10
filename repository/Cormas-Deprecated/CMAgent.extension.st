Extension { #name : #CMAgent }

{ #category : #'*Cormas-Deprecated' }
CMAgent >> dead [
	"This method was renamed to isDead. It is now deprecated and should not be used"
	
	self deprecated: 'Use #isDead instead'.
	^ self isDead
]

{ #category : #'*Cormas-Deprecated' }
CMAgent >> dead: aBoolean [ 
	"This method was renamed to isDead:. It is now deprecated and should not be used"
	
	self deprecated: 'Use #isDead: instead'.
	^ self isDead: aBoolean
]
