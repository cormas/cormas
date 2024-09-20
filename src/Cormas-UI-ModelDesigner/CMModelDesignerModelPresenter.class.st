Class {
	#name : 'CMModelDesignerModelPresenter',
	#superclass : 'CMModelDesignerClassPresenter',
	#instVars : [
		'initMethodList',
		'controlMethodList',
		'customMethodList',
		'probeList'
	],
	#category : 'Cormas-UI-ModelDesigner',
	#package : 'Cormas-UI-ModelDesigner'
}

{ #category : 'as yet unclassified' }
CMModelDesignerModelPresenter >> availableControlMethods [

	^ aClass availableControlSelectors collect: [ :selector | aClass >> selector ]
]

{ #category : 'as yet unclassified' }
CMModelDesignerModelPresenter >> availableInitMethods [

	^ aClass availableInitSelectors collect: [ :selector | aClass >> selector ]
]

{ #category : 'initialization' }
CMModelDesignerModelPresenter >> connectPresenters [

	super connectPresenters.
	
	initMethodList whenSelectedItemChangedDo: [ :method | self showSourceCode: method ].
	controlMethodList whenSelectedItemChangedDo: [ :method | self showSourceCode: method ].
	customMethodList whenSelectedItemChangedDo: [ :method | self showSourceCode: method ].
	probeList whenSelectedItemChangedDo: [ :probe | self showSourceCode: probe method ]
]

{ #category : 'layout' }
CMModelDesignerModelPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		borderWidth: 5;
		spacing: 10;
		add: (SpBoxLayout newLeftToRight
			spacing: 20;
			add: (SpBoxLayout newLeftToRight
				spacing: 8;
				add: (SpBoxLayout newTopToBottom
					vAlignCenter;
					add: 'Name';
					yourself) expand: false;
				add: nameInput width: 200;
				yourself) width: 250;
			add: (SpBoxLayout newLeftToRight
				spacing: 8;
				add: (SpBoxLayout newTopToBottom
					vAlignCenter;
					add: 'Superclass';
					yourself) expand: false;
				add: superclassDroplist width: 200;
				yourself) width: 300;
			yourself) expand: false;
		add: (SpPanedLayout newTopToBottom
			add: (SpBoxLayout newLeftToRight
				spacing: 5;
				add: parameterList width: 280;
				add: initMethodList;
				add: controlMethodList;
				add: customMethodList;
				add: probeList;
				yourself);
			add: sourceCodeNotebook;
			yourself);
		yourself
]

{ #category : 'examples' }
CMModelDesignerModelPresenter >> example [

	<script: '(self forClass: CMMockModel prefix: ''CMMock'' translator: CMEnglishTranslator new) open'>
]

{ #category : 'initialization' }
CMModelDesignerModelPresenter >> initializePresenters [ 

	super initializePresenters.
	
	initMethodList := self
		instantiate: CMModelDesignerMethodsPresenter
		on: { 'Init methods' . translator }. 
		
	controlMethodList := self
		instantiate: CMModelDesignerMethodsPresenter
		on: { 'Control methods' . translator }.  
		
	customMethodList := self
		instantiate: CMModelDesignerMethodsPresenter
		on: { 'Custom methods' . translator }.  
		
	probeList := (self
		instantiate: CMModelDesignerProbesPresenter
		on: translator)
		items: aClass availableProbes;
		yourself. 
		
	self showInitMethods.
	self showControlMethods.
	self showCustomMethods.
]

{ #category : 'as yet unclassified' }
CMModelDesignerModelPresenter >> showControlMethods [

	controlMethodList items: self availableControlMethods
]

{ #category : 'as yet unclassified' }
CMModelDesignerModelPresenter >> showCustomMethods [

	| initMethods controlMethods probeMethods potentialAccessorNames excludedMethods customMethods |
	
	initMethods := self availableInitMethods.
	controlMethods := self availableControlMethods.
	probeMethods := aClass availableProbes collect: #method.
	
	excludedMethods := initMethods, controlMethods, probeMethods.
	customMethods := aClass methods reject: [ :method | excludedMethods includes: method ].
	
	potentialAccessorNames := (aClass slots, aClass class slots) flatCollect: [ :slot |
		{ slot name asSymbol . (slot name asString, ':') asSymbol } ].
	 
	customMethods := customMethods reject: [ :method |
		potentialAccessorNames includes: method selector ].
	
	customMethods := customMethods reject: [ :method |
		method selector = #initialize ].

	customMethodList items: customMethods 
]

{ #category : 'as yet unclassified' }
CMModelDesignerModelPresenter >> showInitMethods [

	initMethodList items: self availableInitMethods
]
