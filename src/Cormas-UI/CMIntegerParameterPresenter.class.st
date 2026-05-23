Class {
	#name : 'CMIntegerParameterPresenter',
	#superclass : 'CMFloatParameterPresenter',
	#category : 'Cormas-UI-Parameters',
	#package : 'Cormas-UI',
	#tag : 'Parameters'
}

{ #category : 'examples' }
CMIntegerParameterPresenter class >> example [
	<example>
	| parameter |
	
	parameter := CMIntegerParameter new
		getterSelector: #energy;
		setterSelector: #energy:;
		targetClass: CMMockGoat;
		isClassSide: false;
		minValue: -10;
		maxValue: 10;
		step: 2;
		defaultValue: 4;
		yourself.
		
	(self on: { parameter . CMMockGoat new }) open
]

{ #category : 'examples' }
CMIntegerParameterPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMIntegerParameterPresenter >> initializePresenters [

	super initializePresenters.
	numberInput beInteger.
]
