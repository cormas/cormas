Class {
	#name : #CMExampleModelLoaderPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table',
		'openGithubButton',
		'loadButton',
		'updateButton',
		'deleteButton'
	],
	#category : 'Cormas-UI'
}

{ #category : #examples }
CMExampleModelLoaderPresenter class >> example [

	<example>
	self new open
]

{ #category : #examples }
CMExampleModelLoaderPresenter class >> exampleModels [

	^ {
		'ecec-model' -> 'ECECModel' .
		'firefighters-model' -> 'FirefightersModel' .
		'robot-forager-model' -> 'RobotForagerModel' .
		'shelling-model' -> 'ShellingModel' .
		'conway-model' -> 'ConwayModel' ".
		'seir-model' -> 'SEIRModel'"
	}
]

{ #category : #'as yet unclassified' }
CMExampleModelLoaderPresenter class >> githubOrganizationName [

	^ 'cormas'
]

{ #category : #initialization }
CMExampleModelLoaderPresenter >> connectPresenters [

	table whenSelectedItemChangedDo: [ :assoc |
		self updateEnabledButtons ].

	openGithubButton action: [
		WebBrowser openOn: (self githubUrlForModel: table selectedItem key) ].
	
	loadButton action: [ self downloadSelectedModel ].
	updateButton action: [ self updateSelectedModel ].
	deleteButton action: [ self deleteSelectedModel ]
]

{ #category : #layout }
CMExampleModelLoaderPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 3;
		add: table;
		add: (SpBoxLayout newLeftToRight
			spacing: 2;
			add: '';
			add: openGithubButton width: 125;
			add: loadButton expand: false;
			add: updateButton expand: false;
			add: deleteButton expand: false;
			yourself) height: self class buttonHeight;
		yourself
]

{ #category : #'as yet unclassified' }
CMExampleModelLoaderPresenter >> deleteSelectedModel [

	| repo |
	repo := self repositoryForSelectedModel.
	repo unload.
	repo delete.
	self updateEnabledButtons.
	self update
]

{ #category : #'as yet unclassified' }
CMExampleModelLoaderPresenter >> downloadSelectedModel [

	| name baseline |
	
	name := table selectedItem key.
	baseline := table selectedItem value.

	Metacello new
		baseline: baseline;
		repository: (self githubLink: name);
		load.
		
	self updateEnabledButtons.
	self update
]

{ #category : #examples }
CMExampleModelLoaderPresenter >> example [
	
	<script: 'self example'>
]

{ #category : #'as yet unclassified' }
CMExampleModelLoaderPresenter >> githubLink: aString [

	^ String streamContents: [ :stream |
		stream
			<< 'github://'
			<< self class githubOrganizationName
			<< '/'
			<< aString
			<< ':main' ]
]

{ #category : #'as yet unclassified' }
CMExampleModelLoaderPresenter >> githubUrlForModel: aString [

	^ String streamContents: [ :stream |
		stream
			<< 'https://github.com/'
			<< self class githubOrganizationName
			<< '/'
			<< aString ]
]

{ #category : #testing }
CMExampleModelLoaderPresenter >> httpsUrlForModel: aString [

	^ (self githubUrlForModel: aString), '.git'
]

{ #category : #initialization }
CMExampleModelLoaderPresenter >> initializePresenters [

	table := self newTable
		addColumn: (SpStringTableColumn
			title: 'Name'
			evaluated: [ :assoc | assoc key ]);
		addColumn: ((SpImageTableColumn
			title: ''
			evaluated: [ :assoc | self iconNamed: (
				(self isModelLoaded: assoc key)
					ifTrue: [ #testGreen ]
					ifFalse: [ #testRed ]) ])
			width: 20;
			yourself);
		addColumn: (SpStringTableColumn
			title: 'Status'
			evaluated: [ :assoc |
				(self isModelLoaded: assoc key)
					ifTrue: [ 'Loaded' ]
					ifFalse: [ 'Not loaded' ] ]);
		items: self class exampleModels;
		yourself.
		
	openGithubButton := self newButton
		label: 'Open on GitHub';
		icon: (self iconNamed: #github);
		yourself.
	
	loadButton := self newButton
		label: 'Download';
		icon: (self iconNamed: #smallLoadProject);
		yourself.
		
	updateButton := self newButton
		label: 'Update';
		icon: (self iconNamed: #smallUpdate);
		yourself.
		
	deleteButton := self newButton
		label: 'Delete';
		icon: (self iconNamed: #smallDelete);
		yourself.
		
	self updateEnabledButtons.
]

{ #category : #initialization }
CMExampleModelLoaderPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Example Models';
		initialExtent: 600@450.
]

{ #category : #testing }
CMExampleModelLoaderPresenter >> isModelLoaded: aString [

	self repositoryForModel: aString ifNotFound: [ ^ false ].
	^ true
]

{ #category : #testing }
CMExampleModelLoaderPresenter >> repositoryForModel: aString ifNotFound: aBlock [

	^ IceRepository registry
		detect: [ :repo | repo remotes anySatisfy: [ :remote |
				{ self httpsUrlForModel: aString . self sshUrlForModel: aString } includes: remote url ] ]
		ifNone: aBlock
]

{ #category : #testing }
CMExampleModelLoaderPresenter >> repositoryForSelectedModel [

	| name |
	name := table selectedItem key.

	^ self repositoryForModel: name ifNotFound: [ 
		self error: 'Repository for ', name, ' was not found!' ]
]

{ #category : #testing }
CMExampleModelLoaderPresenter >> sshUrlForModel: aString [

	^ String streamContents: [ :stream |
		stream
			<< 'git@github.com:'
			<< self class githubOrganizationName
			<< '/'
			<< aString
			<< '.git' ]
]

{ #category : #'as yet unclassified' }
CMExampleModelLoaderPresenter >> updateEnabledButtons [

	table selectedItem ifNil: [ ^ self ].

	(self isModelLoaded: table selectedItem key)
		ifTrue: [ 
			loadButton disable.
			updateButton enable .
			deleteButton enable ]
		ifFalse: [ 
			loadButton enable.
			updateButton disable .
			deleteButton disable ]
]

{ #category : #'as yet unclassified' }
CMExampleModelLoaderPresenter >> updateSelectedModel [

	| repo branch remote |
	repo := self repositoryForSelectedModel.
	branch := repo branch.
	
	remote := repo remotes
		detect: [ :each | each url = (self sshUrlForModel: table selectedItem key) ]
		ifNone: [ repo remotes
			detect: [ :each | each url = (self httpsUrlForModel: table selectedItem key) ]
			ifNone: [ self error: 'Could not find the remote' ] ].
		
	branch pullFrom: remote
]
