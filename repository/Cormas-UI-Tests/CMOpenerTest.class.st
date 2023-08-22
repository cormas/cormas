Class {
	#name : #CMOpenerTest,
	#superclass : #CMTestObject,
	#instVars : [
		'opener',
		'projectManager'
	],
	#category : #'Cormas-UI-Tests-Project'
}

{ #category : #accessing }
CMOpenerTest >> newOpener [

	^ self openerClass newFrom: self newProjectManager.
]

{ #category : #accessing }
CMOpenerTest >> newProjectManager [

	^ CMProjectManager new 
		startFSM;
		yourself.
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
CMOpenerTest >> openerClass [

	self subclassResponsibility 
]

{ #category : #running }
CMOpenerTest >> setUp [ 

	CMApplication release.
	PFProjectSettings currentApplicationClass: CMApplication.
	model := self newTestModel.
	opener := self newOpener.
]
