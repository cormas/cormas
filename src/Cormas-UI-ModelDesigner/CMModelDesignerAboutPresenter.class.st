Class {
	#name : 'CMModelDesignerAboutPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'modelClass',
		'textEdit',
		'microdown'
	],
	#category : 'Cormas-UI-ModelDesigner',
	#package : 'Cormas-UI-ModelDesigner'
}

{ #category : 'examples' }
CMModelDesignerAboutPresenter class >> example [
	<example>
	
	(self forModelClass: CMMockModel) open
]

{ #category : 'as yet unclassified' }
CMModelDesignerAboutPresenter class >> forModelClass: aClass [

	^ self on: aClass
]

{ #category : 'initialization' }
CMModelDesignerAboutPresenter >> connectPresenters [

	
]

{ #category : 'layout' }
CMModelDesignerAboutPresenter >> defaultLayout [

	^ SpPanedLayout newLeftToRight
		add: textEdit;
		add: microdown;
		yourself
]

{ #category : 'examples' }
CMModelDesignerAboutPresenter >> example [

	<script: 'self example'>
]

{ #category : 'initialization' }
CMModelDesignerAboutPresenter >> initializePresenters [

	textEdit := self newText
		text: modelClass aboutThisModel;
		yourself.
		
	microdown := (self instantiate: MicrodownPresenter)
		documentFromString: modelClass aboutThisModel;
		yourself
]

{ #category : 'accessing - model' }
CMModelDesignerAboutPresenter >> setModelBeforeInitialization: aClass [

	modelClass := aClass
]
