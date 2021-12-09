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

{ #category : #accessing }
CMSpProjectPropertiesItem class >> priority [
	^ 16
]

{ #category : #initialization }
CMSpProjectPropertiesItem >> pageClass [

	^ CMSpMetaProjectPresenter
]
