Class {
	#name : #CMSpProjectUIsItem,
	#superclass : #CMSpProjectItem,
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #accessing }
CMSpProjectUIsItem class >> icon [ 

	^ self iconNamed: #window
]

{ #category : #accessing }
CMSpProjectUIsItem class >> label [

	^ 'UIs'
]

{ #category : #accessing }
CMSpProjectUIsItem class >> priority [
	^ 24
]
