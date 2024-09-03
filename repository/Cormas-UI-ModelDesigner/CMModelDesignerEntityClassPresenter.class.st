Class {
	#name : 'CMModelDesignerEntityClassPresenter',
	#superclass : 'CMModelDesignerClassPresenter',
	#instVars : [
		'variableList',
		'methodList'
	],
	#category : 'Cormas-UI-ModelDesigner',
	#package : 'Cormas-UI-ModelDesigner'
}

{ #category : 'initialization' }
CMModelDesignerEntityClassPresenter >> connectPresenters [

	super connectPresenters.

	methodList whenMethodSelectedDo: [ :method |
		self showSourceCode: method ]
]

{ #category : 'layout' }
CMModelDesignerEntityClassPresenter >> defaultLayout [

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
				add: variableList width: 250;
				add: methodList;
				yourself);
			add: sourceCodeNotebook;
			yourself);
		yourself
]

{ #category : 'examples' }
CMModelDesignerEntityClassPresenter >> example [

	<script: '(self forClass: CMMockGoat prefix: ''CMMock'' translator: CMEnglishTranslator new) open'>
]

{ #category : 'initialization' }
CMModelDesignerEntityClassPresenter >> initializePresenters [

	super initializePresenters.
		
	variableList := self
		instantiate: CMModelDesignerParametersPresenter
		on: { aClass . translator }.
		
	methodList := self
		instantiate: CMModelDesignerMethodsPresenter
		on: { 'Custom methods' . translator }.
		
	methodList methods: (aClass methods reject: #isFromTrait)
]
