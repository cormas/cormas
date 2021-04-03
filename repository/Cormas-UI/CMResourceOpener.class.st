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
CMResourceOpener >> resourceLocator [
	" Refer to comment in CMProjectManager resourceLocator "

	^ self projectManager resourceLocator
]
