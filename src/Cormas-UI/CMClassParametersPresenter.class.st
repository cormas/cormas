Class {
	#name : 'CMClassParametersPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'cormasModel',
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
	
	(self on: CMMockModel new) open
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

	| classes |
	classes := cormasModel class allEntityClasses.

	classDropList := self newDropList
		items: classes;
		yourself.
		
	parametersPresenter := self newPresenterSelector.
	
	classes do: [ :aClass |
		parametersPresenter
			when: [ selectedClass = aClass ]
			show: [ self
				instantiate: CMParametersPresenter
				on: { aClass classSideParameters . { aClass } } ] ].
		
	parametersPresenter
		defaultShow: [ self newLabel label: 'Select a class'; yourself ];
		updatePresenter.
]

{ #category : 'accessing - model' }
CMClassParametersPresenter >> setModelBeforeInitialization: aModel [

	cormasModel := aModel
]
