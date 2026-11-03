"
I check zooming, panning and exporting the space, by reading pixels.

## Responsibility:

- Check that the space fits its parent, and follows it until the user navigates.
- Check that zooming and panning work through their messages and through mouse events.
- Check that a saved picture shows the whole space, whatever the zoom.

## Collaborators: 

- `CMBlSpaceElement`: the element under test, in a parent element without a space.

### Implementation Points

The grid of `gridWithNeighbourhood:` has 3 rows and 4 columns, so at zoom 1 it measures 128 by 96 pixels. In my 256 by 256 parent it fits at zoom 2, 32 pixels below the top.
"
Class {
	#name : 'CMBlNavigationTest',
	#superclass : 'CMBlTestCase',
	#instVars : [
		'viewport',
		'element'
	],
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'private' }
CMBlNavigationTest >> assertFitted [

	self assert: (self colorAt: 4 @ 26) equals: 'FFFFFF'.
	self assert: (self colorAt: 110 @ 40) equals: '000000'
]

{ #category : 'private' }
CMBlNavigationTest >> assertZoomedIn [
	"Zooming around the center brings the top of the grid to a part of the viewport that was empty"

	self assert: (self colorAt: 4 @ 26) equals: '000000'
]

{ #category : 'private' }
CMBlNavigationTest >> assertZoomedOut [
	"Zooming around the center moves the top of the grid away from a part of the viewport it covered"

	self assert: (self colorAt: 110 @ 40) equals: 'FFFFFF'
]

{ #category : 'private' }
CMBlNavigationTest >> click: aButton [

	aButton dispatchEvent: BlClickEvent new
]

{ #category : 'private' }
CMBlNavigationTest >> colorAt: aPoint [

	viewport forceLayout.
	^ (viewport aeAsForm colorAt: aPoint) asHexString
]

{ #category : 'private' }
CMBlNavigationTest >> keyDown: aKeyboardKey modifiers: aKeyModifiers [

	viewport dispatchEvent: (BlKeyDownEvent new
			 key: aKeyboardKey;
			 modifiers: aKeyModifiers;
			 yourself)
]

{ #category : 'private' }
CMBlNavigationTest >> noModifiers [

	^ BlKeyModifiers
		  shift: false
		  ctrl: false
		  alt: false
		  cmd: false
]

{ #category : 'private' }
CMBlNavigationTest >> openGridWithCow [

	self gridWithNeighbourhood: 4.
	self newCowOn: (model cellAt: 2 at: 3).
	element := CMBlSpaceElement for: model.
	viewport := CMBlSpaceViewport on: element.
	viewport extent: 256 @ 256.
	viewport forceLayout
]

{ #category : 'private' }
CMBlNavigationTest >> press: aCharacter [

	self type: aCharacter asString modifiers: self noModifiers
]

{ #category : 'private' }
CMBlNavigationTest >> pressArrow: aKeyboardKey [

	self keyDown: aKeyboardKey modifiers: self noModifiers
]

{ #category : 'private' }
CMBlNavigationTest >> pressWithPrimaryModifier: aKeyboardKey [

	self keyDown: aKeyboardKey modifiers: self primaryModifier
]

{ #category : 'private' }
CMBlNavigationTest >> primaryModifier [
	"Answer Cmd on macOS and Ctrl elsewhere"

	| isMac |
	isMac := OSPlatform current isMacOS.
	^ BlKeyModifiers
		  shift: false
		  ctrl: isMac not
		  alt: false
		  cmd: isMac
]

{ #category : 'tests' }
CMBlNavigationTest >> testArrowDownMovesTheViewDown [

	self openGridWithCow.
	self pressArrow: KeyboardKey down.
	self assert: (self colorAt: 160 @ 96) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlNavigationTest >> testArrowLeftMovesTheViewLeft [

	self openGridWithCow.
	self pressArrow: KeyboardKey left.
	self assert: (self colorAt: 192 @ 128) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlNavigationTest >> testArrowRightMovesTheViewRight [

	self openGridWithCow.
	self assert: (self colorAt: 135 @ 128) equals: '000000'.
	self pressArrow: KeyboardKey right.
	self assert: (self colorAt: 135 @ 128) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlNavigationTest >> testArrowUpMovesTheViewUp [

	self openGridWithCow.
	self pressArrow: KeyboardKey up.
	self assert: (self colorAt: 160 @ 160) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlNavigationTest >> testButtonsStayInTheBottomRightCornerWhenZooming [
	"The center of the zoom in button shows its dark plus sign"

	| button origin corner point before |
	self openGridWithCow.
	button := viewport zoomInButton.
	origin := button localPointToGlobal: 0 @ 0.
	corner := viewport zoomToFitButton localPointToGlobal:
		          viewport zoomToFitButton extent.
	self assert: corner <= (256 @ 256).
	self assert: origin > (128 @ 128).
	point := (button localPointToGlobal: button extent / 2) rounded.
	before := self colorAt: point.
	self deny: before equals: 'FFFFFF'.

	viewport zoomIn.

	self assert: (self colorAt: point) equals: before
]

{ #category : 'tests' }
CMBlNavigationTest >> testDragPans [

	self openGridWithCow.
	viewport dispatchEvent: (BlDragStartEvent new
			 position: 100 @ 100;
			 yourself).
	viewport dispatchEvent: (BlDragEvent new
			 position: 110 @ 130;
			 yourself).

	self assert: (self colorAt: 170 @ 158) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlNavigationTest >> testFitsItsParentWhenAdded [

	self openGridWithCow.

	self assert: (self colorAt: 160 @ 128) equals: 'FF0000'.
	self assert: (self colorAt: 4 @ 40) equals: '000000'.
	self assert: (self colorAt: 4 @ 20) equals: 'FFFFFF'
]

{ #category : 'tests' }
CMBlNavigationTest >> testFollowsItsParentWhenResized [

	self openGridWithCow.

	viewport extent: 192 @ 192.

	self assert: (self colorAt: 120 @ 96) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlNavigationTest >> testKeyIInUpperCaseZoomsIn [

	self openGridWithCow.
	self press: $I.
	self assertZoomedIn
]

{ #category : 'tests' }
CMBlNavigationTest >> testKeyIZoomsIn [

	self openGridWithCow.
	self press: $i.
	self assertZoomedIn
]

{ #category : 'tests' }
CMBlNavigationTest >> testKeyOZoomsOut [

	self openGridWithCow.
	self press: $o.
	self assertZoomedOut
]

{ #category : 'tests' }
CMBlNavigationTest >> testMouseWheelZoomsAroundTheMouse [
	"The top of the grid moves up, into a part of the parent that was empty"

	self openGridWithCow.
	self assert: (self colorAt: 4 @ 26) equals: 'FFFFFF'.

	viewport dispatchEvent: (BlMouseWheelEvent new
			 position: 160 @ 128;
			 vector: (BlVector x: 0 y: 1);
			 yourself).

	self assert: (self colorAt: 160 @ 128) equals: 'FF0000'.
	self assert: (self colorAt: 4 @ 26) equals: '000000'
]

{ #category : 'tests' }
CMBlNavigationTest >> testNavigatingStopsFollowingTheParent [
	"Fitted again, the grid would end above this point of the smaller parent"

	self openGridWithCow.
	element panBy: 10 @ 0.

	viewport extent: 128 @ 128.

	self assert: (self colorAt: 60 @ 120) equals: '000000'
]

{ #category : 'tests' }
CMBlNavigationTest >> testPanBy [

	self openGridWithCow.

	element panBy: 10 @ 30.

	self assert: (self colorAt: 170 @ 158) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlNavigationTest >> testPlainBrowserKeysDoNothing [

	self openGridWithCow.
	#( $= $+ $- $0 ) do: [ :each | self press: each ].
	{
		KeyboardKey equal.
		KeyboardKey minus.
		KeyboardKey zero } do: [ :each | self pressArrow: each ].
	self assertFitted
]

{ #category : 'tests' }
CMBlNavigationTest >> testPlainZoomKeysWithPrimaryModifierDoNothing [

	self openGridWithCow.
	#( 'i' 'o' ' ' ) do: [ :each |
		self type: each modifiers: self primaryModifier ].
	{
		KeyboardKey I.
		KeyboardKey O.
		KeyboardKey space } do: [ :each |
		self pressWithPrimaryModifier: each ].
	self assertFitted
]

{ #category : 'tests' }
CMBlNavigationTest >> testPrimaryModifierAndShiftWithEqualsZoomsIn [
	"This is how a plus sign is typed on many keyboards"

	| isMac |
	self openGridWithCow.
	isMac := OSPlatform current isMacOS.
	self keyDown: KeyboardKey equal modifiers: (BlKeyModifiers
			 shift: true
			 ctrl: isMac not
			 alt: false
			 cmd: isMac).
	self assertZoomedIn
]

{ #category : 'tests' }
CMBlNavigationTest >> testPrimaryModifierWithEqualsZoomsIn [

	self openGridWithCow.
	self pressWithPrimaryModifier: KeyboardKey equal.
	self assertZoomedIn
]

{ #category : 'tests' }
CMBlNavigationTest >> testPrimaryModifierWithMinusZoomsOut [

	self openGridWithCow.
	self pressWithPrimaryModifier: KeyboardKey minus.
	self assertZoomedOut
]

{ #category : 'tests' }
CMBlNavigationTest >> testPrimaryModifierWithZeroZoomsToFit [

	self openGridWithCow.
	self press: $i.
	self pressWithPrimaryModifier: KeyboardKey zero.
	self assertFitted
]

{ #category : 'tests' }
CMBlNavigationTest >> testSavedPictureShowsTheWholeSpaceAtAnyZoom [

	| file form |
	self openGridWithCow.
	element zoomBy: 5 at: 0 @ 0.
	file := FileSystem memory / 'space.png'.

	element saveToPngFile: file.

	form := file binaryReadStreamDo: [ :stream |
		        PNGReadWriter formFromStream: stream ].
	self assert: form extent equals: 128 @ 96.
	self assert: (form colorAt: 80 @ 48) asHexString equals: 'FF0000'.
	self assert: (form colorAt: 120 @ 90) asHexString equals: '000000'
]

{ #category : 'tests' }
CMBlNavigationTest >> testShiftMakesArrowsFaster [

	self openGridWithCow.
	self keyDown: KeyboardKey right modifiers: (BlKeyModifiers
			 shift: true
			 ctrl: false
			 alt: false
			 cmd: false).
	self assert: (self colorAt: 32 @ 128) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlNavigationTest >> testSpaceZoomsToFit [

	self openGridWithCow.
	self press: $i.
	self press: Character space.
	self assertFitted
]

{ #category : 'tests' }
CMBlNavigationTest >> testUpdateKeepsTheZoom [
	"At this zoom the cow is large enough to reach a point it did not reach when the space fitted"

	self openGridWithCow.
	self assert: (self colorAt: 180 @ 128) equals: '000000'.
	element zoomBy: 2 at: 160 @ 128.

	element update.

	self assert: (self colorAt: 180 @ 128) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlNavigationTest >> testZoomByKeepsThePointStill [

	self openGridWithCow.

	element zoomBy: 2 at: 160 @ 128.

	self assert: (self colorAt: 160 @ 128) equals: 'FF0000'.
	self assert: (self colorAt: 180 @ 128) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlNavigationTest >> testZoomInButton [

	self openGridWithCow.
	self click: viewport zoomInButton.
	self assertZoomedIn
]

{ #category : 'tests' }
CMBlNavigationTest >> testZoomOutButton [

	self openGridWithCow.
	self click: viewport zoomOutButton.
	self assertZoomedOut
]

{ #category : 'tests' }
CMBlNavigationTest >> testZoomToFitButton [

	self openGridWithCow.
	self click: viewport zoomInButton.
	self click: viewport zoomToFitButton.
	self assertFitted
]

{ #category : 'tests' }
CMBlNavigationTest >> testZoomToFitUndoesNavigationAndFollowsAgain [

	self openGridWithCow.
	element
		zoomBy: 3 at: 0 @ 0;
		panBy: 50 @ 50.

	element zoomToFit.
	self assert: (self colorAt: 160 @ 128) equals: 'FF0000'.

	viewport extent: 192 @ 192.
	self assert: (self colorAt: 120 @ 96) equals: 'FF0000'
]

{ #category : 'private' }
CMBlNavigationTest >> type: aString modifiers: aKeyModifiers [

	viewport dispatchEvent: (BlTextInputEvent new
			 text: aString;
			 modifiers: aKeyModifiers;
			 yourself)
]
