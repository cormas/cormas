Class {
	#name : 'CMSimulationInitRandomPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'presenter'
	],
	#category : 'Cormas-UI-Tests-Core',
	#package : 'Cormas-UI-Tests',
	#tag : 'Core'
}

{ #category : 'running' }
CMSimulationInitRandomPresenterTest >> setUp [

	super setUp.
	
	presenter := CMSimulationInitRandomPresenter
		forModelClass: CMMockModel
		translator: CMEnglishTranslator new
]

{ #category : 'tests' }
CMSimulationInitRandomPresenterTest >> testAvailableRandomNumberGenerators [

	| generators |
	generators := presenter class availableRandomNumberGenerators.
	
	self assert: generators isNotEmpty.
	self assert: (generators allSatisfy: [ :each | each isClass ]).
	self assertCollection: generators includesAll: { Random . PMFishmanMooreRandomGenerator }
]

{ #category : 'tests' }
CMSimulationInitRandomPresenterTest >> testIsFixRandomSeedDefault [

	self deny: presenter isFixRandomSeed 
]

{ #category : 'tests' }
CMSimulationInitRandomPresenterTest >> testIsReleaseRandomSeedAfterInitializationDefault [

	self deny: presenter isReleaseRandomSeedAfterInitialization
]
