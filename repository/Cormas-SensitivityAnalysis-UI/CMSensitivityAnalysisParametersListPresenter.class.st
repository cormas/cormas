Class {
	#name : 'CMSensitivityAnalysisParametersListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'cormasModel',
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
	| model translator |
	
	model := CMMockModel new.
	translator := CMEnglishTranslator new.
	
	(self forModel: model translator: translator) open
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisParametersListPresenter class >> forModel: aCormasModel translator: aTranslator [

	^ self on: { aCormasModel . aTranslator }
]

{ #category : 'layout' }
CMSensitivityAnalysisParametersListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: toolbar expand: false;
		add: list;
		yourself
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
					forModel: cormasModel
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

	cormasModel := aCollection first.
	translator := aCollection second
]
