Class {
	#name : 'CMSensitivityAnalysisParametersListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'availableParameters',
		'translator',
		'list',
		'toolbar'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisParametersListPresenter class >> example [
	<example>
	
	(self
		forParameters: CMMockModel parameters
		translator: CMEnglishTranslator new) open
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisParametersListPresenter class >> forParameters: aCollectionOfParameters translator: aTranslator [

	^ self on: { aCollectionOfParameters . aTranslator }
]

{ #category : 'layout' }
CMSensitivityAnalysisParametersListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: toolbar expand: false;
		add: list;
		yourself
]

{ #category : 'accessing' }
CMSensitivityAnalysisParametersListPresenter >> enabled: aBoolean [

	super enabled: aBoolean.
	list items do: [ :each | each enabled: aBoolean ].
	toolbar items do: [ :each | each enabled: aBoolean ].
]

{ #category : 'initialization' }
CMSensitivityAnalysisParametersListPresenter >> initializePresenters [

	| addButton inspectButton |
	list := self newComponentList.
	
	addButton := self newToolbarButton
		label: translator tAdd;
		icon: (self iconNamed: #add);
		help: translator tAddMeasurementHelp;
		action: [
			list addPresenter: (
				CMSensitivityAnalysisParameterRowPresenter
					forParameters: availableParameters
					translator: translator) ];
		yourself.
		
	inspectButton := self newToolbarButton
		label: translator tInspector;
		icon: (self iconNamed: #smallInspectIt);
		action: [ self parameterValues inspect ];
		yourself.
		
	toolbar := self newToolbar
		add: addButton;
		add: inspectButton;
		yourself.
]

{ #category : 'accessing' }
CMSensitivityAnalysisParametersListPresenter >> parameterValues [

	| definedRows parameterValues |
	definedRows := list items select: #isFullyDefined.
	
	parameterValues := Dictionary new.
	
	definedRows do: [ :row |
		(parameterValues at: row parameter ifAbsentPut: OrderedCollection new)
			addAll: row values ].
		
	^ parameterValues
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisParametersListPresenter >> setModelBeforeInitialization: aCollection [

	availableParameters := aCollection first.
	translator := aCollection second
]
