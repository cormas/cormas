Class {
	#name : 'CMNewModelPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'nameInput',
		'modelClassNameInput',
		'prefixInput',
		'statusLabel',
		'descriptionText',
		'generateTestsCheckbox',
		'generateBaselineCheckbox',
		'packageClassTree',
		'createButton',
		'cancelButton',
		'modelCreatedBlock',
		'generator'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'as yet unclassified' }
CMNewModelPresenter class >> example [
	<example>
	(self forTranslator: CMEnglishTranslator new) open
]

{ #category : 'as yet unclassified' }
CMNewModelPresenter class >> forTranslator: aTranslator [

	^ self on: aTranslator
]

{ #category : 'initialization' }
CMNewModelPresenter >> connectPresenters [

	nameInput whenTextChangedDo: [ self onModelNameChanged ].
	modelClassNameInput whenTextChangedDo: [ self onModelClassNameChanged ].
	prefixInput whenTextChangedDo: [ self onPrefixChanged ].
	
	generateTestsCheckbox whenChangedDo: [ 
		generator shouldGenerateTestPackage: generateTestsCheckbox state.
		self updatePackageClassTree ].
	
	generateBaselineCheckbox whenChangedDo: [
		generator shouldGenerateBaseline: generateBaselineCheckbox state.
		self updatePackageClassTree ].
	
	cancelButton action: [ self window close ].
	
	createButton action: [
		[ self createModel ] onErrorDo: [ :error | self alert: error messageText ] ].
]

{ #category : 'as yet unclassified' }
CMNewModelPresenter >> createModel [

	| modelClass |
	generator generate.
	modelClass := generator modelClassName asClassInEnvironment: self class environment.
	
	modelCreatedBlock value: modelClass.
	self window close
]

{ #category : 'layout' }
CMNewModelPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 6;
		borderWidth: 2;
		add: (SpBoxLayout newTopToBottom
			spacing: 2;
			add: (SpBoxLayout newLeftToRight
				vAlignCenter;
				add: 'Model name' width: 120;
				add: nameInput;
				yourself) expand: false;
			add: (SpBoxLayout newLeftToRight
				vAlignCenter;
				add: 'Model class name' width: 120;
				add: modelClassNameInput;
				yourself) expand: false;
			add: (SpBoxLayout newLeftToRight
				vAlignCenter;
				add: translator tClassPrefix width: 120;
				add: prefixInput;
				yourself) expand: false;
			add: '' expand: false;
			yourself) expand: false;
		add: (SpBoxLayout newTopToBottom
			add: translator tDescription expand: false;
			add: descriptionText;
			yourself);
		add: (SpBoxLayout newTopToBottom
			add: generateTestsCheckbox;
			add: generateBaselineCheckbox;
			yourself) expand: false;
		add: (SpBoxLayout newTopToBottom
			spacing: 3;
			add: translator tPackagesClassesToCreate expand: false;
			add: packageClassTree height: 150;
			yourself) expand: false;
		add: (SpBoxLayout newLeftToRight
			spacing: 3;
			vAlignCenter;
			add: statusLabel;
			add: cancelButton width: self class buttonWidth;
			add: createButton width: self class buttonWidth;
			yourself) expand: false;
		yourself.
]

{ #category : 'examples' }
CMNewModelPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMNewModelPresenter >> initializePresenters [

	generator := CMModelGenerator new.
	modelCreatedBlock := [ :modelClass | "do nothing" ].

	nameInput := self newTextInput.
	modelClassNameInput := self newTextInput.
	prefixInput := self newTextInput.
	
	statusLabel := self newLabel
		displayColor: [ Color red ];
		yourself.
	
	descriptionText := self newText
		placeholder: 'Write a short description of your model';
		yourself.
	
	packageClassTree := self newTreeTable.
	
	packageClassTree
		hideColumnHeaders;
		addColumn: (SpCompositeTableColumn new
			addColumn: (SpImageTableColumn new
				width: 20;
				evaluated: [ :dict |
					self iconNamed: ((dict includesKey: 'classes')
						ifTrue: [ #package ]
						ifFalse: [ #class ]) ];
				yourself);
			addColumn: (SpStringTableColumn new
				evaluated: [ :dict | dict at: 'name' ];
				yourself);
			yourself);
		children: [ :dict | dict at: 'classes' ifAbsent: [ OrderedCollection new ] ].
	
	generateTestsCheckbox := self newCheckBox
		label: translator tCreateTestPackage;
		state: generator shouldGenerateTestPackage;
		yourself.
		
	generateBaselineCheckbox := self newCheckBox
		label: translator tCreateBaseline;
		state: generator shouldGenerateBaseline;
		yourself.
	
	createButton := self newButton
		label: translator tCreate;
		icon: (self iconNamed: #accept);
		disable;
		yourself.
		
	cancelButton := self newButton
		label: translator tCancel;
		icon: (self iconNamed: #cancel);
		yourself.
]

{ #category : 'initialization' }
CMNewModelPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'New Model';
		initialExtent: 400@600.
]

{ #category : 'as yet unclassified' }
CMNewModelPresenter >> onError: anError [

	statusLabel label: anError messageText.
	createButton disable.
	packageClassTree roots: OrderedCollection new
]

{ #category : 'as yet unclassified' }
CMNewModelPresenter >> onModelClassNameChanged [

	| cursorIndex |
	[ generator modelClassName: modelClassNameInput text ] onErrorDo: [ :e | self onError: e ].

	cursorIndex := modelClassNameInput cursorPositionIndex.
	self updateNamesFromGenerator.
	
	modelClassNameInput takeKeyboardFocus.
	modelClassNameInput cursorPositionIndex: cursorIndex
]

{ #category : 'as yet unclassified' }
CMNewModelPresenter >> onModelNameChanged [

	| cursorIndex |
	[ generator modelName: nameInput text ] onErrorDo: [ :e | self onError: e ].
	
	cursorIndex := nameInput cursorPositionIndex.
	self updateNamesFromGenerator.
	
	nameInput takeKeyboardFocus.
	nameInput cursorPositionIndex: cursorIndex
]

{ #category : 'as yet unclassified' }
CMNewModelPresenter >> onPrefixChanged [

	| cursorIndex |
	[ generator prefix: prefixInput text ] onErrorDo: [ :e | self onError: e ].
	
	cursorIndex := prefixInput cursorPositionIndex.
	self updateNamesFromGenerator.
	
	prefixInput takeKeyboardFocus.
	prefixInput cursorPositionIndex: cursorIndex
]

{ #category : 'accessing - model' }
CMNewModelPresenter >> setModelBeforeInitialization: aTranslator [

	translator := aTranslator
]

{ #category : 'as yet unclassified' }
CMNewModelPresenter >> updateNamesFromGenerator [

	"Update input values without announching the text changed"
	nameInput property: #text rawValue: generator modelName.
	modelClassNameInput property: #text rawValue: generator modelClassName.
	prefixInput property: #text rawValue: generator prefix.
	
	self update.
	self updatePackageClassTree
]

{ #category : 'as yet unclassified' }
CMNewModelPresenter >> updatePackageClassTree [

	| items |
	
	generator modelPackageName ifEmpty: [ 
		packageClassTree roots: #().
		^ self ].
	
	items := OrderedCollection with: {
		'name' -> generator modelPackageName .
		'classes' -> { { 'name' -> generator modelClassName } asDictionary } 
	} asDictionary.
		
	generator shouldGenerateTestPackage ifTrue: [
		items add: { 
			'name' -> generator testPackageName .
			'classes' -> { { 'name' -> generator testClassName } asDictionary }
		} asDictionary ].
	
	generator shouldGenerateBaseline ifTrue: [ 
		items add: { 
			'name' -> generator baselinePackageName .
			'classes' -> { { 'name' -> generator baselineClassName } asDictionary }
		} asDictionary ].
	
	packageClassTree roots: items.
	packageClassTree expandAll
]

{ #category : 'enumerating' }
CMNewModelPresenter >> whenModelCreatedDo: aBlock [

	modelCreatedBlock := aBlock
]
