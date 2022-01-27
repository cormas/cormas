Extension { #name : #Morph }

{ #category : #'*Cormas-UI' }
Morph >> forCormasProjectDemo [

	^ self
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			yourself
]

{ #category : #'*Cormas-UI' }
Morph >> isCormasSubApplicationWindow [
	" Answer <true> if the receiver's is a window opened through the CORMAS main interface "

	^ self isSystemWindow and: [ (self label asUppercase beginsWith: 'CORMAS') and: [ self model isCloseableByCormas ] ]
]
