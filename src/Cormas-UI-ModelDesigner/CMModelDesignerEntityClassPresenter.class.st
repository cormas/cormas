Class {
	#name : 'CMModelDesignerEntityClassPresenter',
	#superclass : 'CMModelDesignerClassPresenter',
	#instVars : [
		'variableList',
		'customMethodsList',
		'povList'
	],
	#category : 'Cormas-UI-ModelDesigner',
	#package : 'Cormas-UI-ModelDesigner'
}

{ #category : 'initialization' }
CMModelDesignerEntityClassPresenter >> connectPresenters [

	super connectPresenters.

	customMethodsList whenSelectedItemChangedDo: [ :method |
		method ifNotNil: [
			variableList unselectAll.
			povList unselectAll.
			self showSourceCode: method ] ].
	
	povList whenSelectedItemChangedDo: [ :method |
		method ifNotNil: [
			variableList unselectAll.
			customMethodsList unselectAll.
			self showSourceCode: method ] ]
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
				add: customMethodsList;
				add: povList;
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

	| povMethods |
	super initializePresenters.
		
	variableList := self
		instantiate: CMModelDesignerParametersPresenter
		on: { 'Variables' . aClass . translator }.
		
	customMethodsList := self
		instantiate: CMModelDesignerMethodsPresenter
		on: { 'Custom methods' . translator }.
	
	povList := self
		instantiate: CMModelDesignerMethodsPresenter
		on: { 'Points of View' . translator }.
		
	povMethods := aClass availablePov
		select: [ :selector | aClass includesSelector: selector ]
		thenCollect: [ :selector | aClass >> selector ].
		
	customMethodsList items: (
		(aClass methods
			reject: #isFromTrait)
			reject: [ :method | povMethods includes: method ]).
		
	povList items: povMethods.
]
