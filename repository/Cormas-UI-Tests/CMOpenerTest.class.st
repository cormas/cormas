Class {
	#name : #CMOpenerTest,
	#superclass : #CMBasicModelTest,
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
CMOpenerTest >> newTestModel [
	^ (CMTestModel
		initialize;
		new)
		activeInit: #initAlive;
		initSimulation;
		initializeSpaceModel;
		createGridLines: 20
			columns: 10
			neighbourhood: 4
			closed: true;
		yourself
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
