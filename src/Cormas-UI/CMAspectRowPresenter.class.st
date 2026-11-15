"
I am the row of one class of entities in the Aspects panel: an eye that shows or hides the class, its name, and the aspect it is shown with.

## Responsibility:

- Hide the class, or show it again with the aspect it had.
- Offer the aspects of the class and, under a superclass row, the choice of following that row: ""Energy (as Forager)"".
- Show the current choice again when the panel asks me to.

## Collaborators:

- `CMObserver`: my model, whose perspective I change.
- `CMAspectsPresenter`: creates me and is told when I change a choice.

## Public API and Key Messages

- `entityClass:parentClasses:depth:` sets the class I show.
- `refresh`, `whenChangedDo:`

## Internal Representation

- `parentClasses`: the class of the row above whose choice I can follow, or nothing.
- The items of my drop list are aspect selectors, plus that class.
"
Class {
	#name : 'CMAspectRowPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'observer',
		'entityClass',
		'parentClasses',
		'depth',
		'visibilityCheckBox',
		'nameLabel',
		'aspectDropList',
		'whenChangedBlock'
	],
	#category : 'Cormas-UI-Simulation',
	#package : 'Cormas-UI',
	#tag : 'Simulation'
}

{ #category : 'accessing' }
CMAspectRowPresenter >> aspectDropList [

	^ aspectDropList
]

{ #category : 'choosing' }
CMAspectRowPresenter >> chooseItem: anItem [
	"anItem is a selector of an aspect, or the class of the row above, whose choice is then followed"

	anItem = self currentItem ifTrue: [ ^ self ].
	anItem isSymbol
		ifTrue: [ observer perspective show: entityClass as: anItem ]
		ifFalse: [ observer perspective forget: entityClass ].
	whenChangedBlock value
]

{ #category : 'choosing' }
CMAspectRowPresenter >> chooseVisible: aBoolean [

	aBoolean = (observer perspective isVisible: entityClass) ifTrue: [
		^ self ].
	aBoolean
		ifTrue: [ observer perspective show: entityClass ]
		ifFalse: [ observer perspective hide: entityClass ].
	whenChangedBlock value
]

{ #category : 'choosing' }
CMAspectRowPresenter >> currentItem [
	"Answer the item that shows the aspect of my class: its own, or else the class of the row above it, or else the default aspect"

	(observer perspective hasChoiceFor: entityClass) ifTrue: [
		^ observer perspective aspectFor: entityClass ].
	^ parentClasses
		  ifEmpty: [ #aspectDefault: ]
		  ifNotEmpty: [ parentClasses first ]
]

{ #category : 'accessing' }
CMAspectRowPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  borderWidth: 3;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 4;
				   add: visibilityCheckBox width: 20;
				   add: SpNullPresenter new width: depth * 12;
				   add: nameLabel width: 150 - (depth * 12);
				   add: aspectDropList width: 170;
				   yourself);
		  yourself
]

{ #category : 'accessing' }
CMAspectRowPresenter >> entityClass [

	^ entityClass
]

{ #category : 'initialization' }
CMAspectRowPresenter >> entityClass: aClass parentClasses: aCollection depth: anInteger [
	"Show aClass, indented by anInteger. aCollection holds the class of the row above whose choice it can follow, or nothing"

	entityClass := aClass.
	parentClasses := aCollection.
	depth := anInteger.
	nameLabel label: aClass name.
	aspectDropList items: parentClasses
		, aClass aspectSelectors.
	self refresh.
	visibilityCheckBox whenChangedDo: [ :state |
		self chooseVisible: state ].
	aspectDropList whenSelectedItemChangedDo: [ :item |
		self chooseItem: item ]
]

{ #category : 'initialization' }
CMAspectRowPresenter >> initializePresenters [

	whenChangedBlock := [ ].
	visibilityCheckBox := self newCheckBox
		                      help: 'Show or hide this class';
		                      yourself.
	nameLabel := self newLabel.
	aspectDropList := self newDropList
		                  display: [ :item | self nameOf: item ];
		                  yourself
]

{ #category : 'choosing' }
CMAspectRowPresenter >> nameOf: anItem [

	anItem isSymbol ifTrue: [ ^ CMEntity nameOfAspect: anItem ].
	^ (CMEntity nameOfAspect: (observer perspective aspectFor: anItem))
	  , ' (as ' , anItem name , ')'
]

{ #category : 'choosing' }
CMAspectRowPresenter >> refresh [
	"Show the current choice for my class"

	| shown |
	shown := observer perspective isVisible: entityClass.
	visibilityCheckBox state: shown.
	aspectDropList enabled: shown.
	aspectDropList disableSelectionDuring: [
		aspectDropList selectItem: self currentItem ]
]

{ #category : 'initialization' }
CMAspectRowPresenter >> setModelBeforeInitialization: anObserver [

	observer := anObserver
]

{ #category : 'accessing' }
CMAspectRowPresenter >> visibilityCheckBox [

	^ visibilityCheckBox
]

{ #category : 'initialization' }
CMAspectRowPresenter >> whenChangedDo: aBlock [

	whenChangedBlock := aBlock
]
