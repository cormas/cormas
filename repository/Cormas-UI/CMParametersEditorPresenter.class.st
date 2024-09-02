Class {
	#name : 'CMParametersEditorPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'parameters',
		'classTree',
		'parametersTable'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMParametersEditorPresenter class >> example [
	<example>
	
	| translator |
	translator := CMEnglishTranslator new.
	
	(self
		forParameters: CMMockModel parameters
		translator: translator)
		open
]

{ #category : 'as yet unclassified' }
CMParametersEditorPresenter class >> forParameters: aCollectionOfParameters translator: aTranslator [

	^ self on: { aCollectionOfParameters . aTranslator }
]

{ #category : 'initialization' }
CMParametersEditorPresenter >> connectPresenters [

	classTree whenSelectedItemChangedDo: [ :aClass |
		parametersTable items: (parameters select: [ :each | each receiverClass = aClass ]) ]
]

{ #category : 'as yet unclassified' }
CMParametersEditorPresenter >> convertInputType: aString [

	aString ifEmpty: [ ^ nil ].
	
	^ [ aString asNumber ] onErrorDo: [ aString ].
]

{ #category : 'layout' }
CMParametersEditorPresenter >> defaultLayout [ 

	^ SpBoxLayout newTopToBottom
		spacing: 5;
		add: classTree;
		add: parametersTable;
		yourself
]

{ #category : 'initialization' }
CMParametersEditorPresenter >> initializeClassTree [

	| receiverClasses |
	receiverClasses := (parameters collect: #receiverClass) asSet.
	
	classTree := self newTree
		displayIcon: [ :each | self iconNamed: #class ];
		expandAll;
		yourself.

	classTree roots:
		(receiverClasses reject: [ :each |
			receiverClasses includes: each superclass ]).
		
	classTree children: [ :each | each subclasses select: [ :subclass |
			receiverClasses includes: subclass ] ].
]

{ #category : 'initialization' }
CMParametersEditorPresenter >> initializeParametersTable [

	parametersTable := self newTable.
	
	parametersTable addColumn: (SpStringTableColumn
		title: translator tParameter
		evaluated: [ :each | each name ]).
		
	parametersTable addColumn: (SpStringTableColumn new
		title: translator tValue;
		evaluated: [ :each | each value asString ];
		beEditable;
		onTextChanged: [ :parameter :newValue | parameter value: (self convertInputType: newValue) ];
		yourself).
]

{ #category : 'initialization' }
CMParametersEditorPresenter >> initializePresenters [ 

	self initializeClassTree.
	self initializeParametersTable.
	
]

{ #category : 'accessing - model' }
CMParametersEditorPresenter >> setModelBeforeInitialization: aCollection [

	parameters := aCollection first.
	translator := aCollection second.
]
