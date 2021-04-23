"
A CMSpaceInterfaceTest is a test class for testing the behavior of CMSpaceInterface
"
Class {
	#name : #CMSpaceInterfaceTest,
	#superclass : #TestCase,
	#instVars : [
		'spaceInterface'
	],
	#category : #'Cormas-UI-Tests-Core'
}

{ #category : #running }
CMSpaceInterfaceTest >> newProjectManager [

	^ CMProjectManager new 
		startFSM;
		yourself.
]

{ #category : #running }
CMSpaceInterfaceTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	self spaceInterface: (CMSpaceInterface for: self newProjectManager).
]

{ #category : #accessing }
CMSpaceInterfaceTest >> spaceInterface [
	^ spaceInterface
]

{ #category : #accessing }
CMSpaceInterfaceTest >> spaceInterface: anObject [
	spaceInterface := anObject
]

{ #category : #test }
CMSpaceInterfaceTest >> testCormasModel [

	self assert: (self spaceInterface cormasModel isKindOf: CMAbstractModel)
]
