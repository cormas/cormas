Class {
	#name : 'CMDocumentationBrowser',
	#superclass : 'SpPresenter',
	#instVars : [
		'classesDroplist',
		'protocolDropList',
		'methodsList',
		'notebook',
		'documentation',
		'sourceCode',
		'senders'
	],
	#category : 'Cormas-UI-Documentation',
	#package : 'Cormas-UI',
	#tag : 'Documentation'
}

{ #category : 'examples' }
CMDocumentationBrowser class >> example [
	<example>
	^ self new open
]

{ #category : 'as yet unclassified' }
CMDocumentationBrowser >> buildArgumentsStringFrom: aMethodDescription [

	| arguments |
	aMethodDescription hasArguments ifFalse: [ ^ '' ].
	
	arguments := aMethodDescription arguments.
	
	^ String streamContents: [ :stream |
		stream << '##### Argument'.
		
		arguments size > 1
			ifTrue: [ stream << 's' ].
			
		stream cr.
		
		arguments do: [ :dict |
			stream
				<< '- **';
				<< (dict at: 'type');
				<< '** — ';
				<< (dict at: 'description'); cr ] ]
]

{ #category : 'as yet unclassified' }
CMDocumentationBrowser >> buildDocumentationStringFrom: aMethodDescription [
	
	^ String streamContents: [ :stream |
		stream
			<< '### '
			<< aMethodDescription method selector; cr;
			<< '***'; cr; << ' '; cr;
			<< aMethodDescription documentationString;
			<< ' ';
			cr; cr;
			<< (self buildArgumentsStringFrom: aMethodDescription); cr;
			<< (self buildReturnInfoStringFrom: aMethodDescription); cr;
			<< (self buildExamplesStringFrom: aMethodDescription); cr;
			<< (self buildSeeAlsoStringFrom: aMethodDescription) ]
]

{ #category : 'as yet unclassified' }
CMDocumentationBrowser >> buildExamplesStringFrom: aMethodDescription [

	| examples |
	aMethodDescription hasExamples ifFalse: [ ^ '' ].
	
	examples := aMethodDescription examples.
	
	^ String streamContents: [ :stream |
		stream << '##### Example'.
		
		examples size > 1
			ifTrue: [ stream << 's' ].
			
		stream cr.
		stream << '```'; cr.
		
		examples do: [ :example |
			stream
				<< example
				<< '.'; cr ].
			
		stream << '```' ]
]

{ #category : 'as yet unclassified' }
CMDocumentationBrowser >> buildReturnInfoStringFrom: aMethodDescription [

	aMethodDescription hasReturnInfo ifFalse: [ ^ '' ].
	
	^ String streamContents: [ :stream |
		stream
			<< '##### Return value'; cr;
			<< '- **';
			<< (aMethodDescription returnInfo at: 'type');
			<< '** — ';
			<< (aMethodDescription returnInfo at: 'description'); cr ]
]

{ #category : 'as yet unclassified' }
CMDocumentationBrowser >> buildSeeAlsoStringFrom: aMethodDescription [

	aMethodDescription hasRelatedMethods ifFalse: [ ^ '' ].
	
	^ String streamContents: [ :stream |
		stream << '##### See also'; cr.
		
		aMethodDescription relatedMethods do: [ :method |
			stream
				<< '- '
				<< '`' << method methodClass name << '>>#' << method selector << '`';
				cr ] ]
]

{ #category : 'initialization' }
CMDocumentationBrowser >> connectPresenters [

	classesDroplist whenSelectedItemChangedDo: [ :aClass |
		self showProtocolsOfClass: aClass ].
	
	protocolDropList whenSelectedItemChangedDo: [ :aProtocol |
		aProtocol ifNotNil: [
			protocolDropList isPlaceholderSelected
				ifTrue: [ self showAllMethodsOfClass: classesDroplist selectedItem ]
				ifFalse: [ self showMethodsOfProtocol: aProtocol ] ] ].
	
	methodsList whenSelectionChangedDo: [ :selection |
		| method |
		method := selection selectedItem.
		method ifNotNil: [ self showMethod: method ] ].
	
	classesDroplist selectItem: classesDroplist items first.
	
	methodsList items ifNotEmpty: [ 
		methodsList selectItem: methodsList items first ].
]

{ #category : 'layout' }
CMDocumentationBrowser >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		borderWidth: 4;
		spacing: 5;
		add: (SpBoxLayout newTopToBottom
			spacing: 10;
			add: (SpBoxLayout newTopToBottom
				add: 'Select a class' expand: false;
				add: classesDroplist expand: false;
				yourself) expand: false;
			add: (SpBoxLayout newTopToBottom
				add: 'Protocol' expand: false;
				add: protocolDropList expand: false;
				yourself) expand: false;
			add: (SpBoxLayout newTopToBottom
				add: 'Public methods' expand: false;
				add: methodsList;
				yourself);
			yourself) width: 250;
		add: notebook;
		yourself
]

{ #category : 'as yet unclassified' }
CMDocumentationBrowser >> documentedClasses [

	^ { CMModel . CMCell . CMAgent . CMSpatialEntityAggregate }
]

{ #category : 'examples' }
CMDocumentationBrowser >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMDocumentationBrowser >> initializePresenters [

	classesDroplist := self newDropList
		items: self documentedClasses;
		displayIcon: [ :each | self iconNamed: #class ];
		yourself.
		
	protocolDropList := (self instantiate: CMDropListWithPlaceholderPresenter)
		display: [ :protocol | protocol name ];
		placeholder: 'all methods' respondingTo: #name;
		yourself.
		
	methodsList := self newFilteringList
		display: [ :each | each selector ];
		displayIcon: [ :each | self iconNamed: #help ];
		yourself.
		
	sourceCode := self newCode
		beNotEditable;
		yourself.
		
	documentation := self instantiate: MicrodownPresenter.
		
	notebook := self newNotebook
		addPage: (SpNotebookPage title: 'Documentation' provider: [ documentation ]);
		addPage: (SpNotebookPage title: 'Source Code' provider: [ sourceCode ]);
		yourself
]

{ #category : 'initialization' }
CMDocumentationBrowser >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Cormas Method Documentation';
		initialExtent: 900@600.
]

{ #category : 'tool controlling' }
CMDocumentationBrowser >> showAllMethodsOfClass: aClass [
	
	methodsList items: aClass publicMethods
]

{ #category : 'tool controlling' }
CMDocumentationBrowser >> showMethod: aMethod [

	| methodDescription |
	methodDescription := CMMethodDescription for: aMethod.

	sourceCode beForMethod: aMethod.
	sourceCode text: methodDescription sourceCode.
	
	documentation documentFromString: (self buildDocumentationStringFrom: methodDescription)
]

{ #category : 'tool controlling' }
CMDocumentationBrowser >> showMethodsOfProtocol: aProtocol [

	| methods |
	methods := classesDroplist selectedItem publicMethods.
	
	methods := methods select: [ :m |
		m protocol name = aProtocol name ].
	
	methodsList items: methods
]

{ #category : 'tool controlling' }
CMDocumentationBrowser >> showProtocolsOfClass: aClass [

	| methods protocols |
	methods := aClass publicMethods.
	
	protocols := (methods collect: #protocol) asSet asOrderedCollection
		sorted: [ :a :b | a name < b name ].
		
	protocolDropList items: protocols.
	
	methodsList items: methods
]
