Class {
	#name : 'CMClassParametersPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'parameterDict',
		'classDropList',
		'parametersPresenter',
		'selectedClass'
	],
	#category : 'Cormas-UI-Parameters',
	#package : 'Cormas-UI',
	#tag : 'Parameters'
}

{ #category : 'examples' }
CMClassParametersPresenter class >> example [
	<example>
	| dict |
	
	dict := (CMMockModel allEntityClasses collect: [ :aClass |
		aClass -> (CMParameter collectAllParametersFrom: aClass) ]) asDictionary.
	
	(self on: dict) open
]

{ #category : 'as yet unclassified' }
CMClassParametersPresenter >> connectPresenters [

	classDropList whenSelectedItemChangedDo: [ :aClass |
		selectedClass := aClass.
		parametersPresenter updatePresenter ]
]

{ #category : 'layout' }
CMClassParametersPresenter >> defaultLayout [
	
	^ SpBoxLayout newTopToBottom
		spacing: 5;
		add: (SpBoxLayout newTopToBottom
			add: 'Entity class' expand: false;
			add: classDropList expand: false;
			yourself) expand: false;
		add: parametersPresenter;
		yourself
]

{ #category : 'examples' }
CMClassParametersPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMClassParametersPresenter >> initializePresenters [

	classDropList := self newDropList
		items: parameterDict keys;
		yourself.
		
	parametersPresenter := self newPresenterSelector.
	
	parameterDict keysDo: [ :aClass |
		parametersPresenter
			when: [ selectedClass = aClass ]
			show: [ self instantiate: CMParametersPresenter on: (parameterDict at: aClass) ] ].
		
	parametersPresenter
		defaultShow: [ self newLabel label: 'Select a class'; yourself ];
		updatePresenter.
]

{ #category : 'accessing - model' }
CMClassParametersPresenter >> setModelBeforeInitialization: aDictionary [

	parameterDict := aDictionary
]
