Class {
	#name : #CormasUITest,
	#superclass : #TestCase,
	#instVars : [
		'pWindow'
	],
	#category : #'Cormas-Tests-UI'
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
	p openModel: #CMConwayModel.
	self assert: p currentProject cormasModel class name equals: #CMConwayModel
]

{ #category : #test }
CormasUITest >> testCurrentStepInputTextOfSimWindowIsResetAfterOpeningAModel [

	| aCMProjectManager |

	aCMProjectManager := self newProjectManagerWithInitializedUIOnModel: #CMConwayModel.
	20 timesRepeat: [ aCMProjectManager currentProject cormasModel runStep ].
	
	aCMProjectManager openModel: #CMECECModel.
	aCMProjectManager updateNewProject: #CMECECModel.
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

{ #category : #test }
CormasUITest >> testNumberOfDataOfSimpleChartIsUpdatedWhenRuningSimulation [

	| aCMProjectManager aCormasModel aSimpleChart probes |

	aCMProjectManager := self newProjectManagerWithInitializedUIOnModel: #CMConwayModel.
	aCormasModel := aCMProjectManager currentProject cormasModel.
	probes := OrderedCollection new.
	probes add: 'CMConwayModel>>alive'.
	probes add: 'CMConwayModel>>dead'.
	aCormasModel class setActiveProbes: probes.
	aCormasModel initSimulation.
	aSimpleChart := CMSimpleChart openOn: aCormasModel.
	5
		timesRepeat: [ "aSimpleChart close --> There are no such message for RTGrapher"
			aCMProjectManager currentProject cormasModel runStep.
			self assert: aSimpleChart maxX value equals: aCormasModel timeStep.
			self
				assert: aSimpleChart datasets first elements size - 1
				equals: aCormasModel timeStep ].
	aSimpleChart window delete
]
