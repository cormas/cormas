"
I am the window onto the space of a model. I show a `CMBlSpaceElement` and let the user navigate it with the mouse, the keyboard and buttons.

## Responsibility:

- Clip the space to my bounds and keep the zoom buttons in place while the space moves under them.
- Translate mouse events, typed characters and button clicks into navigation of the space.

## Collaborators: 

- `CMBlSpaceElement`: draws the space and knows how to zoom and pan.

## Public API and Key Messages

- `on:` creates me for a space element
- `zoomIn`, `zoomOut`, `zoomToFit`

| Action | Keys | Keys with Cmd (Ctrl outside macOS) |
|---|---|---|
| Zoom in | I | = (and + where it shares that key) |
| Zoom out | O | - |
| Zoom to fit | Space | 0 |

The arrow keys move the view, faster with Shift. The mouse wheel zooms around the mouse, and dragging pans.

```
(CMBlSpaceViewport on: CMBlSpaceElement exampleMockModel) openInNewSpace
```

### Implementation Points

I, O and Space arrive as typed text. Pharo does not report the arrow keys or anything typed with the primary modifier as text, so those are matched on key presses. Bloc ignores the repeated presses of a key that is held down, so holding an arrow key moves the view once.
"
Class {
	#name : 'CMBlSpaceViewport',
	#superclass : 'BlElement',
	#instVars : [
		'spaceElement',
		'zoomInButton',
		'zoomOutButton',
		'zoomToFitButton',
		'dragOrigin'
	],
	#category : 'Cormas-Bloc',
	#package : 'Cormas-Bloc'
}

