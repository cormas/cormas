Class {
	#name : 'CMParameterPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'parameter',
		'targets'
	],
	#category : 'Cormas-UI-Parameters',
	#package : 'Cormas-UI',
	#tag : 'Parameters'
}

{ #category : 'as yet unclassified' }
CMParameterPresenter >> applyChange [

	targets do: [ :target |
		parameter setValue: self newValue for: target  ]
]

{ #category : 'instance creation' }
CMParameterPresenter >> currentValue [
	"The current value of the parameter. If multiple targets are selected, we display the value of any one of them. In many cases, they will share the same value"
	^ parameter valueFor: targets anyOne
]

{ #category : 'as yet unclassified' }
CMParameterPresenter >> displayCurrentValue [

	self displayValue: self currentValue
]

{ #category : 'as yet unclassified' }
CMParameterPresenter >> displayValue: aValue [

	self subclassResponsibility
]

{ #category : 'instance creation' }
CMParameterPresenter >> newValue [
	"The value entered by a user through the UI"
	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
CMParameterPresenter >> resetValue [

	targets do: [ :target | parameter setDefaultValueFor: target  ].
	self displayCurrentValue
]

{ #category : 'accessing - model' }
CMParameterPresenter >> setModelBeforeInitialization: aCollection [

	parameter := aCollection first.
	
	"A collection of objects to which the parameter is applied. For instance-side parameters, those would be specific instances, for class-side parameter, those would be classes"
	targets := aCollection second
]
