Class {
	#name : 'CMModelDesignerParametersPresenter',
	#superclass : 'CMModelDesignerListPresenter',
	#instVars : [
		'aClass',
		'nameColumn',
		'classSideButton',
		'editButton'
	],
	#category : 'Cormas-UI-ModelDesigner',
	#package : 'Cormas-UI-ModelDesigner'
}

{ #category : 'examples' }
CMModelDesignerParametersPresenter class >> example [
	<example>
	
	(self
		withTitle: 'Parameters'
		forClass: CMMockModel
		translator: CMEnglishTranslator new) open
]

{ #category : 'instance creation' }
CMModelDesignerParametersPresenter class >> withTitle: aString forClass: aClass translator: aTranslator [

	^ self on: { aString . aClass . aTranslator }
]

{ #category : 'initialization' }
CMModelDesignerParametersPresenter >> connectPresenters [

	super connectPresenters.

	classSideButton
		whenActivatedDo: [ self displayClassSideVariables ];
		whenDeactivatedDo: [ self displayInstanceSideVariables ]
]

{ #category : 'as yet unclassified' }
CMModelDesignerParametersPresenter >> contextMenuButtons [

	^ { editButton . removeButton  }
]

{ #category : 'as yet unclassified' }
CMModelDesignerParametersPresenter >> displayClassSideVariables [
	
	nameColumn displayUnderline: [ :each | true ].
	self items: aClass class slots.
]

{ #category : 'as yet unclassified' }
CMModelDesignerParametersPresenter >> displayInstanceSideVariables [
	
	nameColumn displayUnderline: [ :each | false ].
	self items: aClass slots
]

{ #category : 'examples' }
CMModelDesignerParametersPresenter >> example [

	<script: 'self example'>
]

{ #category : 'initialization' }
CMModelDesignerParametersPresenter >> initializeExtraToolbarButtons [

	classSideButton := self newToolbarToggleButton
		icon: (self iconNamed: #class);
		help: 'Class side';
		yourself.

	editButton := self newToolbarButton
		icon: (self iconNamed: #glamorousEdit);
		help: 'Edit';
		yourself.
]

{ #category : 'initialization' }
CMModelDesignerParametersPresenter >> initializeList [

	nameColumn := SpStringTableColumn
		title: 'Name'
		evaluated: [ :parameter | parameter name ].

	^ self newTable
		addColumn: nameColumn;
		addColumn: ((SpStringTableColumn
			title: 'Initial value'
			evaluated: [ '0' ])
			width: 90;
			yourself);
		yourself
]

{ #category : 'initialization' }
CMModelDesignerParametersPresenter >> initializePresenters [

	super initializePresenters.
	self displayInstanceSideVariables
]

{ #category : 'accessing - model' }
CMModelDesignerParametersPresenter >> setModelBeforeInitialization: aCollection [

	title := aCollection first.
	aClass := aCollection second.
	translator := aCollection third
]

{ #category : 'as yet unclassified' }
CMModelDesignerParametersPresenter >> sortedItems: aCollection [

	^ aCollection sorted: [ :a :b |
		a name < b name ]
]

{ #category : 'initialization' }
CMModelDesignerParametersPresenter >> toolbarButtons [

	^ { classSideButton . addButton . editButton . removeButton }
]
