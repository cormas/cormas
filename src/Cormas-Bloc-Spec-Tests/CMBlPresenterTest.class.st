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
CMBlPresenterTest >> assertWindowCannotHideItsContent [

	window window extent: 200 @ 700.
	300 milliSeconds wait.
	self assert:
		self windowContent width >= self windowContent minExtent x
]

{ #category : 'private' }
CMBlPresenterTest >> embeddedViewOf: aSpacePresenter [

	^ aSpacePresenter instVarNamed: #diagram
]

{ #category : 'private' }
CMBlPresenterTest >> isShownAtItsRealSize: aSpacePresenter [

	| container form |
	aSpacePresenter space root hasChildren ifFalse: [ ^ false ].
	container := aSpacePresenter space host containerMorph.
	container submorphs ifEmpty: [ ^ false ].
	form := container submorphs first form.
	form ifNil: [ ^ false ].
	^ form extent = container extent rounded and: [
		  aSpacePresenter space root extent rounded
		  = container extent rounded ]
]

{ #category : 'private' }
CMBlPresenterTest >> open: aPresenter [

	window := aPresenter open.
	self showAtARealSize: aPresenter.
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
CMBlPresenterTest >> openSimulationPresenter [

	| simulation application presenter |
	simulation := (CMSimulation for: CMMockModel new)
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              initializeSimulation;
		              yourself.
	model := simulation cormasModel.
	application := CMSimulationApplication new.
	application
		simulation: simulation;
		cormasModel: model.
	presenter := application newPresenter: CMSimulationPresenter.
	window := presenter open.
	^ presenter
]

{ #category : 'private' }
CMBlPresenterTest >> openSpacePresenter: application [

	^ self open: (application newPresenter: CMSpacePresenter)
]

{ #category : 'private' }
CMBlPresenterTest >> runnerOf: aSimulationPresenter [

	^ aSimulationPresenter instVarNamed: #simulationRunner
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

{ #category : 'private' }
CMBlPresenterTest >> showAtARealSize: aPresenter [
	"Without a display, as in continuous integration, windows open too small to show what the tests look for"

	window window extent: 800 @ 600.
	self waitUntilShown: aPresenter
]

{ #category : 'private' }
CMBlPresenterTest >> sideMenuButtonsOf: aSimulationPresenter [

	^ ((aSimulationPresenter instVarNamed: #sidebar) instVarNamed:
		   #activityBar) instVarNamed: #toggleButtons
]

{ #category : 'private' }
CMBlPresenterTest >> spacePresenterIn: aPresenter [
	"Answer the presenter embedding the Bloc space among those that a test opens"

	(aPresenter isKindOf: SpBlSpaceInMorphPresenter) ifTrue: [
		^ aPresenter ].
	^ self embeddedViewOf: aPresenter
]

{ #category : 'private' }
CMBlPresenterTest >> spacePresenterOf: aSimulationPresenter [

	^ (self runnerOf: aSimulationPresenter) instVarNamed: #spacePresenter
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
CMBlPresenterTest >> testClosingTheSideMenuLetsTheWindowShrinkAgain [

	| presenter narrowest button |
	presenter := self openSimulationPresenter.
	300 milliSeconds wait.
	window window extent: 200 @ 700.
	narrowest := window window width.
	button := (self sideMenuButtonsOf: presenter) first.
	button state: true.
	300 milliSeconds wait.

	button state: false.
	300 milliSeconds wait.
	window window extent: 200 @ 700.

	self assert: window window width equals: narrowest
]

{ #category : 'tests' }
CMBlPresenterTest >> testClosingTheWindowOnAnotherTabClosesTheView [

	| presenter space |
	presenter := self openSimulationPresenter.
	space := (self embeddedViewOf: (self spacePresenterOf: presenter))
		         space.
	space settle.

	((self runnerOf: presenter) instVarNamed: #notebook)
		selectPageIndex: 2.
	300 milliSeconds wait.
	window close.
	space settle.

	self deny: space isOpened
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
	self showAtARealSize: presenter.

	self
		assert: (self screenColorIn: presenter at: 80 @ 48)
		equals: 'FF0000'
]

{ #category : 'tests' }
CMBlPresenterTest >> testOpeningTheSideMenuGrowsANarrowWindow [

	| presenter narrowest |
	presenter := self openSimulationPresenter.
	300 milliSeconds wait.
	window window extent: 200 @ 700.
	narrowest := window window width.

	(self sideMenuButtonsOf: presenter) first state: true.
	300 milliSeconds wait.

	self assert: window window width > narrowest.
	self assert:
		self windowContent width >= self windowContent minExtent x
]

{ #category : 'tests' }
CMBlPresenterTest >> testOpeningTheSideMenuKeepsAWideWindow [

	| presenter |
	presenter := self openSimulationPresenter.
	300 milliSeconds wait.
	window window extent: 1500 @ 700.

	(self sideMenuButtonsOf: presenter) first state: true.
	300 milliSeconds wait.

	self assert: window window width equals: 1500
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
CMBlPresenterTest >> testReinitializingClosesTheOldView [

	| presenter oldSpace newSpace |
	presenter := self openSimulationPresenter.
	oldSpace := (self embeddedViewOf: (self spacePresenterOf: presenter))
		            space.
	oldSpace settle.

	presenter initializeSimulationInit: #initFixed control: #step.
	oldSpace settle.

	newSpace := (self embeddedViewOf: (self spacePresenterOf: presenter))
		            space.
	self deny: oldSpace isOpened.
	self assert: newSpace isOpened
]

{ #category : 'tests' }
CMBlPresenterTest >> testReinitializingStopsUpdatingTheOldView [

	| presenter oldView childrenBefore |
	presenter := self openSimulationPresenter.
	(self embeddedViewOf: (self spacePresenterOf: presenter)) space
		settle.
	oldView := (self spacePresenterOf: presenter) spaceBuilder.

	presenter initializeSimulationInit: #initFixed control: #step.
	childrenBefore := oldView children size.
	(model newEntity: CMMockCow) moveTo: (model cellAt: 1 at: 1).
	presenter application announcer announce: CMSpaceGridChanged new.
	(self embeddedViewOf: (self spacePresenterOf: presenter)) space
		settle.

	self assert: oldView children size equals: childrenBefore
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
CMBlPresenterTest >> testSwitchingTabsOfTheSideMenuKeepsTheMinimumWidth [

	| presenter buttons minimum |
	presenter := self openSimulationPresenter.
	300 milliSeconds wait.
	buttons := self sideMenuButtonsOf: presenter.
	buttons first state: true.
	300 milliSeconds wait.
	minimum := window window minimumExtent x.

	buttons second state: true.
	300 milliSeconds wait.

	self assert: window window minimumExtent x equals: minimum.
	self assertWindowCannotHideItsContent
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
CMBlPresenterTest >> testViewEmbeddedInSpacePresenterFitsAsSoonAsItOpens [

	| application presenter view |
	self gridWithNeighbourhood: 4.
	application := CMSimulationApplication new.
	application cormasModel: model.
	presenter := self openSpacePresenter: application.
	view := self embeddedViewOf: presenter.

	self
		assert: view space root extent rounded
		equals: view space extent rounded
]

{ #category : 'tests' }
CMBlPresenterTest >> testViewFitsTheWindowAsSoonAsItOpens [
	"The default size of a window is what the fit has to deal with, so this test does not change it"

	| presenter |
	self gridWithNeighbourhood: 4.
	presenter := (CMBlSpaceElement for: model) asPresenter.
	window := presenter open.
	self waitUntilShown: presenter.

	self
		assert: presenter space root extent rounded
		equals: presenter space extent rounded
]

{ #category : 'tests' }
CMBlPresenterTest >> testViewIsNotOfferedForCellOutsideAGrid [

	self deny: (CMMockCell new inspectionContexts anySatisfy: [ :each |
			 each title = 'View' ])
]

{ #category : 'tests' }
CMBlPresenterTest >> testWindowCannotBeNarrowerThanItsContent [
	"The controls of a simulation cannot shrink, so a narrower window would cut off the view of the space"

	self openSimulationPresenter.
	300 milliSeconds wait.

	window window extent: 200 @ 700.
	300 milliSeconds wait.

	self assert:
		self windowContent width >= self windowContent minExtent x
]

{ #category : 'tests' }
CMBlPresenterTest >> testWindowCannotBeNarrowerThanItsContentWithTheSideMenuOpen [

	| presenter |
	presenter := self openSimulationPresenter.
	300 milliSeconds wait.
	(self sideMenuButtonsOf: presenter) first state: true.
	300 milliSeconds wait.

	self assertWindowCannotHideItsContent
]

{ #category : 'private' }
CMBlPresenterTest >> waitUntilShown: aPresenter [
	"A space starts with a default size and gets the real one from its morph some time after the window opens. A space can be settled before that, so this checks the size itself, for at most one second"

	| spacePresenter deadline |
	spacePresenter := self spacePresenterIn: aPresenter.
	deadline := DateAndTime now + 1 second.
	[
		spacePresenter space settle.
		(self isShownAtItsRealSize: spacePresenter) or: [
			DateAndTime now > deadline ] ] whileFalse: [ 20 milliSeconds wait ].
	spacePresenter space settle
]

{ #category : 'private' }
CMBlPresenterTest >> windowContent [
	"Answer the morph holding everything shown in the window, under its title bar"

	^ window window submorphs last
]
