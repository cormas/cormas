Class {
	#name : 'CMFloatParameterPresenter',
	#superclass : 'CMParameterPresenter',
	#instVars : [
		'nameLabel',
		'helpButton',
		'numberInput',
		'popover'
	],
	#category : 'Cormas-UI-Parameters',
	#package : 'Cormas-UI',
	#tag : 'Parameters'
}

{ #category : 'examples' }
CMFloatParameterPresenter class >> example [
	<example>
	| parameter |
	
	parameter := CMFloatParameter new
		getterSelector: #harvestRate;
		setterSelector: #harvestRate:;
		targetClass: CMMockGoat;
		isClassSide: false;
		minValue: 0;
		maxValue: 1;
		step: 0.2;
		defaultValue: 0.4;
		yourself.
		
	(self on: { parameter . CMMockGoat new }) open
]

{ #category : 'layout' }
CMFloatParameterPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: nameLabel;
		add: numberInput width: 70;
		add: helpButton width: 25;
		yourself.
]

{ #category : 'examples' }
CMFloatParameterPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMFloatParameterPresenter >> initializePresenters [

	nameLabel := self newLabel
		label: parameter name;
		yourself.
		
	helpButton := self newButton
		icon: (self iconNamed: #help);
		action: [ self showPopover: SpPopoverPosition right relativeTo: helpButton ]
		yourself.
		
	numberInput := self newNumberInput.
	
	parameter minValue ifNotNil: [ 
		numberInput minimum: parameter minValue ].
	
	parameter maxValue ifNotNil: [ 
		numberInput maximum: parameter maxValue ].
	
	parameter step ifNotNil: [ 
		numberInput climbRate: parameter step ].
	
	numberInput number: self currentValue.
	numberInput beFloat.
		
]

{ #category : 'instance creation' }
CMFloatParameterPresenter >> newValue [

	^ numberInput number
]

{ #category : 'initialization' }
CMFloatParameterPresenter >> showPopover: aPosition relativeTo: aPresenter [

	| grid popoverPresenter |
		
	"We can't use SpGridLayout here because the popover fails to calculate its size correctly"
	grid := SpBoxLayout newTopToBottom.
	
	parameter minValue ifNotNil: [ 
		grid add: (SpBoxLayout newLeftToRight
			add: 'Min';
			add: parameter minValue asString width: 50;
			yourself) ].
				
	parameter maxValue ifNotNil: [ 
		grid add: (SpBoxLayout newLeftToRight
			add: 'Max';
			add: parameter maxValue asString width: 50;
			yourself) ].
				
	parameter step ifNotNil: [ 
		grid add: (SpBoxLayout newLeftToRight
			add: 'Step';
			add: parameter step asString width: 50;
			yourself) ].
				
	grid add: (SpBoxLayout newLeftToRight
		add: 'Default';
		add: parameter defaultValue asString width: 50;
		yourself).
	
	popoverPresenter := (SpPresenter new 
		layout: (SpBoxLayout newTopToBottom
			borderWidth: 10; 
			spacing: 5;
			add: grid;
			yourself);
		yourself).

	popover ifNotNil: [ popover dismiss ].
	(popover := self newPopover)
		relativeTo: aPresenter;
		position: aPosition;
		presenter: popoverPresenter;
		popup
]
