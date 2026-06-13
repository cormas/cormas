Trait {
	#name : 'TCMCommand',
	#instVars : [
		'owner'
	],
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'as yet unclassified' }
TCMCommand classSide >> forOwner: aPresenter [

	^ self new
		initializeWithOwner: aPresenter;
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

{ #category : 'action' }
TCMCommand >> action [

	self subclassResponsibility
]

{ #category : 'accessing' }
TCMCommand >> icon [

	self subclassResponsibility
]

{ #category : 'initialization' }
TCMCommand >> initializeWithOwner: aPresenter [

	owner := aPresenter
]

{ #category : 'testing' }
TCMCommand >> isAvailable [
	"Override to provide the condition for an action to be available"
	^ true
]

{ #category : 'accessing' }
TCMCommand >> name [

	self subclassResponsibility
]

{ #category : 'accessing' }
TCMCommand >> owner: aPresenter [

	owner := aPresenter
]
