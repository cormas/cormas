Class {
	#name : 'CMNumberSamplingPresenter',
	#superclass : 'CMSamplingPresenter',
	#instVars : [
		'monteCarloRadio',
		'rangeRadio',
		'listRadio',
		'monteCarloPresenter',
		'rangePresenter',
		'listPresenter',
		'activePresenter'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'examples' }
CMNumberSamplingPresenter class >> exampleFloat [

	(self on: CMParameterFixture parameterFloatMinMaxStep) open
]

{ #category : 'examples' }
CMNumberSamplingPresenter class >> exampleInteger [

	(self on: CMParameterFixture parameterIntMinMaxStep) open
]

{ #category : 'initialization' }
CMNumberSamplingPresenter >> connectPresenters [
	
	monteCarloRadio whenActivatedDo: [
		self showPresenter: monteCarloPresenter ].
	
	rangeRadio whenActivatedDo: [ 
		self showPresenter: rangePresenter ].
	
	listRadio whenActivatedDo: [ 
		self showPresenter: listPresenter ]
]

{ #category : 'layout' }
CMNumberSamplingPresenter >> defaultLayout [

	^ self layoutWith: activePresenter
]

{ #category : 'examples' }
CMNumberSamplingPresenter >> exampleFloat [
	<script: 'self exampleFloat'>
]

{ #category : 'examples' }
CMNumberSamplingPresenter >> exampleInteger [
	<script: 'self exampleInteger'>
]

{ #category : 'initialization' }
CMNumberSamplingPresenter >> initializePresenters [

	monteCarloRadio := self newRadioButton
		label: 'Monte Carlo';
		yourself.
		
	rangeRadio := self newRadioButton
		label: 'Range';
		yourself.
		
	listRadio := self newRadioButton
		label: 'List';
		yourself.
		
	monteCarloRadio associatedRadioButtons: { rangeRadio . listRadio }.
	
	"choice := self newPresenterSelector."
	
	monteCarloPresenter := self instantiate: CMMonteCarloSamplingPresenter on: parameter.
	rangePresenter := self instantiate: CMRangeSamplingPresenter on: parameter.
	listPresenter := self instantiate: CMNumberListSamplingPresenter on: parameter.
	
	self showPresenter: monteCarloPresenter 
	
	"choice when: [ monteCarloRadio state ] show: [ activePresenter := monteCarloPresenter ].
	choice when: [ rangeRadio state ] show: [ self newLabel label: 'Foo'; yourself""activePresenter := rangePresenter"" ].
	choice when: [ listRadio state ] show: [ self newLabel label: 'Bar'; yourself""activePresenter := listPresenter"" ].
	
	choice
		defaultShow: [ self newLabel label: 'Select a sampling method'; yourself ];
		updatePresenter."
	
	
]

{ #category : 'as yet unclassified' }
CMNumberSamplingPresenter >> layoutWith: aPresenter [

	^ SpBoxLayout newLeftToRight
		add: (SpBoxLayout newTopToBottom
			spacing: 8;
			"add: 'Sampling method' expand: false;"
			add: (SpBoxLayout newTopToBottom
				add: monteCarloRadio expand: false;
				add: rangeRadio expand: false;
				add: listRadio expand: false;
				yourself) expand: false;
			yourself) width: 120;
		add: (SpBoxLayout newTopToBottom
			spacing: 8;
			"add: 'Range' expand: false;"
			add: aPresenter;
			yourself);
		yourself
]

{ #category : 'as yet unclassified' }
CMNumberSamplingPresenter >> showPresenter: aPresenter [

	activePresenter := aPresenter.
	sampler := activePresenter sampler.
	
	self layout: (self layoutWith: activePresenter).
	whenChangedBlock value
]

{ #category : 'announcing' }
CMNumberSamplingPresenter >> whenChangedDo: aBlock [

	super whenChangedDo: aBlock.
	monteCarloPresenter whenChangedDo: aBlock.
	rangePresenter whenChangedDo: aBlock.
	listPresenter whenChangedDo: aBlock
]
