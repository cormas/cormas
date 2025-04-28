Class {
	#name : 'CMSimulationInitRandomPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'fixRandomSeedCheckbox',
		'randomSeedInput',
		'randomSeedGeneratorDroplist',
		'releaseRandomSeedCheckbox',
		'modelClass',
		'whenChangedBlock'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'as yet unclassified' }
CMSimulationInitRandomPresenter class >> availableRandomNumberGenerators [
	"Find all classes that understand #seed: and #next. We assume them to be random number generators.
	Those are the only two methods that Cormas requires"
	
	<sampleInstance>
	| candidateClasses |
	
	"We start by getting the implementors of #seed: because it narrows down the list to only several classes"
	candidateClasses := #seed: implementors
		reject: [ :method | method isClassSide ]
		thenCollect: [ :method | method methodClass ].
	
	"We must include all subclasses and avoid repetitions"
	candidateClasses := (candidateClasses flatCollect: [ :each |
		each withAllSubclasses ]) asSet asOrderedCollection.

	^ candidateClasses select: [ :each | each canUnderstand: #next ].

]

{ #category : 'examples' }
CMSimulationInitRandomPresenter class >> example [
	<example>
	
	(self forModelClass: CMMockModel translator: CMEnglishTranslator new) open
]

{ #category : 'as yet unclassified' }
CMSimulationInitRandomPresenter class >> forModelClass: aClass translator: aTranslator [

	^ self on: { aClass . aTranslator }
]

{ #category : 'initialization' }
CMSimulationInitRandomPresenter >> connectPresenters [

	whenChangedBlock := [ "do nothing" ].

	fixRandomSeedCheckbox
		whenChangedDo: [ :boolean | whenChangedBlock value ];
		whenActivatedDo: [ self enableRandomSeedPresenters ];
		whenDeactivatedDo: [ self disableRandomSeedPresenters ].
		
	randomSeedInput whenNumberChangedDo: [ :number | whenChangedBlock value ].
	releaseRandomSeedCheckbox whenChangedDo: [ :boolean | whenChangedBlock value ].
]

{ #category : 'layout' }
CMSimulationInitRandomPresenter >> defaultLayout [
 
	^ SpBoxLayout newTopToBottom
		spacing: 12;
		add: (SpBoxLayout newLeftToRight
			add: translator tGenerator width: 85;
			add: randomSeedGeneratorDroplist;
			yourself)
		height: 25;
		add: (SpBoxLayout newLeftToRight
			add: translator tRandomSeed width: 85;
			add: randomSeedInput;
			yourself)
		height: 25;
		add: (SpBoxLayout newTopToBottom
			add: fixRandomSeedCheckbox height: 15;
			add: releaseRandomSeedCheckbox height: 15;
			yourself);
		yourself
]

{ #category : 'as yet unclassified' }
CMSimulationInitRandomPresenter >> disableRandomSeedPresenters [
	"Will be called when Fix random seed checkbox is deactivated"
	
	randomSeedInput beNotEditable.
	randomSeedInput disable.
	releaseRandomSeedCheckbox disable.
]

{ #category : 'as yet unclassified' }
CMSimulationInitRandomPresenter >> enableRandomSeedPresenters [
	"Will be called when Fix random seed checkbox is activated"
	
	randomSeedInput beEditable.
	randomSeedInput enable.
	releaseRandomSeedCheckbox enable.
]

{ #category : 'initialization' }
CMSimulationInitRandomPresenter >> initializePresenters [
	
	fixRandomSeedCheckbox := self newCheckBox
		label: translator tFixRandomSeed;
		yourself.
		
	randomSeedInput := self newNumberInput.
	
	randomSeedGeneratorDroplist := self newDropList
		items: self class availableRandomNumberGenerators;
		yourself.
	
	releaseRandomSeedCheckbox := self newCheckBox
		label: translator tReleaseRandomSeedAfterInitialization;
		yourself.
		
	self disableRandomSeedPresenters.
]

{ #category : 'testing' }
CMSimulationInitRandomPresenter >> isFixRandomSeed [

	^ fixRandomSeedCheckbox state
]

{ #category : 'testing' }
CMSimulationInitRandomPresenter >> isReleaseRandomSeedAfterInitialization [

	^ releaseRandomSeedCheckbox state
]

{ #category : 'settings' }
CMSimulationInitRandomPresenter >> randomSeed [

	^ randomSeedInput number
]

{ #category : 'accessing - model' }
CMSimulationInitRandomPresenter >> setModelBeforeInitialization: aCollection [

	modelClass := aCollection first.
	translator := aCollection second
]
