Class {
	#name : #ControllerObs,
	#superclass : #Object,
	#instVars : [
		'secondMenu'
	],
	#category : 'Cormas-Core-Observer'
}

{ #category : #accessing }
ControllerObs >> controlActivity [
	
	self sensor redButtonPressed
		ifTrue:
			[self model performRedButton: self sensor cursorPoint.
			^self].
	self sensor yellowButtonPressed ifTrue: [self yellowButtonActivity].
	self sensor blueButtonPressed ifTrue: [self openSecondMenu]
]

{ #category : #action }
ControllerObs >> dispatchMenuSelection: menuSelection [
	"Detournement de la fonction generique initiale, clp Mai 99"
	
	menuSelection = 0 ifTrue: [^self].
	menuSelection isSymbol
		ifTrue: [self model updatePov: menuSelection]
		ifFalse: [self halt]
]

{ #category : #accessing }
ControllerObs >> initializeMenuCustom [
	
	| mb tmp lesPdv menuUpdated |
	mb := MenuBuilder new.
	self model fonction msgObs isNil
		ifTrue: [mb line]
		ifFalse:
			[tmp := self model fonction msgObs asList.
			tmp
				do:
					[:i | 
					lesPdv := (i organization listAtCategoryNamed: #pov) asOrderedCollection.
					mb beginSubMenuLabeled: i name asString.
					lesPdv do: [:a | mb add: a -> (i name , '*' , a) asSymbol].
					mb endSubMenu].
			tmp isEmpty ifFalse: [mb line]].
	menuUpdated := self model setCheck: mb menu.
	self model vue controller menuHolder value isNil not
		ifTrue:
			[menuUpdated
				selectionMemory: self model vue controller menuHolder selectionMemory]
		ifFalse: [self model vue controller menuHolder: menuUpdated].
	^menuUpdated
]

{ #category : #accessing }
ControllerObs >> isControlActive [
	"	^super isControlActive and: [self sensor anyButtonPressed]"
	
	^self sensor anyButtonPressed
]

{ #category : #accessing }
ControllerObs >> isControlWanted [
	
	^self viewHasCursor and: [self model notNil]
]

{ #category : #accessing }
ControllerObs >> openSecondMenu [
	
	| r |
	r := self
		trackMenu: secondMenu value
		at: self sensor globalCursorPoint
		centered: true.
	r notNil ifTrue: [performer perform: r]
]

{ #category : #accessing }
ControllerObs >> redButtonPressedEvent: anEvent [
	
	self model performRedButton: self sensor cursorPoint
]
