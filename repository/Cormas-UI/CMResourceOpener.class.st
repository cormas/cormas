Class {
	#name : #CMResourceOpener,
	#superclass : #CMObject,
	#instVars : [
		'openStatus'
	],
	#category : #'Cormas-UI-Project'
}

{ #category : #callbacks }
CMResourceOpener >> currentProject: aCMProjectModel [
	" Refer to comment in CMProjectManager currentProject: "

	^ self projectManager currentProject: aCMProjectModel
]

{ #category : #callbacks }
CMResourceOpener >> handleFileInException: ex [
	" Private - There was an exception while loading a file. Handle it accordingly to preferences "

	self appSettings settingWarnUsing signal: ex messageText
]

{ #category : #callbacks }
CMResourceOpener >> resourceLocator [
	" Refer to comment in CMProjectManager resourceLocator "

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
