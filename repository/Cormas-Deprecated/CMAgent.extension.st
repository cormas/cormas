Extension { #name : #CMAgent }

{ #category : #'*Cormas-Deprecated' }
CMAgent >> dead [
	"Renamed to isDead.
	This method is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #isDead instead'.
	^ self isDead
]

{ #category : #'*Cormas-Deprecated' }
CMAgent >> dead: aBoolean [ 
	"This method is now deprecated and will be removed in the future releases
	Use #die message to kill the agent"
	
	self deprecated: 'Use #die instead'.
	aBoolean ifTrue: [ self die ]
]

{ #category : #'*Cormas-Deprecated' }
CMAgent >> destroyed [
	" Answer if the agent is dead "
	
	self deprecated: 'Use #isDead instead'.
	^ self isDead
]

{ #category : #'*Cormas-Deprecated' }
CMAgent >> isDestroyed [
	"This method is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #isDead instead'.
	^ self isDead
]
