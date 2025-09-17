Class {
	#name : 'CMTilesetBrowser',
	#superclass : 'SpPresenter',
	#instVars : [
		'tilesetClassesList',
		'tilesList',
		'tilePreview',
		'newTilesetButton',
		'newImageButton',
		'sourceCode'
	],
	#category : 'Cormas-UI-Tilesets-Presenters',
	#package : 'Cormas-UI-Tilesets',
	#tag : 'Presenters'
}

{ #category : 'examples' }
CMTilesetBrowser class >> example [
	
	self new open
]

{ #category : 'initialization' }
CMTilesetBrowser >> connectPresenters [

	tilesetClassesList whenSelectedItemChangedDo: [ :tileset |
		tileset ifNotNil: [
			tilesList items: tileset tileSelectors sorted.
			tilesList items ifNotEmpty: [ tilesList selectIndex: 1 ] ] ].
	
	tilesList whenSelectedItemChangedDo: [ :selector |
		selector ifNotNil: [
			self showTile: (tilesetClassesList selectedItem perform: selector) ] ].
	
	newTilesetButton action: [ CMNewTilesetPresenter new open ].
	newImageButton action: [ CMNewTilesetPresenter new targetClass: tilesetClassesList selectedItem; open ]
]

{ #category : 'layout' }
CMTilesetBrowser >> defaultLayout [

	^ SpBoxLayout newHorizontal
		spacing: 4;
		add: (SpBoxLayout newVertical
			spacing: 2;
			add: 'Tilesets' expand: false;
			add: tilesetClassesList;
			add: newTilesetButton expand: false;
			yourself) width: 150;
		add: (SpBoxLayout newVertical
			spacing: 2;
			add: 'Images' expand: false;
			add: tilesList;
			add: newImageButton expand: false;
			yourself) width: 200;
		add: (SpBoxLayout newTopToBottom
			add: tilePreview;
			add: sourceCode height: 100;
			yourself);
		yourself
]

{ #category : 'examples' }
CMTilesetBrowser >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMTilesetBrowser >> initializePresenters [

	tilesetClassesList := self newList
		displayIcon: [ :each | self iconNamed: #class ];
		yourself.
		
	self initializeTilesetsMenu.
		
	tilesList := self newList
		displayIcon: [ :selector |
			(tilesetClassesList selectedItem perform: selector) smallForm scaledToSize: 20@20 ]
		yourself.
		
	tilePreview := self newNotebook.
	
	newTilesetButton := self newButton
		label: 'Create new tileset';
		icon: (self iconNamed: #add);
		yourself.
		
	newImageButton := self newButton
		label: 'Add new image';
		icon: (self iconNamed: #add);
		yourself.
		
	sourceCode := self newCode.
		
	self showTilesets
]

{ #category : 'initialization' }
CMTilesetBrowser >> initializeTilesetsMenu [

	tilesetClassesList contextMenu: (SpMenuPresenter new 
		addItem: [ :item | item
			name: 'Rename';
			icon: (self iconNamed: #browse);
			action: [ tilesetClassesList selectedItem ] ];
		addItem: [ :item | item
			name: 'Browse';
			icon: (self iconNamed: #smallSystemBrowser);
			action: [ tilesetClassesList selectedItem browse ] ];
		addItem: [ :item | item
			name: 'Reset';
			icon: (self iconNamed: #restart);
			action: [ tilesetClassesList selectedItem resetTiles ] ];
		addItem: [ :item | item
			name: 'Delete';
			icon: (self iconNamed: #remove);
			action: [ self removeTileset: tilesetClassesList selectedItem ] ];
		yourself).
]

{ #category : 'initialization' }
CMTilesetBrowser >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Tileset Browser';
		initialExtent: 800@600
]

{ #category : 'initialization' }
CMTilesetBrowser >> onAddImagesClicked [
	
	| presenter |

	presenter := CMNewTilesetPresenter new.
	
	tilesetClassesList selectedItem ifNotNil: [ :aClass |
		presenter targetClass: aClass ].
	
	presenter open
]

{ #category : 'removing' }
CMTilesetBrowser >> removeTileset: aClass [

	aClass removeFromSystem.
	self showTilesets
]

{ #category : 'as yet unclassified' }
CMTilesetBrowser >> showTile: aTile [

	| selectedPageIndex |
	
	sourceCode text: tilesetClassesList selectedItem name, ' ', tilesList selectedItem.
	
	selectedPageIndex := tilePreview selectedPageIndex.
	selectedPageIndex = 0 ifTrue: [ selectedPageIndex := 1 ].
	
	tilePreview pages removeAll.
	
	tilePreview
		addPageTitle: 'Large'
		provider: [
			self newImage
				image: aTile largeForm;
				yourself ].
			
	tilePreview
		addPageTitle: 'Medium'
		provider: [
			self newImage
				image: aTile mediumForm;
				yourself ].
			
	tilePreview
		addPageTitle: 'Small'
		provider: [
			self newImage
				image: aTile smallForm;
				yourself ].
			
	tilePreview
		addPageTitle: 'Very Small'
		provider: [
			self newImage
				image: aTile verySmallForm;
				yourself ].
			
	tilePreview selectPageIndex: selectedPageIndex.
]

{ #category : 'as yet unclassified' }
CMTilesetBrowser >> showTilesets [

	tilesetClassesList items: TCMTileset users asOrderedCollection.
	"tilesetClassesList items ifNotEmpty: [ tilesetClassesList selectIndex: 1 ]"
]
