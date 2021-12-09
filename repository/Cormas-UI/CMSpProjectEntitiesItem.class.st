Class {
	#name : #CMSpProjectEntitiesItem,
	#superclass : #CMSpProjectItem,
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #accessing }
CMSpProjectEntitiesItem class >> label [

	^ 'Entities'
]

{ #category : #accessing }
CMSpProjectEntitiesItem class >> priority [
	^ 12
]

{ #category : #initialization }
CMSpProjectEntitiesItem >> pageClass [

	^ CMSpEntitiesPage
]
