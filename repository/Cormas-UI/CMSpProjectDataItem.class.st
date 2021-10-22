Class {
	#name : #CMSpProjectDataItem,
	#superclass : #CMSpProjectResourcesItem,
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #accessing }
CMSpProjectDataItem class >> icon [ 

	^ self iconNamed: #database
]

{ #category : #accessing }
CMSpProjectDataItem class >> label [

	^ 'Data'
]
