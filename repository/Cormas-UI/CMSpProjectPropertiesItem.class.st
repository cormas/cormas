Class {
	#name : #CMSpProjectPropertiesItem,
	#superclass : #CMSpProjectItem,
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #accessing }
CMSpProjectPropertiesItem class >> icon [ 

	^ self iconNamed: #smallConfiguration
]

{ #category : #accessing }
CMSpProjectPropertiesItem class >> label [

	^ 'Properties'
]
