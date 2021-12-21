Class {
	#name : #CMSpCreateSpacePresenter,
	#superclass : #CMModelSpPresenter,
	#traits : 'TCMUIUtils',
	#classTraits : 'TCMUIUtils classTrait',
	#instVars : [
		'linesTextInput',
		'columnsTextInput',
		'torroidalCheckboxInput',
		'linesLabel',
		'columnsLabel',
		'torroidalLabel',
		'neighboursLabel',
		'submitButton',
		'cancelButton',
		'neighboursPresenter',
		'patchesLabel',
		'patchesLabelText'
	],
	#category : #'Cormas-UI-Spec2-Space'
}

{ #category : #specs }
CMSpCreateSpacePresenter class >> buttonsLayout [

	^ SpBoxLayout newLeftToRight
		add: #submitButton;
		add: #cancelButton;
		yourself
]

{ #category : #specs }
CMSpCreateSpacePresenter class >> defaultSpec [
	
	^ SpBoxLayout newVertical
			add: self gridLayout expand: true fill: true  padding: 0;
			add: self buttonsLayout expand: false;
		yourself
]

{ #category : #specs }
CMSpCreateSpacePresenter class >> example [
	<example>
	
	self new openWithSpec
]

{ #category : #specs }
CMSpCreateSpacePresenter class >> gridLayout [

	^ SpGridLayout new
			beColumnHomogeneous;
			borderWidth: 20;
			add: #linesLabel at: 1 @ 1;
			add: #linesTextInput at: 2 @ 1;

			add: #columnsLabel at: 1 @ 2;
			add: #columnsTextInput at: 2 @ 2;
				
			add: #patchesLabel at: 1 @ 3;
			add: #patchesLabelText at: 2 @ 3;
			
			add: #torroidalLabel at: 1 @ 4;
			add: #torroidalCheckboxInput at: 2 @ 4;

			add: #neighboursLabel at: 1 @ 5;
			add: #neighboursPresenter at: 2 @ 5;

			yourself
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> cancelButton [

	^ cancelButton
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> cancelButton: anObject [

	cancelButton := anObject
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> columnsLabel [

	^ columnsLabel
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> columnsLabel: anObject [

	columnsLabel := anObject
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> columnsTextInput [

	^ columnsTextInput
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> columnsTextInput: anObject [

	columnsTextInput := anObject
]

{ #category : #initialization }
CMSpCreateSpacePresenter >> connectPresenters [

	self submitButton action: [ self submit ].
	self cancelButton action: [ self delete ]
]

{ #category : #initialization }
CMSpCreateSpacePresenter >> initializeFocus [

	self focusOrder
		add: linesTextInput;
		add: columnsTextInput;
		add: torroidalCheckboxInput;
		add: neighboursPresenter;
		add: submitButton;
		add: cancelButton.
]

{ #category : #initialization }
CMSpCreateSpacePresenter >> initializePatchesPresenters [
	
	linesLabel := self newLabel label: 'Lines'.
	linesTextInput := self newNumberInput
		autoAccept: true;
		placeholder: 'Number of lines';
		beInteger;
		whenNumberChangedDo: [ :newText | self parseTextAndSetValue: newText geometrySelector: #columnsTextInput ];
		yourself.
	
	columnsLabel := self newLabel label: 'Columns'.
	columnsTextInput := self newNumberInput
		autoAccept: true;
		placeholder: 'Number of columns';
		beInteger;
		whenNumberChangedDo: [ :newText | self parseTextAndSetValue: newText geometrySelector: #linesTextInput ];
		yourself.
		
	patchesLabel := self newLabel label: 'Patches'.
	patchesLabelText := self newText
		beNotEditable;
		withoutScrollBars;
		yourself
]

{ #category : #initialization }
CMSpCreateSpacePresenter >> initializePresenters [

	self initializePatchesPresenters.
	
	torroidalLabel := self newLabel label: 'Torroidal'.
	torroidalCheckboxInput := self newCheckBox.
	
	neighboursLabel := self newLabel label: 'Neighbours'.
	neighboursPresenter := CMSpNeighboursListPresenter owner: self on: self cormasModel.
		
	submitButton := self newButton label: 'Submit'.
	cancelButton := self newButton label: 'Cancel'.
	
	self initializeFocus.
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> linesLabel [

	^ linesLabel
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> linesLabel: anObject [

	linesLabel := anObject
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> linesTextInput [

	^ linesTextInput
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> linesTextInput: anObject [

	linesTextInput := anObject
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> neighboursLabel [

	^ neighboursLabel
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> neighboursLabel: anObject [

	neighboursLabel := anObject
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> neighboursPresenter [

	^ neighboursPresenter
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> neighboursPresenter: anObject [

	neighboursPresenter := anObject
]

{ #category : #callbacks }
CMSpCreateSpacePresenter >> parseTextAndSetValue: aText [

	self patchesLabelText text: aText asNumber
]

{ #category : #callbacks }
CMSpCreateSpacePresenter >> parseTextAndSetValue: aNumber geometrySelector: geometrySelector [

	| patches |
	
	patches := aNumber * (self perform: geometrySelector) text asNumber.
	self patchesLabelText text: patches asString
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> patchesLabel [

	^ patchesLabel
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> patchesLabel: anObject [

	patchesLabel := anObject
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> patchesLabelText [

	^ patchesLabelText
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> patchesLabelText: anObject [

	patchesLabelText := anObject
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> submitButton [

	^ submitButton
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> submitButton: anObject [

	submitButton := anObject
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> title [ 

	^ "self formattedWindowTitle: "'Grid Configuration'
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> torroidalCheckboxInput [

	^ torroidalCheckboxInput
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> torroidalCheckboxInput: anObject [

	torroidalCheckboxInput := anObject
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> torroidalLabel [

	^ torroidalLabel
]

{ #category : #accessing }
CMSpCreateSpacePresenter >> torroidalLabel: anObject [

	torroidalLabel := anObject
]
