"
I check that Bloc views appear correctly in Spec windows, by reading the pixels shown on screen.

## Responsibility:

- Check what a view's presenter shows when opened, embedded, or used as an inspector tab.
- Check that `update` reaches the screen.
- Close every window I open.

## Collaborators: 

- `CMBlElement`: answers the presenters I open.
- `CMSpacePresenter`: embeds the view in Cormas UI.

### Implementation Points

I open real windows, so I need a running UI process. My tests wait for it if it is blocked.
"
Class {
	#name : 'CMBlPresenterTest',
	#superclass : 'CMBlTestCase',
	#instVars : [
		'window',
		'spacePresenter'
	],
	#category : 'Cormas-Bloc-Spec-Tests',
	#package : 'Cormas-Bloc-Spec-Tests'
}

{ #category : 'private' }
CMBlPresenterTest >> embeddedViewOf: aSpacePresenter [

	^ aSpacePresenter instVarNamed: #diagram
]

{ #category : 'private' }
CMBlPresenterTest >> open: aPresenter [

	window := aPresenter open.
	^ aPresenter
]

{ #category : 'private' }
CMBlPresenterTest >> openFocused: aSpaceElement [

	spacePresenter := self open: aSpaceElement asPresenter.
	spacePresenter space settle.
	spacePresenter space root children first requestFocus.
	spacePresenter space settle
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
CMBlPresenterTest >> openSpacePresenter: application [

	^ self open: (application newPresenter: CMSpacePresenter)
]

{ #category : 'private' }
CMBlPresenterTest >> screenColorIn: aPresenter at: aPoint [
	"Answer the color shown at the point of the view given in its own coordinates, once it has been drawn"

	| view |
	aPresenter space settle.
	view := aPresenter space root children first.
	(view isKindOf: CMBlSpaceViewport) ifTrue: [
		view := view spaceElement ].
	^ (aPresenter space host containerMorph submorphs first form
		   colorAt: (view localPointToGlobal: aPoint) rounded) asHexString
]

{ #category : 'private' }
CMBlPresenterTest >> sendKeyDown: aKeyboardKey buttons: aNumber [
	"Send a key press the way Morphic delivers it to the morph of a space"

	| event morph |
	morph := spacePresenter space host containerMorph submorphs first.
	event := KeyboardEvent new
		         setType: #keyDown
		         buttons: aNumber
		         position: morph center
		         keyValue: aKeyboardKey value
		         charCode: aKeyboardKey value
		         hand: self currentWorld activeHand
		         stamp: Time millisecondClockValue.
	event key: aKeyboardKey.
	morph keyDown: event.
	spacePresenter space settle.
	spacePresenter space settle
]

{ #category : 'running' }
CMBlPresenterTest >> tearDown [

	window ifNotNil: [ window close ].
	super tearDown
]

{ #category : 'tests' }
CMBlPresenterTest >> testArrowKeyPressArrivingFromMorphicPans [

	| before element |
	self gridWithNeighbourhood: 4.
	element := CMBlSpaceElement for: model.
	self openFocused: element.
	before := element localPointToGlobal: 0 @ 0.

	self sendKeyDown: KeyboardKey right buttons: 0.

	self assert: (element localPointToGlobal: 0 @ 0) x < before x
]

{ #category : 'tests' }
CMBlPresenterTest >> testClickingAZoomButtonOnScreenZooms [

	| presenter viewport element before |
	self gridWithNeighbourhood: 4.
	element := CMBlSpaceElement for: model.
	presenter := self open: element asPresenter.
	presenter space settle.
	viewport := presenter space root children first.
	before := element localPointToGlobal: 128 @ 96.

	viewport zoomInButton eventSimulator click.
	presenter space settle.

	self assert: (element localPointToGlobal: 128 @ 96) x > before x
]

{ #category : 'tests' }
CMBlPresenterTest >> testCommandKeyPressArrivingFromMorphicZooms [

	| before element |
	self gridWithNeighbourhood: 4.
	element := CMBlSpaceElement for: model.
	self openFocused: element.
	before := element localPointToGlobal: 128 @ 96.

	self
		sendKeyDown: KeyboardKey equal
		buttons: (OSPlatform current isMacOS
				 ifTrue: [ 64 ]
				 ifFalse: [ 16 ]).

	self assert: (element localPointToGlobal: 128 @ 96) x > before x
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

	| cow application presenter view |
	self gridWithNeighbourhood: 4.
	cow := self newCowOn: (model cellAt: 2 at: 3).
	application := CMSimulationApplication new.
	application cormasModel: model.
	presenter := self openSpacePresenter: application.
	view := self embeddedViewOf: presenter.
	self assert: (self screenColorIn: view at: 80 @ 48) equals: 'FF0000'.

	cow moveTo: (model cellAt: 1 at: 1).
	application announcer announce: CMSpaceGridChanged new.

	self assert: (self screenColorIn: view at: 80 @ 48) equals: '000000'.
	self assert: (self screenColorIn: view at: 16 @ 16) equals: 'FF0000'
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
CMBlPresenterTest >> testFitButtonOfSpacePresenterFitsTheView [

	| application presenter view element |
	self gridWithNeighbourhood: 4.
	self newCowOn: (model cellAt: 2 at: 3).
	application := CMSimulationApplication new.
	application cormasModel: model.
	presenter := self openSpacePresenter: application.
	view := self embeddedViewOf: presenter.
	self assert: (self screenColorIn: view at: 80 @ 48) equals: 'FF0000'.
	element := presenter spaceBuilder.
	element zoomBy: 5 at: 0 @ 0.

	presenter fitDiagram.
	view space settle.

	self assert: (self screenColorIn: view at: 80 @ 48) equals: 'FF0000'.
	self assert:
		(element localPointToGlobal: 128 @ 96) <= view space root extent
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
CMBlPresenterTest >> testOpenSpacePresenterShowsTheModel [

	| presenter |
	self gridWithNeighbourhood: 4.
	self newCowOn: (model cellAt: 2 at: 3).

	window := model openSpacePresenter.
	presenter := window presenter.

	self
		assert: (self screenColorIn: presenter at: 80 @ 48)
		equals: 'FF0000'
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
CMBlPresenterTest >> testSpacePresenterCellClickReachesItsBlock [
	"The command that creates agents listens for clicks on cells this way"

	| application presenter clicked cellElement |
	self gridWithNeighbourhood: 4.
	application := CMSimulationApplication new.
	application cormasModel: model.
	presenter := self openSpacePresenter: application.
	(self embeddedViewOf: presenter) space settle.
	presenter spaceBuilder whenLeftClickOnCellDo: [ :cell |
		clicked := cell ].
	cellElement := presenter spaceBuilder children detect: [ :each |
		               each entity == (model cellAt: 1 at: 3) ].

	cellElement eventSimulator click.
	(self embeddedViewOf: presenter) space settle.

	self assert: clicked equals: (model cellAt: 1 at: 3)
]

{ #category : 'tests' }
CMBlPresenterTest >> testSpacePresenterSavesPicture [

	| application presenter file form |
	self gridWithNeighbourhood: 4.
	self newCowOn: (model cellAt: 2 at: 3).
	application := CMSimulationApplication new.
	application cormasModel: model.
	presenter := self openSpacePresenter: application.
	file := FileSystem memory / 'space.png'.

	presenter saveToPngFile: file.

	form := file binaryReadStreamDo: [ :stream |
		        PNGReadWriter formFromStream: stream ].
	self assert: (form colorAt: 80 @ 48) asHexString equals: 'FF0000'
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
