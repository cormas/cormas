Class {
	#name : #SpaceController,
	#superclass : #Object,
	#category : #'Cormas-Core-Space'
}

{ #category : #events }
SpaceController >> dispatchMenuSelection22: menuSelection [
	"Detournement de la fonction generique initiale, clp Mai 99"
	
	menuSelection = 0 ifTrue: [^self].
	menuSelection isSymbol
		ifTrue:
			[self view mainInterface updatePov: menuSelection	]
]

{ #category : #events }
SpaceController >> dispatchMenuSelection: menuSelection [
	"Detournement de la fonction generique initiale, clp Mai 99"
	
	menuSelection = 0 ifTrue: [^self].
	menuSelection isSymbol
		ifTrue:
			[self view mainInterface updatePov: menuSelection	"ifFalse: [self halt]"]
]

{ #category : #events }
SpaceController >> handleEvent: anEvent [
	
	super handleEvent: anEvent	"ce n'est plus la peine de passer par l√†. Il faut utiliser Tool.
	(anEvent isKindOf: DoubleClickEvent) ifTrue:[self doubleClickEvent: anEvent].

	anEvent key == #enter ifTrue: [self currentTool cursor show].
	anEvent key == #exit ifTrue: [Cursor normal show].
	(anEvent isMouseEvent or: [anEvent isKeyboard]) 
		ifTrue: 
			[(self currentTool handleEvent: anEvent) 
				ifTrue: [self setAsCurrentConsumer]]"
]

{ #category : #events }
SpaceController >> isControlWanted [
	
	^super isControlWanted	"	^self viewHasCursor and: [self model notNil]"
]

{ #category : #events }
SpaceController >> processMenuAt: aPoint centered: centered [
	
	self view contextualMenu.
	super processMenuAt: aPoint centered: centered.
	self view mainInterface updateWindowName.
	self view mainInterface initMenuAttributs
]

{ #category : #events }
SpaceController >> redButtonPressedEvent22: anEvent [
	"Click droit"
	
	[self sensor redButtonPressed]
		whileTrue:
			["	self sensor redButtonPressed ifTrue: "
			self sensor shiftDown
				ifTrue:
					[self sensor ctrlDown
						ifTrue:
							[self view performShiftCtrlRedButton: self sensor cursorPoint]
						ifFalse: [self view performShiftRedButton: self sensor cursorPoint]]
				ifFalse:
					[self sensor ctrlDown
						ifTrue: [self view performCtrlRedButton: self sensor cursorPoint]
						ifFalse: [self view performRedButton: self sensor cursorPoint]]].
	self sensor waitNoButton
]

{ #category : #events }
SpaceController >> redButtonPressedEvent: anEvent [
	"Click droit"
	
	[self sensor redButtonPressed]
		whileTrue:
			["	self sensor redButtonPressed ifTrue: "
			self sensor shiftDown
				ifTrue:
					[self sensor ctrlDown
						ifTrue:
							[self view performShiftCtrlRedButton: self sensor cursorPoint]
						ifFalse: [self view performShiftRedButton: self sensor cursorPoint]]
				ifFalse:
					[self sensor ctrlDown
						ifTrue: [self view performCtrlRedButton: self sensor cursorPoint]
						ifFalse: [self view performRedButton: self sensor cursorPoint]]].
	self sensor waitNoButton
]
