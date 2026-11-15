"
I am the Aspects panel of one view of the space, shown in a popover under the Aspects button of the view: I let a user choose how each class of entities appears in that view, and nowhere else.

## Responsibility:

- Show one `CMAspectRowPresenter` per class that can be chosen for, in drawing order: what is drawn on top is listed first, with subclasses indented under their superclass.
- Rebuild my rows when my observer gets another perspective, and show choices made elsewhere.
- Tell my view when a choice changes in one of my rows.

## Collaborators:

- `CMObserver`: my model; its perspective holds the choices.
- `CMAspectRowPresenter`: the row of one class.
- `CMSpacePresenter`: my view, which chooses the perspective and opens me.

## Public API and Key Messages

- `whenChangedDo:`
- `updateRows` after the perspective changed, `refresh` after another change.
- `rows`

```
CMAspectsPresenter newApplication: anApplication model: anObserver
```

## Internal Representation

- `rows`: the row presenters, also shown by `rowList`.

### Implementation Points

- A class gets a row if it can be drawn and is not a subclass of another class of the model, or defines aspects of its own, or has a choice of its own. Other subclasses follow the row of their superclass.
- A popover takes the minimum size of its content, which a component list does not have, so my size is given by my layout, rebuilt with my rows.
"
Class {
	#name : 'CMAspectsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'observer',
		'rowList',
		'rows',
		'whenChangedBlock'
	],
	#category : 'Cormas-UI-Simulation',
	#package : 'Cormas-UI',
	#tag : 'Simulation'
}

{ #category : 'private' }
CMAspectsPresenter >> addRowsOf: aClass depth: anInteger among: rowClasses to: aCollection [

	aCollection add:
		((self instantiate: CMAspectRowPresenter on: observer)
			 entityClass: aClass
			 parentClasses: (self parentsOf: aClass among: rowClasses)
			 depth: anInteger;
			 whenChangedDo: [ self choicesChanged ];
			 yourself).
	((rowClasses select: [ :each |
		  (self parentsOf: each among: rowClasses) = { aClass } ]) sorted: [
		 :a
		 :b | a name < b name ]) do: [ :each |
			self
				addRowsOf: each
				depth: anInteger + 1
				among: rowClasses
				to: aCollection ]
]

{ #category : 'private' }
CMAspectsPresenter >> addRowsTo: aCollection [
	"Add the rows in drawing order, what is drawn on top first, with subclasses under their superclass"

	| rowClasses |
	rowClasses := self rowClasses.
	{
		CMAgentLook.
		CMNetworkLook.
		CMLinkLook.
		CMAggregateLook.
		CMCellLook } do: [ :lookClass |
			((rowClasses select: [ :each |
					  (each lookClass includesBehavior: lookClass) and: [
						  (self parentsOf: each among: rowClasses) isEmpty ] ]) sorted: [
				 :a
				 :b | a name < b name ]) do: [ :each |
					self
						addRowsOf: each
						depth: 0
						among: rowClasses
						to: aCollection ] ]
]

{ #category : 'choosing' }
CMAspectsPresenter >> choicesChanged [

	self refresh.
	whenChangedBlock value
]

{ #category : 'private' }
CMAspectsPresenter >> cormasModel [

	^ self application cormasModel
]

{ #category : 'accessing' }
CMAspectsPresenter >> defaultLayout [
	"A popover takes the minimum size of its content, which a component list does not have, so my size is given"

	^ SpBoxLayout newTopToBottom
		  borderWidth: 5;
		  add: (SpBoxLayout newLeftToRight
				   add: rowList width: 370;
				   yourself)
		  height: (rows size * 34 min: 480);
		  yourself
]

{ #category : 'initialization' }
CMAspectsPresenter >> initializePresenters [

	whenChangedBlock := [ ].
	rowList := self newComponentList.
	self updateRows
]

{ #category : 'private' }
CMAspectsPresenter >> parentsOf: aClass among: rowClasses [
	"Answer the nearest superclass of aClass that has a row, or nothing"

	^ aClass allSuperclasses
		  detect: [ :each | rowClasses includes: each ]
		  ifFound: [ :each | { each } ]
		  ifNone: [ #(  ) ]
]

{ #category : 'choosing' }
CMAspectsPresenter >> refresh [
	"Show the current choices of my observer, which may have been changed elsewhere"

	rows do: [ :each | each refresh ]
]

{ #category : 'private' }
CMAspectsPresenter >> rowClasses [
	"Answer the classes of the model that can be drawn, and that are not a subclass of another one, or that define aspects of their own, or have a choice of their own, such as being hidden"

	| classes |
	classes := self cormasModel class allEntityClasses select: [ :each |
		           (each class lookupSelector: #lookClass) isAbstract not ].
	^ classes select: [ :each |
			  (classes includes: each superclass) not or: [
					  (Pragma allNamed: #aspect in: each) notEmpty or: [
						  observer perspective isChosenFor: each ] ] ]
]

{ #category : 'accessing' }
CMAspectsPresenter >> rows [

	^ rows
]

{ #category : 'initialization' }
CMAspectsPresenter >> setModelBeforeInitialization: anObserver [

	observer := anObserver
]

{ #category : 'choosing' }
CMAspectsPresenter >> updateRows [
	"Show a row for each class that the perspective of my observer can choose for. Called again when the observer gets another perspective. My height follows the number of rows, because a popover cannot compute it"

	rows := OrderedCollection new.
	self addRowsTo: rows.
	rowList presenters: rows.
	self layout: self defaultLayout
]

{ #category : 'initialization' }
CMAspectsPresenter >> whenChangedDo: aBlock [
	"Run aBlock after a choice was changed in one of my rows"

	whenChangedBlock := aBlock
]
