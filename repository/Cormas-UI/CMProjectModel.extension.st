Extension { #name : #CMProjectModel }

{ #category : #'*Cormas-UI' }
CMProjectModel >> cormasDemoImage [
	" Answer a <Morph> demo image for the CORMAS project represented by the receiver "
	" So far demo images for in-image models are not supported "

	^ CMModelOpener cormasDemoImage 
]

{ #category : #'*Cormas-UI' }
CMProjectModel >> isModified [
	" See superimplementor's comment "
	
	| opener |
	
	self projectManager currentProjectFileReference ifNil: [ ^ true ].
	opener := CMProjectOpener newFrom: self projectManager.
	opener tryReadSourceFromProject openStatus
		ifFalse: [ self error: 'Error while reading project from file' ].
	self tracker track: opener readStream.
	^ (self tracker equalToCurrent: self cormasModelClasses) not
]
