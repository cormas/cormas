Class {
	#name : 'CMParametersBrowserPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'cormasModel',
		'modelRadio',
		'classRadio',
		'selectionRadio',
		'presenterSelector',
		'modelParametersPresenter',
		'classParametersPresenter',
		'selectionParametersPresenter'
	],
	#category : 'Cormas-UI-Parameters',
	#package : 'Cormas-UI',
	#tag : 'Parameters'
}

{ #category : 'examples' }
CMParametersBrowserPresenter class >> example [

	(self on: CMMockModel new) open
]

{ #category : 'initialization' }
CMParametersBrowserPresenter >> connectPresenters [

	"Note: we use whenDeactivatedDo: because whenActivatedDo: is called before the previous radio button is deactivated, so when it's called, two radio buttons are activated at the same time. Also, we don't want to use whenChangedDo: because every time it will update the presenter twice: once for the activated button and once for the deactivated one"
	"modelRadio whenDeactivatedDo: [ presenterSelector updatePresenter ].
	classRadio whenDeactivatedDo: [ presenterSelector updatePresenter ].
	selectionRadio whenDeactivatedDo: [ presenterSelector updatePresenter ]."
	
	modelRadio whenActivatedDo: [ self showModelParametersPresenter ].
	classRadio whenActivatedDo: [ self showClassParametersPresenter ].
	selectionRadio whenActivatedDo: [ self showSelectionParametersPresenter ].
]

{ #category : 'layout' }
CMParametersBrowserPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 10;
		add: (SpBoxLayout newTopToBottom
			add: 'Target:' expand: false;
			add: (SpBoxLayout newLeftToRight
				add: modelRadio;
				add: classRadio;
				add: selectionRadio;
				yourself) expand: false;
			yourself) expand: false;
		yourself.
]

{ #category : 'examples' }
CMParametersBrowserPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMParametersBrowserPresenter >> hideCurrentParametersPresenter [

	layout presenters allButFirstDo: [ :each |
		layout remove: each ]
]

{ #category : 'initialization' }
CMParametersBrowserPresenter >> initializePresenters [
	
	| modelParameters classParameters |
	
	modelParameters := cormasModel parameters.
	
	classParameters := Dictionary newFrom: (cormasModel class allEntityClasses collect: [ :aClass |
		aClass -> aClass classSideParameters ]).

	modelRadio := self newRadioButton
		label: 'Model';
		yourself.
		
	classRadio := self newRadioButton
		label: 'Class';
		yourself.
		
	selectionRadio := self newRadioButton
		label: 'Selection';
		yourself.
		
	modelRadio associatedRadioButtons: { classRadio . selectionRadio }.
	
	modelParametersPresenter := self
		instantiate: CMParametersPresenter
		on: { modelParameters . { cormasModel } }.
		
	classParametersPresenter := self
		instantiate: CMClassParametersPresenter
		on: classParameters.
		
	selectionParametersPresenter := self
		instantiate: CMSelectionParametersPresenter
		on: cormasModel.
	
	"presenterSelector := self newPresenterSelector
		when: [ modelRadio state ] show: [ self instantiate: CMParametersPresenter on: modelParameters ];
		when: [ classRadio state ] show: [ self instantiate: CMClassParametersPresenter on: classParameters ];
		when: [ selectionRadio state ] show: [ self newLabel label: 'Selection selected'; yourself ];
		defaultShow: [ self newLabel label: 'Please choose the target'; yourself ];
		updatePresenter;
		yourself."
]

{ #category : 'as yet unclassified' }
CMParametersBrowserPresenter >> layoutWithClassParametersPresenter [

	^ self defaultLayout
		add: classParametersPresenter;
		yourself
]

{ #category : 'as yet unclassified' }
CMParametersBrowserPresenter >> layoutWithModelParametersPresenter [

	^ self defaultLayout
		add: modelParametersPresenter;
		yourself
]

{ #category : 'as yet unclassified' }
CMParametersBrowserPresenter >> layoutWithSelectionParametersPresenter [

	^ self defaultLayout
		add: selectionParametersPresenter;
		yourself
]

{ #category : 'accessing - model' }
CMParametersBrowserPresenter >> setModelBeforeInitialization: aModel [

	cormasModel := aModel 
]

{ #category : 'as yet unclassified' }
CMParametersBrowserPresenter >> showClassParametersPresenter [

	"self layout: self defaultLayout"
	self layout: self layoutWithClassParametersPresenter
	"self hideCurrentParametersPresenter.
	layout add: classParametersPresenter"
]

{ #category : 'as yet unclassified' }
CMParametersBrowserPresenter >> showModelParametersPresenter [

	"self layout: self defaultLayout"
	self layout: self layoutWithModelParametersPresenter
	"self hideCurrentParametersPresenter.
	layout add: modelParametersPresenter"
]

{ #category : 'as yet unclassified' }
CMParametersBrowserPresenter >> showSelectionParametersPresenter [

	"self layout: self defaultLayout"
	self layout: self layoutWithSelectionParametersPresenter
	"self hideCurrentParametersPresenter.
	layout add: selectionParametersPresenter"
]
