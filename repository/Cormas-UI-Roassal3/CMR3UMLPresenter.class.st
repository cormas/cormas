Class {
	#name : #CMR3UMLPresenter,
	#superclass : #CMModelSpPresenter,
	#traits : 'TCMUIUtils',
	#classTraits : 'TCMUIUtils classTrait',
	#instVars : [
		'umlDiagram'
	],
	#category : #'Cormas-UI-Roassal3-UML'
}

{ #category : #specs }
CMR3UMLPresenter class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
			add: #umlDiagram;
			yourself
]

{ #category : #initialization }
CMR3UMLPresenter >> initializePresenters [

	umlDiagram := CMR3UMLDiagram owner: self on: self cormasModel.


]

{ #category : #accessing }
CMR3UMLPresenter >> umlDiagram [

	^ umlDiagram
]

{ #category : #accessing }
CMR3UMLPresenter >> umlDiagram: anObject [

	umlDiagram := anObject
]
