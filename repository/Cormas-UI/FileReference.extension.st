Extension { #name : #FileReference }

{ #category : #'*Cormas-UI' }
FileReference >> asCormasProjectModelForPreview [
	" Answer a <CMProjectModel> for the receiver representing a CORMAS project file "

	^ (CMProjectOpener new validateProjectFile: self) 
		asCormasProjectModelForPreview
		fileReference: self;
		yourself
]

{ #category : #'*Cormas-UI' }
FileReference >> asCormasProjectName [
	" Answer a <String> with the receiver's name "

	^ self basenameWithoutExtension
]

{ #category : #'*Cormas-UI' }
FileReference >> cormasDemoImage [
	" Answer a <Morph> demo image for the CORMAS project represented by the receiver "

	^ CMProjectOpener demoImageFromProjectFile: self
]

{ #category : #'*Cormas-UI' }
FileReference >> definedCormasVersions [
	" For now we return a <Collection> of <CMProjectModel> but we should support versions "

	^ Array with: self asCormasProjectModelForPreview
]
