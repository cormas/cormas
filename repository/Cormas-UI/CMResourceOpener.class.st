Class {
	#name : #CMResourceOpener,
	#superclass : #CMObject,
	#instVars : [
		'openStatus',
		'projectManager'
	],
	#category : #'Cormas-UI-Project'
}

{ #category : #private }
CMResourceOpener class >> cormasDemoImage [
	" Answer a basic <Morph> to display when a project does not have a GIF demo image "

	^ Morph new
		color: Color black;
		useGradientFill;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		yourself
]

{ #category : #'instance creation' }
CMResourceOpener class >> newFrom: aCMProjectManager [
	" Answer a new instance of the receiver configured with aCMProjectManager "
	
	^ self new
		projectManager: aCMProjectManager;
		yourself.
]

{ #category : #callbacks }
CMResourceOpener >> currentProject: aCMProjectModel [
	" Refer to comment in CMProjectManager currentProject: "

	^ self projectManager currentProject: aCMProjectModel
]

{ #category : #callbacks }
CMResourceOpener >> handleFileInException: ex [
	" Private - There was an exception while loading a file. Handle it accordingly to preferences "

	self appSettingsClass settingWarnUsing signal: ex messageText
]

{ #category : #accessing }
CMResourceOpener >> openStatus [
	^ openStatus
]

{ #category : #accessing }
CMResourceOpener >> openStatus: anObject [
	^ openStatus := anObject
]

{ #category : #accessing }
CMResourceOpener >> projectManager [

	^ projectManager

]

{ #category : #accessing }
CMResourceOpener >> projectManager: anObject [
	projectManager := anObject
]

{ #category : #callbacks }
CMResourceOpener >> resourceLocator [
	" Answer a <CMResourceLocator>, an object to locate receiver resources "

	^ self projectManager resourceLocator
]

{ #category : #callbacks }
CMResourceOpener >> tryOpenFromFile: fileRef [

	[ fileRef readStream fileInDisplayingProgress ]
	on: Exception
	do: [ : ex | 
		self handleFileInException: ex.
		openStatus := false ].
]
