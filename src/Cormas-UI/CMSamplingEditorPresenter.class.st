Class {
	#name : 'CMSamplingEditorPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'parameter',
		'parameterNameLabel',
		'parameterTypeLabel',
		'notebook',
		'previewText',
		'statusLabel',
		'samplingPresenter'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'examples' }
CMSamplingEditorPresenter class >> exampleBoolean [

	(self on: CMParameterFixture parameterBool) open
]

{ #category : 'examples' }
CMSamplingEditorPresenter class >> exampleEnum [

	(self on: CMParameterFixture parameterEnum) open
]

{ #category : 'examples' }
CMSamplingEditorPresenter class >> exampleFloat [

	(self on: CMParameterFixture parameterFloatMinMaxStep) open
]

{ #category : 'examples' }
CMSamplingEditorPresenter class >> exampleInteger [

	(self on: CMParameterFixture parameterIntMinMaxStep) open
]

{ #category : 'initialization' }
CMSamplingEditorPresenter >> connectPresenters [

	samplingPresenter whenChangedDo: [
		self showPreview.
		self showStatus ].
]

{ #category : 'layout' }
CMSamplingEditorPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 10;
		add: (SpBoxLayout newTopToBottom
			spacing: 1;
			add: parameterNameLabel expand: false;
			add: parameterTypeLabel expand: false;
			add: SpNullPresenter new height: 5;
			yourself) expand: false;
		add: notebook;
		add: (SpBoxLayout newTopToBottom
			add: 'Preview' expand: false;
			add: previewText expand: false;
			yourself) expand: false;
		add: statusLabel expand: false;
		yourself
]

{ #category : 'examples' }
CMSamplingEditorPresenter >> exampleBoolean [ 
	<script: 'self exampleBoolean'>
]

{ #category : 'examples' }
CMSamplingEditorPresenter >> exampleEnum [
	<script: 'self exampleEnum'>
]

{ #category : 'examples' }
CMSamplingEditorPresenter >> exampleFloat [
	<script: 'self exampleFloat'>
]

{ #category : 'examples' }
CMSamplingEditorPresenter >> exampleInteger [
	<script: 'self exampleInteger'>
]

{ #category : 'initialization' }
CMSamplingEditorPresenter >> initializePresenters [

	| samplingPresenterClass |

	parameterNameLabel := self newLabel
		label: ('Parameter: ', parameter name);
		yourself.
		
	parameterTypeLabel := self newLabel
		label: ('Type: ', parameter class name);
		yourself.
		
	notebook := self newNotebook.
	
	samplingPresenterClass := (parameter respondsTo: #values)
		ifTrue: [ CMFixedListSamplingPresenter ]
		ifFalse: [ CMNumberSamplingPresenter ].
	
	samplingPresenter := self instantiate: samplingPresenterClass on: parameter.
	
	notebook
		addPageTitle: 'Values'
		provider: [ samplingPresenter ].
		
	previewText := self newTextInput
		beNotEditable;
		yourself.
		
	statusLabel := self newLabel.
		
	self showPreview.
	self showStatus
	
]

{ #category : 'initialization' }
CMSamplingEditorPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.

	aWindowPresenter 
		title: 'Sampling Parameter Values';
		initialExtent: 400@430
]

{ #category : 'accessing' }
CMSamplingEditorPresenter >> sampler [

	^ samplingPresenter sampler
]

{ #category : 'accessing - model' }
CMSamplingEditorPresenter >> setModelBeforeInitialization: aParameter [

	parameter := aParameter
]

{ #category : 'accessing' }
CMSamplingEditorPresenter >> showPreview [

	previewText text: samplingPresenter sampler asString
]

{ #category : 'accessing' }
CMSamplingEditorPresenter >> showStatus [

	statusLabel label: 'Total: ', samplingPresenter sampler numberOfValues asString, ' values'.
]
