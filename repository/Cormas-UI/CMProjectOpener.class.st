"
Provides utilities to browse and open a CORMAS project file (.zip)


"
Class {
	#name : #CMProjectOpener,
	#superclass : #CMResourceOpener,
	#instVars : [
		'openerWindow'
	],
	#category : #'Cormas-UI-Project'
}

{ #category : #callbacks }
CMProjectOpener >> openProject [
	" Request a model to the user and open it for the receiver "

	CMOpenProjectWindow openFor: self projectManager.


]

{ #category : #accessing }
CMProjectOpener >> openerWindow [
	^ openerWindow
]

{ #category : #accessing }
CMProjectOpener >> openerWindow: anObject [
	openerWindow := anObject
]
