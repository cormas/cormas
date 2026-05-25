Class {
	#name : 'CMEnumParameterPresenter',
	#superclass : 'CMParameterPresenter',
	#instVars : [
		'label',
		'droplist'
	],
	#category : 'Cormas-UI-Parameters',
	#package : 'Cormas-UI',
	#tag : 'Parameters'
}

{ #category : 'examples' }
CMEnumParameterPresenter class >> example [
	<example>
	| parameter |
	
	parameter := CMEnumParameter new
		getterSelector: #weather;
		setterSelector: #weather:;
		targetClass: CMMockModel;
		isClassSide: false;
		values: #(sunny cloudy rainy snowy);
		defaultValue: #sunny;
		yourself.
		
	(self on: { parameter . CMMockModel new }) open
]

{ #category : 'layout' }
CMEnumParameterPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: label expand: false;
		add: droplist expand: false;
		yourself
]

{ #category : 'examples' }
CMEnumParameterPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMEnumParameterPresenter >> initializePresenters [
	
	label := self newLabel
		label: parameter name;
		yourself.
		
	droplist := self newDropList
		items: parameter values;
		selectItem: self currentValue;
		yourself
]

{ #category : 'instance creation' }
CMEnumParameterPresenter >> newValue [

	^ droplist selectedItem
]
