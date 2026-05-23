Class {
	#name : 'CMParameterPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'parameter',
		'target'
	],
	#category : 'Cormas-UI-Parameters',
	#package : 'Cormas-UI',
	#tag : 'Parameters'
}

{ #category : 'as yet unclassified' }
CMParameterPresenter >> applyChange [

	parameter setValue: self newValue for: target 
]

{ #category : 'instance creation' }
CMParameterPresenter >> currentValue [
	"The current value of the parameter used by the model"
	^ parameter valueFor: target
]

{ #category : 'instance creation' }
CMParameterPresenter >> newValue [
	"The value entered by a user through the UI"
	self subclassResponsibility
]

{ #category : 'accessing - model' }
CMParameterPresenter >> setModelBeforeInitialization: aCollection [

	parameter := aCollection first.
	
	"An object to which the parameter is applied. For instance-side parameters, this would be a specific instance, for class-side parameter, this would be a class"
	target := aCollection second
]
