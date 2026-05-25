Class {
	#name : 'CMBooleanParameterPresenter',
	#superclass : 'CMParameterPresenter',
	#instVars : [
		'checkbox'
	],
	#category : 'Cormas-UI-Parameters',
	#package : 'Cormas-UI',
	#tag : 'Parameters'
}

{ #category : 'examples' }
CMBooleanParameterPresenter class >> example [
	<example>
	| parameter |
	
	parameter := CMBooleanParameter new
		getterSelector: #isProtected;
		setterSelector: #isProtected:;
		targetClass: CMMockCell;
		isClassSide: false;
		defaultValue: false;
		yourself.
		
	(self on: { parameter . CMMockCell new}) open
]

{ #category : 'layout' }
CMBooleanParameterPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: checkbox expand: false;
		yourself
]

{ #category : 'examples' }
CMBooleanParameterPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMBooleanParameterPresenter >> initializePresenters [

	checkbox := self newCheckBox
		label: parameter name;
		yourself.
		
	checkbox state: self currentValue
]

{ #category : 'instance creation' }
CMBooleanParameterPresenter >> newValue [

	^ checkbox state
]
