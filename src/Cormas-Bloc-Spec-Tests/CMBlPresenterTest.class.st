"
I check that Bloc views appear correctly in Spec windows, by reading the pixels shown on screen.

## Responsibility:

- Check what a view's presenter shows when opened, embedded, or used as an inspector tab.
- Check that `update` reaches the screen.
- Close every window I open.

## Collaborators: 

- `CMBlElement`: answers the presenters I open.
- `CMBlTestSpacePresenter`: embeds the view as Cormas UI would.

### Implementation Points

I open real windows, so I need a running UI process. My tests wait for it if it is blocked.
"
Class {
	#name : 'CMBlPresenterTest',
	#superclass : 'CMBlTestCase',
	#instVars : [
		'window'
	],
	#category : 'Cormas-Bloc-Spec-Tests',
	#package : 'Cormas-Bloc-Spec-Tests'
}

{ #category : 'private' }
CMBlPresenterTest >> open: aPresenter [

	window := aPresenter open.
	^ aPresenter
]

{ #category : 'private' }
CMBlPresenterTest >> openInspectorViewOf: anEntity [

	| context |
	context := anEntity inspectionContexts detect: [ :each |
		           each title = 'View' ].
	^ self open: (context basicNewInspectionPresenter:
			   (context newPresenterBuilderOnApplication: SpApplication new))
]

{ #category : 'private' }
CMBlPresenterTest >> screenColorIn: aPresenter at: aPoint [
	"Answer the color shown at aPoint of the space embedded in aPresenter, once it has been drawn"

	aPresenter space settle.
	^ (aPresenter space host containerMorph submorphs first form
		   colorAt: aPoint) asHexString
]

{ #category : 'running' }
CMBlPresenterTest >> tearDown [

	window ifNotNil: [ window close ].
	super tearDown
]

{ #category : 'tests' }
CMBlPresenterTest >> testComparisonStepsTheBlocView [
	"A step of the mock model turns every dead cell alive"

	| comparison |
	self gridWithNeighbourhood: 4.
	comparison := self open: (CMBlViewComparison on: model).
	self
		assert: (self screenColorIn: comparison blocView at: 16 @ 16)
		equals: '000000'.

	comparison step.

	self
		assert: (self screenColorIn: comparison blocView at: 16 @ 16)
		equals: 'FFFFFF'
]

{ #category : 'tests' }
CMBlPresenterTest >> testEmbeddedViewFollowsGridChanges [

	| cow application presenter |
	self gridWithNeighbourhood: 4.
	cow := self newCowOn: (model cellAt: 2 at: 3).
	application := CMSimulationApplication new.
	application cormasModel: model.
	presenter := self open:
		             (application newPresenter: CMBlTestSpacePresenter).
	self
		assert: (self screenColorIn: presenter diagram at: 80 @ 48)
		equals: 'FF0000'.

	cow moveTo: (model cellAt: 1 at: 1).
	application announcer announce: CMSpaceGridChanged new.

	self
		assert: (self screenColorIn: presenter diagram at: 80 @ 48)
		equals: '000000'.
	self
		assert: (self screenColorIn: presenter diagram at: 16 @ 16)
		equals: 'FF0000'
]

{ #category : 'tests' }
CMBlPresenterTest >> testEmptyModelViewShowsNothing [

	| presenter |
	presenter := self openInspectorViewOf: CMMockModel new.

	self
		assert: (self screenColorIn: presenter at: 16 @ 16)
		equals: 'FFFFFF'
]

{ #category : 'tests' }
CMBlPresenterTest >> testInspectorViewOfAgentNotOnACell [

	| cow presenter |
	self gridWithNeighbourhood: 4.
	cow := model newEntity: CMMockCow.
	presenter := self openInspectorViewOf: cow.

	self
		assert: (self
				 screenColorIn: presenter
				 at: cow activePov size * 16 // 1 @ (cow activePov size * 16 // 1))
		equals: 'FF0000'
]

{ #category : 'tests' }
CMBlPresenterTest >> testInspectorViewOfAgentShowsItsShape [

	| cow presenter |
	self gridWithNeighbourhood: 4.
	cow := self newCowOn: (model cellAt: 2 at: 3).
	presenter := self openInspectorViewOf: cow.

	self
		assert: (self
				 screenColorIn: presenter
				 at: cow activePov size * 16 // 1 @ (cow activePov size * 16 // 1))
		equals: 'FF0000'
]

{ #category : 'tests' }
CMBlPresenterTest >> testInspectorViewOfAggregateShowsOnlyItsCells [

	| aggregate presenter |
	self gridWithNeighbourhood: 4.
	aggregate := model createAggregate: CMSpatialEntityAggregate from: {
			             (model cellAt: 1 at: 1).
			             (model cellAt: 2 at: 2) }.
	presenter := self openInspectorViewOf: aggregate.

	self
		assert: (self screenColorIn: presenter at: 16 @ 16)
		equals: '000000'.
	self
		assert: (self screenColorIn: presenter at: 48 @ 48)
		equals: '000000'.
	self
		assert: (self screenColorIn: presenter at: 48 @ 16)
		equals: 'FFFFFF'
]

{ #category : 'tests' }
CMBlPresenterTest >> testInspectorViewOfCellShowsItsOccupants [

	| cell presenter |
	self gridWithNeighbourhood: 4.
	cell := model cellAt: 2 at: 3.
	self newCowOn: cell.
	presenter := self openInspectorViewOf: cell.

	self
		assert: (self screenColorIn: presenter at: 16 @ 16)
		equals: 'FF0000'.
	self
		assert: (self screenColorIn: presenter at: 2 @ 2)
		equals: '000000'
]

{ #category : 'tests' }
CMBlPresenterTest >> testInspectorViewOfModelShowsTheSpace [

	| presenter |
	self gridWithNeighbourhood: 4.
	self newCowOn: (model cellAt: 2 at: 3).
	presenter := self openInspectorViewOf: model.

	self
		assert: (self screenColorIn: presenter at: 80 @ 48)
		equals: 'FF0000'.
	self
		assert: (self screenColorIn: presenter at: 16 @ 16)
		equals: '000000'
]

{ #category : 'tests' }
CMBlPresenterTest >> testPresenterShowsTheElement [

	| presenter |
	self gridWithNeighbourhood: 4.
	self newCowOn: (model cellAt: 2 at: 3).
	presenter := self open: (CMBlSpaceElement for: model) asPresenter.

	self
		assert: (self screenColorIn: presenter at: 80 @ 48)
		equals: 'FF0000'.
	self
		assert: (self screenColorIn: presenter at: 16 @ 16)
		equals: '000000'
]

{ #category : 'tests' }
CMBlPresenterTest >> testUpdateReachesTheScreen [

	| cow element presenter |
	self gridWithNeighbourhood: 4.
	cow := self newCowOn: (model cellAt: 2 at: 3).
	element := CMBlSpaceElement for: model.
	presenter := self open: element asPresenter.
	self
		assert: (self screenColorIn: presenter at: 80 @ 48)
		equals: 'FF0000'.

	cow moveTo: (model cellAt: 1 at: 1).
	element update.

	self
		assert: (self screenColorIn: presenter at: 80 @ 48)
		equals: '000000'.
	self
		assert: (self screenColorIn: presenter at: 16 @ 16)
		equals: 'FF0000'
]

{ #category : 'tests' }
CMBlPresenterTest >> testViewIsNotOfferedForCellOutsideAGrid [

	self deny: (CMMockCell new inspectionContexts anySatisfy: [ :each |
			 each title = 'View' ])
]
