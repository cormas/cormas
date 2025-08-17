Class {
	#name : 'CMModelOpenerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'toolbar',
		'modelList',
		'exampleModelsList',
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
		
	(aBuilder item: #ColorPicker)
		parent: #Cormas ;
		label: 'Color Picker';
		icon: (self iconNamed: #paint);
		help: 'Open color picker';
		action: [ SpColorPickerPresenter open ];
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

	modelList whenSelectedItemChangedDo: [ :modelClass |
		modelClass ifNotNil: [
			self showLoadedModel: modelClass ] ].
	
	exampleModelsList whenSelectedItemChangedDo: [ :manifest |
		manifest ifNotNil: [
			self showExampleModel: manifest ] ].
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> createNewModel [

	| newModelPresenter |
	newModelPresenter := CMNewModelPresenter forTranslator: translator.
	
	newModelPresenter whenModelCreatedDo: [ :modelClass |
		self initializeModelLists.
		modelList selectItem: modelClass ].
	
	newModelPresenter open
]

{ #category : 'layout' }
CMModelOpenerPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: toolbar expand: false;
		add: (SpBoxLayout newLeftToRight
			spacing: 5;
			add: (SpBoxLayout newTopToBottom
				spacing: 5;
				add: (SpBoxLayout newTopToBottom
					spacing: 1;
					add: 'Models in this image' height: self class labelHeight;
					add: modelList;
					yourself);
				add: (SpBoxLayout newTopToBottom 
					spacing: 1;
					add: 'Model library' height: self class labelHeight;
					add: exampleModelsList;
					yourself);
				yourself) width: 300;
			add: modelPreview;
			yourself);
		yourself
]

{ #category : 'examples' }
CMModelOpenerPresenter >> example [
	<script: 'self example'>
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> findAvailableExampleModels [

	^ CMModelManifest allSubclasses
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> findAvailableModels [

	^ CMAbstractModel allSubclasses copyWithout: CMMockModel
]

{ #category : 'initialization' }
CMModelOpenerPresenter >> initializeModelLists [

	modelList items: self findAvailableModels.
	exampleModelsList items: self findAvailableExampleModels
]

{ #category : 'initialization' }
CMModelOpenerPresenter >> initializePresenters [

	translator := CMEnglishTranslator new.
	
	toolbar := self newToolbar.
	self initializeToolbarButtons.

	modelList := self newList
		display: [ :modelClass | modelClass modelName ];
		displayIcon: [ CMIcons cormasModelIcon ];
		yourself.
		
	exampleModelsList := self newList
		display: [ :manifest | manifest modelName ];
		displayIcon: [ :manifest | self iconNamed: #book ];
		yourself.
		
	self initializeModelLists.
	
	modelPreview := self newNotebook 
]

{ #category : 'initialization' }
CMModelOpenerPresenter >> initializeToolbarButtons [
	
	toolbar add: (self newToolbarButton
		icon: (self iconNamed: #smallNew);
		label: 'New';
		help: 'Create new model';
		action: [ self createNewModel ];
		yourself).

	toolbar add: (self newToolbarButton
		icon: (self iconNamed: #open);
		label: 'Load';
		help: 'Load model from a file';
		action: [ self loadModelFromFile ];
		yourself).
		
	toolbar addItemRight: (self newToolbarButton
		icon: (self iconNamed: #configuration);
		label: 'Settings';
		help: 'Cormas settings';
		action: [ self openSettings ];
		yourself).
]

{ #category : 'initialization' }
CMModelOpenerPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Cormas';
		initialExtent: 730@800.
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> loadModelFromFile [

	self inform: 'Not implemented yet'
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> openSettings [

	self inform: 'Not implemented yet'
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> selectedModelClass [

	^ modelList selectedItem
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> showExampleModel: aManifest [

	| page presenter loadedModelClass |

	modelList resetListSelection.
	modelPreview removeAll.
		
	page := SpNotebookPage
		title: 'Manifest'
		provider: [
			presenter := self
				instantiate: CMExampleModelPreviewPresenter
				on: { aManifest . translator }.
						
			presenter whenLoadedDo: [
				self initializeModelLists.
				
				loadedModelClass := modelList items detect: [ :modelClass |
					modelClass modelName = aManifest modelName ].
				
				modelList selectItem: loadedModelClass ].
					
			presenter ].
		
	modelPreview addPage: page.
	modelPreview selectPage: page
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> showLoadedModel: aModelClass [

	| page presenter |

	exampleModelsList resetListSelection.
	modelPreview removeAll.
		
	page := SpNotebookPage
		title: 'Model'
		provider: [
			presenter := self
				instantiate: CMLoadedModelPreviewPresenter
				on: { aModelClass . translator }.
				
			presenter whenModelDeletedDo: [
				modelPreview removeAll.
				self initializeModelLists ].
				
			presenter ].
		
	modelPreview addPage: page.
	modelPreview selectPage: page
]
