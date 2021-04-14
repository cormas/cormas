Class {
	#name : #ControllerObs,
	#superclass : #Object,
	#instVars : [
		'secondMenu'
	],
	#category : #'Cormas-Core-Observer'
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
	"Diversion of the initial generic function, clp May 99"
	
	menuSelection = 0 ifTrue: [^self].
	menuSelection isSymbol
		ifTrue: [self model updatePov: menuSelection].
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
ControllerObs >> redButtonPressedEvent: anEvent [
	
	self model performRedButton: self sensor cursorPoint
]
