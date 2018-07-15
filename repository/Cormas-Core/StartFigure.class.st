Class {
	#name : #StartFigure,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #'instance creation' }
StartFigure class >> createAt: aPoint [
	
	^self ellipse: (aPoint extent: 30 @ 30)
]

{ #category : #connection }
StartFigure >> canConnectFromFigure: aFigure [
	
	self cormas warn: 'Unauthorized  connection'.
	^false
]

{ #category : #connection }
StartFigure >> connectFromPoint: myPoint to: aFigure at: figurePoint [
	"Return a figure that represents the connection from self to aFigure (using myPoint
	and figurePoint as the connection points)."
	
	| newFigure |
	self model isAlreadyConnected
		ifTrue: [self cormas warn: 'Only one transition per activity']
		ifFalse:
			[newFigure := super connectFromPoint: myPoint to: aFigure at: figurePoint.
			newFigure model: ToolStateTransitionModel new.
			(newFigure model)
				from: self model;
				to: aFigure model.
			newFigure lineWidth: 2.
			self model connectToDestination: aFigure model.
			^newFigure]
]

{ #category : #'initialize-release' }
StartFigure >> defaultAttributes [
	
	self lineWidth: 5.
	self lineColor: ColorValue black.
	self fillColor: (ColorValue red: 0.0 green: 0.492003 blue: 0.0)
]

{ #category : #changing }
StartFigure >> delete [
	"Since we're probably connected to the figure that was deleted, remove ourself"
	
	self model delete.
	^super delete
]

{ #category : #changing }
StartFigure >> deletionUpdateFrom: aFigure [
	"Since we're probably connected to the figure that was deleted, remove ourself"
	
	| anElementActivity |
	anElementActivity := aFigure model to.
	self model disconnectFromDestination: anElementActivity.
	super deletionUpdateFrom: aFigure
]

{ #category : #accessing }
StartFigure >> id [
	
	^id
]

{ #category : #accessing }
StartFigure >> id: anObject [
	
	id := anObject
]

{ #category : #'initialize-release' }
StartFigure >> initialize [
	
	super initialize.
	bounds := 0 @ 0 extent: 0 @ 0.
	self opaque.
	self defaultAttributes
]

{ #category : #'initialize-release' }
StartFigure >> model [
	
	model ifNil: [model := StartPointModel new].
	^model
]

{ #category : #'initialize-release' }
StartFigure >> resetFigure [
	
	self
		computePreferredBounds;
		translateTo: model position
]

{ #category : #printing }
StartFigure >> storeOn: aStream [
	
	| deps contain hand mod |
	deps := self myDependents.
	self myDependents: nil.
	contain := container.
	container := nil.
	hand := eventHandlers.
	eventHandlers := nil.
	mod := model.
	model := nil.
	[super storeOn: aStream]
		ensure:
			[self myDependents: deps.
			container := contain.
			eventHandlers := hand.
			model := mod]
]
