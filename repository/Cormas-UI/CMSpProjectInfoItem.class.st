Class {
	#name : #CMSpProjectInfoItem,
	#superclass : #CMSpProjectItem,
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #accessing }
CMSpProjectInfoItem class >> icon [ 

	^ self iconNamed: #smallInfo
]

{ #category : #accessing }
CMSpProjectInfoItem class >> label [

	^ 'Information'
]
