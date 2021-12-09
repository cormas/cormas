Class {
	#name : #CMSpProjectTestsItem,
	#superclass : #CMSpProjectItem,
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #accessing }
CMSpProjectTestsItem class >> icon [ 

	^ self iconNamed: #testRunner
]

{ #category : #accessing }
CMSpProjectTestsItem class >> label [ 

	^ 'Tests'
]

{ #category : #accessing }
CMSpProjectTestsItem class >> priority [
	^ 22
]
