Extension { #name : #Workspace }

{ #category : #'*Cormas-UI' }
Workspace >> isCloseableByCormas [
	
	^ (window title asUppercase beginsWith: 'CORMAS') not
]
