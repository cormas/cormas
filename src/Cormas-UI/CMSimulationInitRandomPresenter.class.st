Class {
	#name : 'CMSimulationInitRandomPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'randomSeedGeneratorDroplist',
		'randomSeedInput',
		'fixRandomSeedCheckbox',
		'releaseRandomSeedCheckbox'
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
	| app |
	app := CMSimulationApplication new.
	app cormasModel: CMMockModel new.
	(app newPresenter: self) open
]

{ #category : 'initialization' }
CMSimulationInitRandomPresenter >> connectPresenters [

	fixRandomSeedCheckbox
		whenActivatedDo: [ self enableRandomSeedPresenters ];
		whenDeactivatedDo: [ self disableRandomSeedPresenters ]
]

{ #category : 'accessing' }
CMSimulationInitRandomPresenter >> cormasModel [

	^ self application cormasModel
]

{ #category : 'layout' }
CMSimulationInitRandomPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 12;
		add: (SpBoxLayout newTopToBottom
			spacing: 1;
			add: 'Random number generator' expand: false;
			add: randomSeedGeneratorDroplist expand: false;
			yourself) expand: false;
		add: (SpBoxLayout newTopToBottom
			add: 'Random seed' expand: false;
			add: randomSeedInput expand: false;
			yourself) expand: false;
		add: (SpBoxLayout newTopToBottom
			spacing: 1;
			add: fixRandomSeedCheckbox expand: false;
			add: releaseRandomSeedCheckbox expand: false;
			yourself) expand: false;
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

{ #category : 'examples' }
CMSimulationInitRandomPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMSimulationInitRandomPresenter >> initializePresenters [
	
	fixRandomSeedCheckbox := self newCheckBox
		label: 'Fix random seed';
		yourself.
		
	randomSeedInput := self newNumberInput.
	
	randomSeedGeneratorDroplist := self newDropList
		items: self class availableRandomNumberGenerators;
		yourself.
	
	releaseRandomSeedCheckbox := self newCheckBox
		label: 'Release random seed after initialization';
		yourself.
		
	self disableRandomSeedPresenters.
	self initializeWithModel
]

{ #category : 'initialization' }
CMSimulationInitRandomPresenter >> initializeWithModel [

	| context |
	context := self cormasModel simulationContext.

	randomSeedGeneratorDroplist selectItem: context randomNumberGenerator class.
	randomSeedInput number: context randomSeed.
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
