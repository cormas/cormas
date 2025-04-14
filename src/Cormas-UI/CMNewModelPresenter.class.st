Class {
	#name : #CMNewModelPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'translator',
		'modelTemplate',
		'nameInput',
		'prefixInput',
		'statusLabel',
		'descriptionText',
		'generateTestsCheckbox',
		'packageClassTree',
		'createButton',
		'cancelButton'
	],
	#category : 'Cormas-UI'
}

{ #category : #'as yet unclassified' }
CMNewModelPresenter class >> example [
	<example>
	(self forTranslator: CMEnglishTranslator new) open
]

{ #category : #'as yet unclassified' }
CMNewModelPresenter class >> forTranslator: aTranslator [

	^ self on: aTranslator
]

{ #category : #initialization }
CMNewModelPresenter >> connectPresenters [

	nameInput whenTextChangedDo: [ self updatePrefix ].
	prefixInput whenTextChangedDo: [ self updateTemplate ].
	generateTestsCheckbox whenChangedDo: [ self updateTemplate ].
	
	cancelButton action: [ self window close ].
	
	createButton action: [ 
		[ 
			modelTemplate generate.
			(modelTemplate modelClassName asClassInEnvironment: self class environment) browse.
			self window close
		] onErrorDo: [ :error | self alert: error messageText ] ].
]

{ #category : #layout }
CMNewModelPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 6;
		borderWidth: 2;
		add: (SpBoxLayout newLeftToRight
			spacing: 15;
			add: (SpBoxLayout newLeftToRight
				vAlignCenter;
				add: translator tName, ' *' width: 50;
				add: nameInput;
				yourself);
			add: (SpBoxLayout newLeftToRight
				vAlignCenter;
				add: translator tPrefix, ' *' width: 50;
				add: prefixInput;
				yourself);
			yourself) expand: false;
		add: (SpBoxLayout newTopToBottom
			add: translator tDescription expand: false;
			add: descriptionText;
			yourself);
		add: generateTestsCheckbox expand: false;
		add: (SpBoxLayout newTopToBottom
			spacing: 3;
			add: translator tPackagesClassesToCreate expand: false;
			add: packageClassTree height: 100;
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

{ #category : #examples }
CMNewModelPresenter >> example [
	<script: 'self example'>
]

{ #category : #initialization }
CMNewModelPresenter >> initializePresenters [

	nameInput := self newTextInput.
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
		state: modelTemplate shouldGenerateTestPackage;
		yourself.
	
	createButton := self newButton
		label: translator tCreate;
		disable;
		yourself.
		
	cancelButton := self newButton
		label: translator tCancel;
		yourself.
]

{ #category : #initialization }
CMNewModelPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'New Model';
		initialExtent: 475@450.
]

{ #category : #'as yet unclassified' }
CMNewModelPresenter >> prefixFromModelName: aString [

	| name capitalLetters |
	
	name := aString asCamelCase select: [ :char | char isAlphaNumeric ].
	
	capitalLetters := name select: [ :char | char isUppercase ].
	capitalLetters size > 1 ifTrue: [ ^ capitalLetters ].
	
	^ name first: (3 min: name size)
]

{ #category : #'accessing - model' }
CMNewModelPresenter >> setModelBeforeInitialization: aTranslator [

	translator := aTranslator.
	modelTemplate := CMModelTemplate new
]

{ #category : #'as yet unclassified' }
CMNewModelPresenter >> updatePackageClassTree [

	| items |
	
	items := OrderedCollection with: {
		'name' -> modelTemplate modelPackageName .
		'classes' -> { { 'name' -> modelTemplate modelClassName } asDictionary } 
	} asDictionary.
		
	modelTemplate shouldGenerateTestPackage ifTrue: [
		items add: { 
			'name' -> modelTemplate testPackageName .
			'classes' -> { { 'name' -> modelTemplate testClassName } asDictionary }
		} asDictionary ].
	
	packageClassTree roots: items.
	packageClassTree expandAll
]

{ #category : #'as yet unclassified' }
CMNewModelPresenter >> updatePrefix [

	prefixInput text: (self prefixFromModelName: nameInput text asCamelCase)
]

{ #category : #'as yet unclassified' }
CMNewModelPresenter >> updateTemplate [

	modelTemplate clearNameAndPrefix.
	modelTemplate shouldGenerateTestPackage: generateTestsCheckbox state.

	[
		modelTemplate name: nameInput text asCamelCase.
		modelTemplate prefix: prefixInput text asCamelCase.
		
		statusLabel label: ''.
		createButton enable.
		self updatePackageClassTree.
	] onErrorDo: [ :error |
		statusLabel label: error messageText.
		createButton disable.
		packageClassTree roots: OrderedCollection new ]
]
