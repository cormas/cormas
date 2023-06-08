Class {
	#name : #CormasUITest,
	#superclass : #TestCase,
	#instVars : [
		'projectWindow'
	],
	#category : #'Cormas-UI-Tests-Core'
}

{ #category : #tests }
CormasUITest >> newProjectManagerWithInitializedUIOnModel: modelName [

	| project |

	project := self projectWindow projectManager.
	self simulationWindow
		translator: (CMTranslator newForLanguage: #EN);
		initialize.
	project openModel: modelName.
	project cormasModel initSimulation.
	^ project
]

{ #category : #accessing }
CormasUITest >> projectWindow [

	^ projectWindow
]

{ #category : #accessing }
CormasUITest >> projectWindow: anObject [
	projectWindow := anObject
]

{ #category : #initialization }
CormasUITest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	projectWindow := CMSpecProjectWindow new.

]

{ #category : #accessing }
CormasUITest >> simulationWindow [

	^ self projectWindow simulationWindow simulationWindow
]

{ #category : #tests }
CormasUITest >> testCanOpenModelFromImage [
	| manager |
	manager := CMProjectManager new.
	manager openModel: #CMMockModel.
	self assert: manager currentProject cormasModel class name equals: #CMMockModel
]

{ #category : #tests }
CormasUITest >> testCurrentStepInputTextOfSimWindowIsResetAfterOpeningAModel [

	| manager |

	manager := self newProjectManagerWithInitializedUIOnModel: #CMMockModel.
	20 timesRepeat: [ manager currentProject cormasModel runStep ].
	
	manager openModel: #CMMockModel.
	manager updateNewProject: #CMMockModel.
	self 
		assert: self simulationWindow currentStepInputText text asInteger 
		equals: 0.
]

{ #category : #tests }
CormasUITest >> testCurrentStepInputTextOfSimWindowIsUpdatedWhenRuningSimulation [

	| manager |
	
	manager := self newProjectManagerWithInitializedUIOnModel: #CMMockModel.
	"simWindow openWithSpec."
	20 timesRepeat: [ manager currentProject cormasModel runStep ].
	self
		assert: self simulationWindow currentStepInputText text asInteger
		equals: manager currentProject cormasModel timeStep. 

]
