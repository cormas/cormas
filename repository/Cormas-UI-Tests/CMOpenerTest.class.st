Class {
	#name : #CMOpenerTest,
	#superclass : #CMAbstractModelTest,
	#instVars : [
		'opener',
		'projectManager'
	],
	#category : #'Cormas-UI-Tests-Project'
}

{ #category : #accessing }
CMOpenerTest >> newOpener [
	
	self subclassResponsibility 

]

{ #category : #accessing }
CMOpenerTest >> opener [
	^ opener
]

{ #category : #accessing }
CMOpenerTest >> opener: anObject [
	opener := anObject
]

{ #category : #accessing }
CMOpenerTest >> projectManager [
	^ projectManager
]

{ #category : #accessing }
CMOpenerTest >> projectManager: anObject [
	projectManager := anObject
]

{ #category : #accessing }
CMOpenerTest >> setUp [ 

	opener := self newOpener.
	CMApplicationProject release.
	PFProjectSettings currentApplicationClass: CMApplicationProject.
	model := self newTestModel.

]
