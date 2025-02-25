Class {
	#name : 'CMModelDesignerListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'items',
		'title',
		'titleLabel',
		'toolbar',
		'list',
		'addButton',
		'removeButton'
	],
	#category : 'Cormas-UI-ModelDesigner',
	#package : 'Cormas-UI-ModelDesigner'
}

{ #category : 'initialization' }
CMModelDesignerListPresenter >> connectPresenters [

	"do nothing"
]

{ #category : 'api' }
CMModelDesignerListPresenter >> contextMenu [

	| menu |
	menu := self newMenu.

	self contextMenuButtons do: [ :button |
		menu addItem: [ :item |
			item
				name: button help;
				icon: button icon;
				action: button action ] ].
		
	^ menu
]

{ #category : 'as yet unclassified' }
CMModelDesignerListPresenter >> contextMenuButtons [

	self subclassResponsibility
]

{ #category : 'layout' }
CMModelDesignerListPresenter >> defaultLayout [

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
CMModelDesignerListPresenter >> initializeExtraToolbarButtons [

	"do nothing"
]

{ #category : 'initialization' }
CMModelDesignerListPresenter >> initializeList [

	self subclassResponsibility
]

{ #category : 'initialization' }
CMModelDesignerListPresenter >> initializePresenters [

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
		yourself.
		
	self initializeExtraToolbarButtons.
	
	self toolbarButtons do: [ :each |
		toolbar add: each ].
		
	list := self initializeList.
	
	list contextMenu: self contextMenu
]

{ #category : 'accessing' }
CMModelDesignerListPresenter >> items: aCollection [

	list items: (self sortedItems: aCollection)
]

{ #category : 'accessing - model' }
CMModelDesignerListPresenter >> setModelBeforeInitialization: aCollection [

	title := aCollection first.
	translator := aCollection second 
]

{ #category : 'as yet unclassified' }
CMModelDesignerListPresenter >> sortedItems: aCollection [

	self subclassResponsibility 
]

{ #category : 'initialization' }
CMModelDesignerListPresenter >> toolbarButtons [

	self subclassResponsibility
]

{ #category : 'api - selection' }
CMModelDesignerListPresenter >> unselectAll [

	list unselectAll
]

{ #category : 'enumerating' }
CMModelDesignerListPresenter >> whenSelectedItemChangedDo: aBlock [

	list whenSelectedItemChangedDo: aBlock
]
