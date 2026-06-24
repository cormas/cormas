Class {
	#name : 'CMFixedListSamplingPresenter',
	#superclass : 'CMSamplingPresenter',
	#instVars : [
		'table'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMFixedListSamplingPresenter class >> exampleParameter [

	^ CMParameterFixture parameterEnum
]

{ #category : 'layout' }
CMFixedListSamplingPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: table;
		yourself
]

{ #category : 'examples' }
CMFixedListSamplingPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMFixedListSamplingPresenter >> initializePresenters [

	sampler := CMListSamplingMethod new
		values: parameter values asOrderedCollection;
		yourself.
	
	table := self newTable
		hideColumnHeaders;
		addColumn: ((SpCheckBoxTableColumn
			evaluated: [ :each | sampler values includes: each ])
			onActivation: [ :each |
				sampler values add: each.
				whenChangedBlock value ];
			onDeactivation: [ :each |
				sampler values remove: each.
				whenChangedBlock value ];
			width: 20;
			yourself);
		addColumn: (SpStringTableColumn
			evaluated: [ :each | each ]);
		items: parameter values;
		yourself 
]
