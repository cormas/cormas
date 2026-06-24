Class {
	#name : 'CMNumberListSamplingPresenter',
	#superclass : 'CMSamplingPresenter',
	#instVars : [
		'numberInput',
		'addButton',
		'list',
		'removeSelectedButton'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'examples' }
CMNumberListSamplingPresenter class >> exampleParameter [

	^ CMParameterFixture parameterIntMinMaxStep
]

{ #category : 'initialization' }
CMNumberListSamplingPresenter >> connectPresenters [

	addButton action: [ 
		numberInput number ifNotNil: [ :n |
			(list items includes: n) ifFalse: [
				sampler values add: n.
				list items: sampler values.
				whenChangedBlock value ].
			numberInput number: '' ] ].
	
	removeSelectedButton action: [ 
		list selectedItem ifNotNil: [ :n |
			sampler values remove: n.
			list items: sampler values.
			whenChangedBlock value ] ]
]

{ #category : 'layout' }
CMNumberListSamplingPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 4;
		add: (SpBoxLayout newLeftToRight
			spacing: 5;
			add: numberInput;
			add: addButton width: 50;
			yourself) expand: false;
		add: list;
		add: removeSelectedButton expand: false;
		yourself
]

{ #category : 'examples' }
CMNumberListSamplingPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMNumberListSamplingPresenter >> initializePresenters [

	sampler := CMListSamplingMethod new.

	numberInput := self newNumberInput.
	
	addButton := self newButton
		label: 'Add';
		yourself.
		
	list := self newList
		items: sampler values;
		yourself.
		
	removeSelectedButton := self newButton 
		label: 'Remove selected';
		yourself
]
