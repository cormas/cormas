Class {
	#name : 'CMModelOpenerCommand',
	#superclass : 'Object',
	#instVars : [
		'translator',
		'owner'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'as yet unclassified' }
CMModelOpenerCommand class >> forOwner: aPresenter translator: aTranslator [

	^ self new
		initializeWithTranslator: aTranslator;
		owner: aPresenter;
		yourself
]

{ #category : 'accessing' }
CMModelOpenerCommand >> action [

	self subclassResponsibility
]

{ #category : 'accessing' }
CMModelOpenerCommand >> icon [

	self subclassResponsibility
]

{ #category : 'accessing' }
CMModelOpenerCommand >> initializeWithTranslator: aTranslator [

	translator := aTranslator
]

{ #category : 'accessing' }
CMModelOpenerCommand >> name [

	self subclassResponsibility
]

{ #category : 'accessing' }
CMModelOpenerCommand >> owner: aPresenter [

	owner := aPresenter
]
