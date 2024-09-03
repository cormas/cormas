Class {
	#name : 'CMModelDesignerMethodsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'title',
		'methods',
		'titleLabel',
		'list',
		'toolbar',
		'addButton',
		'removeButton'
	],
	#category : 'Cormas-UI-ModelDesigner',
	#package : 'Cormas-UI-ModelDesigner'
}

{ #category : 'examples' }
CMModelDesignerMethodsPresenter class >> example [
	<example>
	
	(self withTitle: 'Custom methods' translator: CMEnglishTranslator new)
		methods: CMMockModel methods;
		open
]

{ #category : 'as yet unclassified' }
CMModelDesignerMethodsPresenter class >> withTitle: aString translator: aTranslator [
	
	^ self on: { aString . aTranslator }
]

{ #category : 'api' }
CMModelDesignerMethodsPresenter >> contextMenu [

	| menu |
	menu := self newMenu.

	{ removeButton } do: [ :button |
		menu addItem: [ :item |
			item
				name: button help;
				icon: button icon;
				action: button action ] ].
		
	^ menu
]

{ #category : 'layout' }
CMModelDesignerMethodsPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: (SpBoxLayout newLeftToRight
			vAlignCenter;
			add: titleLabel;
			add: toolbar expand: false;
			yourself) expand: false;
		add: list;
		yourself
]

{ #category : 'initialization' }
CMModelDesignerMethodsPresenter >> initializePresenters [

	titleLabel := self newLabel
		label: title;
		yourself.

	addButton := self newToolbarButton
		icon: (self iconNamed: #smallAdd);
		help: 'Add';
		yourself.
		
	removeButton := self newToolbarButton
		icon: (self iconNamed: #smallDelete);
		help: 'Remove';
		yourself.
		
	toolbar := self newToolbar
		beIcons;
		add: addButton;
		add: removeButton;
		yourself.
		
	list := self newList
		display: [ :method | method selector asString ];
		contextMenu: self contextMenu;
		yourself
]

{ #category : 'accessing' }
CMModelDesignerMethodsPresenter >> methods: aCollection [

	list items: (aCollection asOrderedCollection
		sorted: [ :a :b | a selector < b selector ])
]

{ #category : 'accessing - model' }
CMModelDesignerMethodsPresenter >> setModelBeforeInitialization: aCollection [

	title := aCollection first.
	translator := aCollection second 
]

{ #category : 'enumerating' }
CMModelDesignerMethodsPresenter >> whenMethodSelectedDo: aBlock [

	list whenSelectedItemChangedDo: aBlock
]
