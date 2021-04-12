Class {
	#name : #CMObject,
	#superclass : #Object,
	#instVars : [
		'translator'
	],
	#category : #'Cormas-UI-Project'
}

{ #category : #accessing }
CMObject >> appSettings [ 

	^ CMApplicationPreferences
]

{ #category : #accessing }
CMObject >> projectManager [ 

	^ CMProjectManager allInstances anyOne
]

{ #category : #accessing }
CMObject >> translator [
	" Answer the receiver's <PFTranslator> "

	^ self projectManager translator.
]
