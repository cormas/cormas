Class {
	#name : #EndFigure,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #'instance creation' }
EndFigure class >> createAt: aPoint [
	
	^self ellipse: (aPoint extent: 30 @ 30)
]

{ #category : #connection }
EndFigure >> canConnectToFigure: aFigure [
	
	Dialog warn: 'Unauthorized  connection'.
	^false
]

{ #category : #'initialize-release' }
EndFigure >> defaultAttributes [
	
	self lineWidth: 5.
	self lineColor: ColorValue black.
	self fillColor: (ColorValue red: 0.958003 green: 0.0 blue: 0.0)
]

{ #category : #changing }
EndFigure >> delete [
	"Since we're probably connected to the figure that was deleted, remove ourself"
	
	self model delete.
	^super delete
]

{ #category : #accessing }
EndFigure >> id [
	
	^id
]

{ #category : #accessing }
EndFigure >> id: anObject [
	
	id := anObject
]

{ #category : #'initialize-release' }
EndFigure >> initialize [
	
	super initialize.
	bounds := 0 @ 0 extent: 0 @ 0.
	self opaque.
	self defaultAttributes
]

{ #category : #'initialize-release' }
EndFigure >> model [
	
	model ifNil: [model := EndPointModel new].
	^model
]

{ #category : #'initialize-release' }
EndFigure >> resetFigure [
	
	self
		computePreferredBounds;
		translateTo: model position
]

{ #category : #printing }
EndFigure >> storeOn: aStream [
	
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
