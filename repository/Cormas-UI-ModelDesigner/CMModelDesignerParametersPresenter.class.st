Class {
	#name : 'CMModelDesignerParametersPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'aClass',
		'classSideCheckbox',
		'nameColumn',
		'table',
		'addButton',
		'editButton',
		'removeButton'
	],
	#category : 'Cormas-UI-ModelDesigner',
	#package : 'Cormas-UI-ModelDesigner'
}

{ #category : 'instance creation' }
CMModelDesignerParametersPresenter class >> forClass: aClass translator: aTranslator [

	^ self on: { aClass . aTranslator }
]

{ #category : 'initialization' }
CMModelDesignerParametersPresenter >> connectPresenters [

	classSideCheckbox
		whenActivatedDo: [ self displayClassSideVariables ];
		whenDeactivatedDo: [ self displayInstanceSideVariables ]
]

{ #category : 'api' }
CMModelDesignerParametersPresenter >> contextMenu [

	| menu |
	menu := self newMenu.

	{ editButton . removeButton } do: [ :button |
		menu addItem: [ :item |
			item
				name: button help;
				icon: button icon;
				action: button action ] ].
		
	^ menu
]

{ #category : 'layout' }
CMModelDesignerParametersPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: (SpBoxLayout newLeftToRight
			add: 'Parameters';
			add: classSideCheckbox width: 100;
			yourself) expand: false;
		add: table;
		add: (SpBoxLayout newLeftToRight
			add: addButton width: 30;
			add: editButton width: 30;
			add: removeButton width: 30;
			yourself) expand: false;
		yourself
]

{ #category : 'as yet unclassified' }
CMModelDesignerParametersPresenter >> displayClassSideVariables [
	
	nameColumn displayUnderline: [ :each | true ].
	table items: aClass class slots.
]

{ #category : 'as yet unclassified' }
CMModelDesignerParametersPresenter >> displayInstanceSideVariables [
	
	nameColumn displayUnderline: [ :each | false ].
	table items: aClass slots
]

{ #category : 'examples' }
CMModelDesignerParametersPresenter >> example [

	<script: '(self forClass: CMMockModel translator: CMEnglishTranslator new) open'>
]

{ #category : 'initialization' }
CMModelDesignerParametersPresenter >> initializePresenters [

	classSideCheckbox := self newCheckBox
		label: 'Class side';
		yourself.

	addButton := self newButton
		icon: (self iconNamed: #smallAdd);
		help: 'Add';
		yourself.
		
	editButton := self newButton
		icon: (self iconNamed: #glamorousEdit);
		help: 'Edit';
		yourself.
		
	removeButton := self newButton
		icon: (self iconNamed: #smallDelete);
		help: 'Remove';
		yourself.
		
	nameColumn := SpStringTableColumn
			title: 'Name'
			evaluated: [ :parameter | parameter name ].

	table := self newTable
		addColumn: nameColumn;
		addColumn: ((SpStringTableColumn
			title: 'Initial value'
			evaluated: [ '0' ])
			width: 90;
			yourself);
		contextMenu: self contextMenu;
		yourself.
		
	self displayInstanceSideVariables
]

{ #category : 'accessing - model' }
CMModelDesignerParametersPresenter >> setModelBeforeInitialization: aCollection [

	aClass := aCollection first.
	translator := aCollection second
]
