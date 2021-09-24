Extension { #name : #RSEvent }

{ #category : #'*Cormas-UI-Roassal3' }
RSEvent >> cormasEntity [
	" Answer a <CMEntity> from the receiver's shape model "
	
	^ self shape model
]
