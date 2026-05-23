Class {
	#name : 'CMSensitivityAnalysisParametersListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'availableParameters',
		'list',
		'toolbar'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisParametersListPresenter class >> example [
	<example>
	
	(self forParameters: CMMockModel parameters) open
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisParametersListPresenter class >> forParameters: aCollectionOfParameters [

	^ self on: aCollectionOfParameters
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
		label: 'Add';
		icon: (self iconNamed: #add);
		help: 'Add new probe measurement';
		action: [
			list addPresenter: (
				CMSensitivityAnalysisParameterRowPresenter
					forParameters: availableParameters) ];
		yourself.
		
	inspectButton := self newToolbarButton
		label: 'Inspector';
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

	availableParameters := aCollection
]
