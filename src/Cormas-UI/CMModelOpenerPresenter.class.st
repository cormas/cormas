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

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter class >> loadTelegramPlugin [

	Metacello new
		onConflictUseLoaded;
		baseline: 'CormasTelegram';
		repository: 'github://cormas/cormas-telegram';
		load.
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
		
	(aBuilder item: #LoadTelegramPlugin)
		parent: #Cormas ;
		label: 'Load Telegram plugin';
		icon: self telegramIcon;
		help: 'Load Telegram plugin';
		action: [ self loadTelegramPlugin ];
		order: 1.
		
	(aBuilder item: #CormasWebsite)
		parent: #Cormas ;
		label: 'Cormas website';
		icon: (self iconNamed: #remote);
		help: 'Open Cormas website in a web browser';
		action: [ WebBrowser openOn: 'https://cormas.org' ];
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
CMModelOpenerPresenter class >> telegramIcon [
	<script: 'self telegramIcon inspect'>

	^ (Form fromBinaryStream: self telegramIconBase64 base64Decoded asByteArray readStream)
		scaledToSize: 20@20
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter class >> telegramIconBase64 [

	^ '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ACx0RVh0ZXhpZjpTb2Z0d2FyZQBBZG9iZSBQaG90b3Nob3AgMjEuMSAoV2luZG93cykwackZAAAAFXRFWHRwaG90b3Nob3A6Q29sb3JNb2RlADNWArNAAAAAEnRFWHR0aWZmOk9yaWVudGF0aW9uADG3q/w7AAAAKHRFWHR4bXA6Q3JlYXRlRGF0ZQAyMDIxLTAyLTAxVDAyOjE2OjM4KzAyOjAws/TExAAAAC50RVh0eG1wOkNyZWF0b3JUb29sAEFkb2JlIFBob3Rvc2hvcCAyMS4xIChXaW5kb3dzKVBDAQcAAAAqdEVYdHhtcDpNZXRhZGF0YURhdGUAMjAyMS0wMi0wMVQwMjoxNjozOCswMjowMDuuq0MAAAAodEVYdHhtcDpNb2RpZnlEYXRlADIwMjEtMDItMDFUMDI6MTY6MzgrMDI6MDAHCvj9AAAAS3RFWHR4bXBNTTpEb2N1bWVudElEAGFkb2JlOmRvY2lkOnBob3Rvc2hvcDo2ODc5ZGQwYy1hMTE5LTNkNDEtYTE5Mi05OWY4ZGE0YmM0MGHRBfCtAAAAPXRFWHR4bXBNTTpJbnN0YW5jZUlEAHhtcC5paWQ6Mjc3ZTk0YzAtNmZlMi0zNjQyLWI1MmMtYzQyZTcyMzYzNGNhaM6nrQAAAEV0RVh0eG1wTU06T3JpZ2luYWxEb2N1bWVudElEAHhtcC5kaWQ6ZmZlN2RlZWMtZjQxNS1hMDQyLWIyNmItMTI3ODk2N2MxM2QyAakZuwAAAABJRU5ErkJggg=='
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
