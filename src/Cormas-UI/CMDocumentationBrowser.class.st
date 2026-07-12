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
CMDocumentationBrowser >> buildArgumentsStringFrom: aMethodDescription builder: aBuilder [

	| arguments |
	aMethodDescription hasArguments ifFalse: [ ^ self ].
	
	arguments := aMethodDescription arguments.
	
	aBuilder header: [
		aBuilder text: 'Argument'.
		
		arguments size > 1 ifTrue: [ 
			aBuilder text: 's' ]
	] withLevel: 5.

	aBuilder unorderedListDuring: [ 
		arguments do: [ :dict |
			aBuilder item: [
				aBuilder
					bold: [ aBuilder text: (dict at: 'type') ];
					text: ' - ';
					text: (dict at: 'description') ] ] ].
]

{ #category : 'as yet unclassified' }
CMDocumentationBrowser >> buildDocumentationStringFrom: aMethodDescription [

	| builder |
	builder := Microdown builder.
	
	builder header: [ builder text: aMethodDescription method selector asString ] withLevel: 3.
	builder horizontalLine.
	builder paragraph: [ builder text: aMethodDescription documentationString ].
	
	self buildArgumentsStringFrom: aMethodDescription builder: builder.
	self buildReturnInfoStringFrom: aMethodDescription builder: builder.
	self buildExamplesStringFrom: aMethodDescription builder: builder.
	self buildSeeAlsoStringFrom: aMethodDescription builder: builder.
	
	^ builder contents
]

{ #category : 'as yet unclassified' }
CMDocumentationBrowser >> buildExamplesStringFrom: aMethodDescription builder: aBuilder [

	| examples code |
	aMethodDescription hasExamples ifFalse: [ ^ self ].
	
	examples := aMethodDescription examples.
	
	aBuilder header: [
		aBuilder text: 'Example'.
		
		examples size > 1 ifTrue: [ 
			aBuilder text: 's' ]
	] withLevel: 5.

	code := String streamContents: [ :stream |
		examples do: [ :example |
			stream
				<< example
				<< '.'; cr ] ].
		
	aBuilder
		codeblock: code
		firstLineAssociations: { ('language2' -> 'Pharo') }
]

{ #category : 'as yet unclassified' }
CMDocumentationBrowser >> buildReturnInfoStringFrom: aMethodDescription builder: aBuilder [

	| returnInfo |
	aMethodDescription hasReturnInfo ifFalse: [ ^ self ].
	
	returnInfo := aMethodDescription returnInfo.
	
	aBuilder header: [ aBuilder text: 'Return value' ] withLevel: 5.
	
	aBuilder unorderedListDuring: [ 
		aBuilder item: [ 
			aBuilder
				bold: [ aBuilder text: (returnInfo at: 'type') ];
				text: ' - ';
				text: (returnInfo at: 'description') ] ].
]

{ #category : 'as yet unclassified' }
CMDocumentationBrowser >> buildSeeAlsoStringFrom: aMethodDescription builder: aBuilder [

	| link |
	aMethodDescription hasRelatedMethods ifFalse: [ ^ self ].
	
	aBuilder header: [ aBuilder text: 'See also' ] withLevel: 5.
	
	aBuilder unorderedListDuring: [ 
		aMethodDescription relatedMethods do: [ :method |
			link := String streamContents: [ :stream |
				stream << method methodClass name << '>>#' << method selector ].
			
			aBuilder item: [ 
				aBuilder monospace: link ] ] ]
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
