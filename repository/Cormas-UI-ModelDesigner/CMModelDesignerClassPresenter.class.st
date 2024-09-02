Class {
	#name : 'CMModelDesignerClassPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'aClass',
		'superclassDroplist'
	],
	#category : 'Cormas-UI-ModelDesigner',
	#package : 'Cormas-UI-ModelDesigner'
}

{ #category : 'as yet unclassified' }
CMModelDesignerClassPresenter class >> forClass: aClass translator: aTranslator [

	^ self on: { aClass . aTranslator }
]

{ #category : 'layout' }
CMModelDesignerClassPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: (SpBoxLayout newLeftToRight
			spacing: 10;
			add: (SpBoxLayout newTopToBottom
				vAlignCenter;
				add: 'Superclass';
				yourself) expand: false;
			add: superclassDroplist;
			yourself) expand: false;
			add: '';
			yourself
]

{ #category : 'examples' }
CMModelDesignerClassPresenter >> example [

	<script: '(self forClass: CMMockGoat translator: CMEnglishTranslator new) open'>
]

{ #category : 'initialization' }
CMModelDesignerClassPresenter >> initializePresenters [

	superclassDroplist := self newDropList
		items: { aClass superclass };
		yourself.
]

{ #category : 'accessing - model' }
CMModelDesignerClassPresenter >> setModelBeforeInitialization: aCollection [

	aClass := aCollection first.
	translator := aCollection second
]
