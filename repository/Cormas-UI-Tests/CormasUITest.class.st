Class {
	#name : #CormasUITest,
	#superclass : #TestCase,
	#instVars : [
		'pWindow'
	],
	#category : #'Cormas-UI-Tests-Core'
}

{ #category : #'create CMProjet' }
CormasUITest >> newProjectManagerWithInitializedUIOnModel: modelName [

	| aProject |

	aProject := self pWindow projectManager.
	self simWindow
		translator: (CMTranslator newForLanguage: #EN);
		initialize.
	aProject openModel: modelName.
	aProject cormasModel initSimulation.
	^ aProject
]

{ #category : #accessing }
CormasUITest >> pWindow [
	^ pWindow
]

{ #category : #accessing }
CormasUITest >> pWindow: anObject [
	pWindow := anObject
]

{ #category : #running }
CormasUITest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	pWindow := CMSpecProjectWindow new.

]

{ #category : #'create CMProjet' }
CormasUITest >> simWindow [

	^ self pWindow simWindow simWindow
]

{ #category : #running }
CormasUITest >> tearDown [
	"Hooks that subclasses may override to define the fixture of test."

	self pWindow delete.
	self simWindow delete

]

{ #category : #test }
CormasUITest >> testCanOpenModelFromImage [
	| p |
	p := CMProjectManager new.
	p openModel: #CMMockModel.
	self assert: p currentProject cormasModel class name equals: #CMMockModel
]

{ #category : #test }
CormasUITest >> testCurrentStepInputTextOfSimWindowIsResetAfterOpeningAModel [

	| aCMProjectManager |

	aCMProjectManager := self newProjectManagerWithInitializedUIOnModel: #CMMockModel.
	20 timesRepeat: [ aCMProjectManager currentProject cormasModel runStep ].
	
	aCMProjectManager openModel: #CMMockModel.
	aCMProjectManager updateNewProject: #CMMockModel.
	self 
		assert: self simWindow currentStepInputText text asInteger 
		equals: 0.
]

{ #category : #test }
CormasUITest >> testCurrentStepInputTextOfSimWindowIsUpdatedWhenRuningSimulation [

	| aCMProjectManager |
	
	aCMProjectManager := self newProjectManagerWithInitializedUIOnModel: #CMConwayModel.
	"simWindow openWithSpec."
	20 timesRepeat: [ aCMProjectManager currentProject cormasModel runStep ].
	self
		assert: self simWindow currentStepInputText text asInteger
		equals: aCMProjectManager currentProject cormasModel timeStep. 

]
