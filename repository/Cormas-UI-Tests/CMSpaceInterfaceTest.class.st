"
A CMSpaceInterfaceTest is a test class for testing the behavior of CMSpaceInterface
"
Class {
	#name : #CMSpaceInterfaceTest,
	#superclass : #CMAbstractModelTest,
	#instVars : [
		'spaceInterface'
	],
	#category : #'Cormas-UI-Tests-Core'
}

{ #category : #running }
CMSpaceInterfaceTest >> newProjectManager [

	^ CMProjectManager new 
		currentProject: (CMProjectModel basicNew
				initializeForModel: self newTestModel named: self sampleModelNameWithoutPrefix;
				yourself);
		startFSM;
		yourself.
]

{ #category : #running }
CMSpaceInterfaceTest >> newTestModel [
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

{ #category : #running }
CMSpaceInterfaceTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	CMApplicationProject release.
	PFProjectSettings currentApplicationClass: CMApplicationProject.
	self spaceInterface: (CMSpaceInterface basicNew projectManager: self newProjectManager).
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
