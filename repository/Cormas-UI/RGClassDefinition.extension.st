Extension { #name : #RGClassDefinition }

{ #category : #'*Cormas-UI' }
RGClassDefinition >> isAbstract [
	
	^ self subclasses isEmpty
]
