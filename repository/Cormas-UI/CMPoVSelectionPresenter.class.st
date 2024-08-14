Class {
	#name : 'CMPoVSelectionPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'cormasModel',
		'povDictionary'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMPoVSelectionPresenter class >> example [
	<example>
	
	| model |
	model := CMMockModel new.
	(self on: model) open.
]

{ #category : 'layout' }
CMPoVSelectionPresenter >> defaultLayout [

	| radioButtonHeight classLabelHeight sectionHeight outerLayout classPoVLayout |
	
	radioButtonHeight := 25.
	classLabelHeight := 25.
	
	outerLayout := SpBoxLayout newTopToBottom.
	
	povDictionary keysAndValuesDo: [ :classLabel :povRadioButtons |
		classPoVLayout := SpBoxLayout newTopToBottom.
		classPoVLayout add: classLabel height: classLabelHeight.
		
		povRadioButtons do: [ :radio |
			classPoVLayout add: radio height: radioButtonHeight ].
		
		sectionHeight := povRadioButtons size * radioButtonHeight + classLabelHeight.
		outerLayout add: classPoVLayout height: sectionHeight  ].
	
	outerLayout spacing: 20.
	^ outerLayout
		
]

{ #category : 'initialization' }
CMPoVSelectionPresenter >> initializePresenters [

	| classLabel radioButtons |

	povDictionary := (cormasModel class allEntityClasses collect: [ :aClass |
		classLabel := self newLabel
			label: aClass name;
			yourself.
			
		radioButtons := aClass availablePov collect: [ :selector |
			self newRadioButton
				label: selector;
				yourself ].
			
		radioButtons first associatedRadioButtons: radioButtons allButFirst.
		classLabel -> radioButtons ]) asDictionary.
	
	
]

{ #category : 'accessing - model' }
CMPoVSelectionPresenter >> setModelBeforeInitialization: aCormasModel [

	cormasModel := aCormasModel
]
