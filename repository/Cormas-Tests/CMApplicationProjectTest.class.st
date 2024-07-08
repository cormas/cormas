"
A CMApplicationProjectTest is a test class for testing the behavior of CMApplicationProject
"
Class {
	#name : #CMApplicationProjectTest,
	#superclass : #CMAbstractModelTest,
	#instVars : [
		'application'
	],
	#category : #'Cormas-Tests-Project'
}

{ #category : #accessing }
CMApplicationProjectTest >> application [
	^ application
]

{ #category : #accessing }
CMApplicationProjectTest >> application: anObject [
	application := anObject
]

{ #category : #running }
CMApplicationProjectTest >> setUp [
	" Hooks that subclasses may override to define the fixture of test. "

	super setUp.
	application := CMApplication new.
]

{ #category : #test }
CMApplicationProjectTest >> testCormasModel [

	self assert: self application currentProject isNil.
	self application currentProject: (CMProjectModel for: self newTestModel).
	self assert: (self application cormasModel isKindOf: CMMockModel).
	
]

{ #category : #test }
CMApplicationProjectTest >> testDefaultProjectClass [

	self assert: self application defaultProjectClass equals: CMProjectModel.

]

{ #category : #test }
CMApplicationProjectTest >> testGitBridge [

	self assert: (self application gitBridge isKindOf: CMGitBridge)
]