{ #category : 'examples' }
CMBlSpaceViewport class >> exampleMockModel [

	<sampleInstance>
	^ self on: CMBlSpaceElement exampleMockModel
]

{ #category : 'instance creation' }
CMBlSpaceViewport class >> on: aSpaceElement [

	^ self new
		  setSpaceElement: aSpaceElement;
		  yourself
]

{ #category : 'event handling' }
CMBlSpaceViewport >> actionForArrow: aKeyboardKey step: aNumber [
	"Moving the view to the right moves what it shows to the left"

	aKeyboardKey = KeyboardKey right ifTrue: [
		^ [ spaceElement panBy: aNumber negated @ 0 ] ].
	aKeyboardKey = KeyboardKey left ifTrue: [
		^ [ spaceElement panBy: aNumber @ 0 ] ].
	aKeyboardKey = KeyboardKey down ifTrue: [
		^ [ spaceElement panBy: 0 @ aNumber negated ] ].
	aKeyboardKey = KeyboardKey up ifTrue: [
		^ [ spaceElement panBy: 0 @ aNumber ] ].
	^ nil
]

{ #category : 'event handling' }
CMBlSpaceViewport >> actionForPlainKey: aString [

	aString asLowercase = 'i' ifTrue: [ ^ [ self zoomIn ] ].
	aString asLowercase = 'o' ifTrue: [ ^ [ self zoomOut ] ].
	aString = ' ' ifTrue: [ ^ [ self zoomToFit ] ].
	^ nil
]

{ #category : 'event handling' }
CMBlSpaceViewport >> actionForPrimaryModifierKey: aKeyboardKey [
	"A plus sign is typed with the key of the equal sign on many keyboards"

	aKeyboardKey = KeyboardKey equal ifTrue: [ ^ [ self zoomIn ] ].
	aKeyboardKey = KeyboardKey minus ifTrue: [ ^ [ self zoomOut ] ].
	aKeyboardKey = KeyboardKey zero ifTrue: [ ^ [ self zoomToFit ] ].
	^ nil
]

{ #category : 'event handling' }
CMBlSpaceViewport >> handleDrag: anEvent [

	anEvent consume.
	spaceElement panBy: anEvent position - dragOrigin.
	dragOrigin := anEvent position
]

{ #category : 'event handling' }
CMBlSpaceViewport >> handleDragStart: anEvent [

	anEvent consume.
	dragOrigin := anEvent position
]

{ #category : 'event handling' }
CMBlSpaceViewport >> handleKeyDown: anEvent [
	"Pharo does not report the arrow keys or any key held with the primary modifier as typed text"

	| modifiers action |
	modifiers := anEvent modifiers.
	action := modifiers isPrimaryModifier
		          ifTrue: [ self actionForPrimaryModifierKey: anEvent key ]
		          ifFalse: [
				          self
					          actionForArrow: anEvent key
					          step: (modifiers isShift
							           ifTrue: [ 128 ]
							           ifFalse: [ 32 ]) ].
	action ifNil: [ ^ self ].
	anEvent consume.
	action value
]

{ #category : 'event handling' }
CMBlSpaceViewport >> handleMouseWheel: anEvent [

	anEvent consume.
	spaceElement
		zoomBy: (anEvent isScrollUp
				 ifTrue: [ 1.1 ]
				 ifFalse: [ 1 / 1.1 ])
		at: (self globalPointToLocal: anEvent position)
]

{ #category : 'event handling' }
CMBlSpaceViewport >> handleTextInput: anEvent [

	| action |
	anEvent modifiers isPrimaryModifier ifTrue: [ ^ self ].
	action := self actionForPlainKey: anEvent text asString.
	action ifNil: [ ^ self ].
	anEvent consume.
	action value
]

{ #category : 'initialization' }
CMBlSpaceViewport >> iconColor [

	^ Color darkGray
]

{ #category : 'initialization' }
CMBlSpaceViewport >> initialize [

	super initialize.
	self
		layout: BlFrameLayout new;
		constraintsDo: [ :constraints |
				constraints horizontal matchParent.
				constraints vertical matchParent ];
		clipChildren: true.
	self
		addEventHandlerOn: BlMouseDownEvent do: [ self requestFocus ];
		addEventHandlerOn: BlMouseWheelEvent
		do: [ :event | self handleMouseWheel: event ];
		addEventHandlerOn: BlDragStartEvent
		do: [ :event | self handleDragStart: event ];
		addEventHandlerOn: BlDragEvent
		do: [ :event | self handleDrag: event ];
		addEventHandlerOn: BlKeyDownEvent
		do: [ :event | self handleKeyDown: event ];
		addEventHandlerOn: BlTextInputEvent
		do: [ :event | self handleTextInput: event ]
]

{ #category : 'initialization' }
CMBlSpaceViewport >> newButtonPanel [

	| horizontalBar verticalBar |
	horizontalBar := [ self newIcon: 14 @ 2 ].
	verticalBar := [ self newIcon: 2 @ 14 ].
	zoomInButton := self
		                newButtonWithIcon: {
				                horizontalBar value.
				                verticalBar value }
		                doing: [ self zoomIn ].
	zoomOutButton := self
		                 newButtonWithIcon: { horizontalBar value }
		                 doing: [ self zoomOut ].
	zoomToFitButton := self
		                   newButtonWithIcon: { self newFitIcon }
		                   doing: [ self zoomToFit ].
	^ BlElement new
		  layout: BlLinearLayout vertical;
		  background: Color white;
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 8);
		  effect: (BlGaussianShadowEffect
				   color: (Color black alpha: 0.3)
				   width: 6
				   offset: 0 @ 2);
		  padding: (BlInsets all: 2);
		  constraintsDo: [ :constraints |
				  constraints horizontal fitContent.
				  constraints vertical fitContent.
				  constraints frame horizontal alignRight.
				  constraints frame vertical alignBottom.
				  constraints margin: (BlInsets all: 12) ];
		  addChildren: {
				  zoomInButton.
				  zoomOutButton.
				  zoomToFitButton };
		  yourself
]

{ #category : 'initialization' }
CMBlSpaceViewport >> newButtonWithIcon: icons doing: aBlock [

	| button |
	button := BlElement new
		          layout: BlFrameLayout new;
		          extent: 32 @ 32;
		          geometry: (BlRoundedRectangleGeometry cornerRadius: 6);
		          addChildren: icons;
		          yourself.
	button
		addEventHandlerOn: BlMouseEnterEvent
		do: [ button background: (Color gray alpha: 0.2) ];
		addEventHandlerOn: BlMouseLeaveEvent
		do: [ button background: Color transparent ];
		addEventHandlerOn: BlClickEvent do: [ :event |
				event consume.
				aBlock value ].
	^ button
]

{ #category : 'initialization' }
CMBlSpaceViewport >> newFitIcon [

	^ BlElement new
		  extent: 14 @ 14;
		  border: (BlBorder paint: self iconColor width: 2);
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
		  constraintsDo: [ :constraints |
				  constraints frame horizontal alignCenter.
				  constraints frame vertical alignCenter ];
		  yourself
]

{ #category : 'initialization' }
CMBlSpaceViewport >> newIcon: anExtent [

	^ BlElement new
		  extent: anExtent;
		  background: self iconColor;
		  constraintsDo: [ :constraints |
				  constraints frame horizontal alignCenter.
				  constraints frame vertical alignCenter ];
		  yourself
]

{ #category : 'initialization' }
CMBlSpaceViewport >> setSpaceElement: aSpaceElement [

	spaceElement := aSpaceElement.
	self
		addChild: spaceElement;
		addChild: self newButtonPanel
]

{ #category : 'accessing' }
CMBlSpaceViewport >> spaceElement [

	^ spaceElement
]

{ #category : 'navigation' }
CMBlSpaceViewport >> zoomIn [

	spaceElement zoomBy: 1.25 at: self extent / 2
]

{ #category : 'accessing' }
CMBlSpaceViewport >> zoomInButton [

	^ zoomInButton
]

{ #category : 'navigation' }
CMBlSpaceViewport >> zoomOut [

	spaceElement zoomBy: 1 / 1.25 at: self extent / 2
]

{ #category : 'accessing' }
CMBlSpaceViewport >> zoomOutButton [

	^ zoomOutButton
]

{ #category : 'navigation' }
CMBlSpaceViewport >> zoomToFit [

	spaceElement zoomToFit
]

{ #category : 'accessing' }
CMBlSpaceViewport >> zoomToFitButton [

	^ zoomToFitButton
]
