Class {
	#name : #CMSpProjectModelItem,
	#superclass : #CMSpProjectItem,
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #accessing }
CMSpProjectModelItem class >> icon [ 

	^ self iconNamed: #hierarchy
]

{ #category : #accessing }
CMSpProjectModelItem class >> label [

	^ 'Model'
]
