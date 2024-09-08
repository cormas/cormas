Trait {
	#name : 'TCMCommand',
	#instVars : [
		'translator',
		'owner',
		'button'
	],
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'as yet unclassified' }
TCMCommand classSide >> forOwner: aPresenter translator: aTranslator [

	^ self new
		initializeWithTranslator: aTranslator
		owner: aPresenter;
		yourself
]

{ #category : 'accessing' }
TCMCommand classSide >> order [

	"Return a number that will be used for sorting"
	^ 10000
]

{ #category : 'as yet unclassified' }
TCMCommand classSide >> sortedSubclasses [

	<script: 'self sortedSubclasses inspect'>
	
	^ (self allSubclasses
		reject: [ :each | each hasAbstractMethods ])
		sorted: [ :a :b | a order < b order ]
]

{ #category : 'accessing' }
TCMCommand >> action [

	self subclassResponsibility
]

{ #category : 'converting' }
TCMCommand >> button [

	^ button
]

{ #category : 'as yet unclassified' }
TCMCommand >> buttonClass [

	^ SpToolbarButtonPresenter
]

{ #category : 'initialization' }
TCMCommand >> createButton [

	button := (owner instantiate: self buttonClass)
		label: self name;
		icon: self icon;
		action: [ self action ];
		yourself
]

{ #category : 'accessing' }
TCMCommand >> icon [

	self subclassResponsibility
]

{ #category : 'initialization' }
TCMCommand >> initializeWithTranslator: aTranslator owner: aPresenter [

	translator := aTranslator.
	owner := aPresenter.
	
	self createButton
]

{ #category : 'accessing' }
TCMCommand >> name [

	self subclassResponsibility
]

{ #category : 'accessing' }
TCMCommand >> owner: aPresenter [

	owner := aPresenter
]
