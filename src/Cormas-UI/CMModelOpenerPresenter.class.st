Class {
	#name : 'CMModelOpenerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'modelList',
		'modelPreview'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMModelOpenerPresenter class >> example [
	<example>
	
	self new open
]

{ #category : 'menu' }
CMModelOpenerPresenter class >> menu00CormasOn: aBuilder [
	<worldMenu>
	(aBuilder item: #Cormas)
		label: 'Cormas';
		"icon: CMIcons cormasIcon;"
		help: 'Agent-based modeling and simulations';
		order: 2.
		
	(aBuilder group: #CormasMain)
		order: 1;
		parent: #Cormas;
		withSeparatorAfter.
		
	(aBuilder group: #CormasRepositories)
		order: 1;
		parent: #Cormas;
		withSeparatorAfter.
		
	(aBuilder item: #NewCormasModel)
		parent: #CormasMain;
		label: 'New model';
		icon: (self iconNamed: #smallNew);
		help: 'Create a new Cormas model';
		action: [ (CMNewModelPresenter forTranslator: CMEnglishTranslator new) open ];
		order: 1.
		
	(aBuilder item: #CormasModels)
		parent: #CormasMain;
		label: 'Models in this image';
		icon: (self iconNamed: #smallOpen);
		help: 'Browse Cormas models that are installed on this image';
		action: [ self new open ];
		order: 1.
		
	(aBuilder item: #ExampleModels)
		parent: #CormasRepositories;
		label: 'Load example Models';
		icon: (self iconNamed: #box);
		help: 'Load example models';
		action: [ CMExampleModelLoaderPresenter new open ];
		order: 1.
		
	(aBuilder item: #UpdateCormas)
		parent: #CormasRepositories ;
		label: 'Update Cormas';
		icon: (self iconNamed: #smallUpdate);
		help: 'Pull the latest changes from Cormas repository on GitHub';
		action: [ self updateCormas ];
		order: 1.
		
	(aBuilder item: #ColorPicker)
		parent: #Cormas ;
		label: 'Color Picker';
		icon: (self iconNamed: #paint);
		help: 'Open color picker';
		action: [ SpColorPickerWindow open ];
		order: 1.
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter class >> updateCormas [

	| repo branch remote |
	
	repo := IceRepository repositories detect: [ :each | each name = 'cormas' ].
	branch := repo branch.
	remote := repo remotes detect: [ :each | each url = 'https://github.com/cormas/cormas.git' ].

	branch pullFrom: remote.
]

{ #category : 'initialization' }
CMModelOpenerPresenter >> connectPresenters [

	| page |

	modelList whenSelectedItemChangedDo: [ :modelClass |
		modelPreview removeAll.
		
		page := SpNotebookPage
			title: 'Model'
			provider: [
				self
					instantiate: CMModelPreviewPresenter
					on: { modelClass . translator } ].
		
		modelPreview addPage: page.
		modelPreview selectPage: page ]
]

{ #category : 'layout' }
CMModelOpenerPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 5;
		add: (SpBoxLayout newTopToBottom
			add: 'Models in this image' height: self class labelHeight;
			add: modelList;
			yourself) width: 300;
		add: modelPreview;
		yourself
]

{ #category : 'examples' }
CMModelOpenerPresenter >> example [
	<script: 'self example'>
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> findAvailableModels [

	^ CMAbstractModel allSubclasses
]

{ #category : 'initialization' }
CMModelOpenerPresenter >> initializePresenters [

	translator := CMEnglishTranslator new.

	modelList := self newList
		items: self findAvailableModels;
		display: [ :modelClass | modelClass modelName ];
		displayIcon: [ CMIcons cormasModelIcon ];
		yourself.
	
	modelPreview := self newNotebook 
]

{ #category : 'initialization' }
CMModelOpenerPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Cormas Models';
		initialExtent: 750@750.
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> selectedModelClass [

	^ modelList selectedItem
]
