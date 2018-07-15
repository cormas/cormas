Class {
	#name : #ActivityFigure,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #'instance creation' }
ActivityFigure class >> createAt: aPoint forClass: anEntityClass [
	
	| inst |
	inst := self new.
	inst initializeForClass: anEntityClass.
	^inst
		translateTo: aPoint - inst bounds center;
		yourself	"center"
]

{ #category : #connection }
ActivityFigure >> canConnectToFigure: aFigure [
	
	aFigure = self
		ifTrue:
			[self cormas warn: 'Unauthorized  connection'.
			^false].
	aFigure class = StartFigure
		ifTrue:
			[self cormas warn: 'Unauthorized  connection'.
			^false].
	self isAlreadyConnected
		ifTrue:
			[self cormas warn: 'Only one transition per activity'.
			^false].
	^super canConnectToFigure: aFigure
]

{ #category : #updating }
ActivityFigure >> computePreferredBounds [
	
	| newExtent |
	newExtent := self model selectedActivity value asComposedText extent
		+ (10 @ 10).
	^self origin extent: newExtent
]

{ #category : #connection }
ActivityFigure >> connectFromPoint: myPoint to: aFigure at: figurePoint [
	"Return a figure that represents the connection from self to aFigure (using myPoint
	and figurePoint as the connection points)."
	
	| newTransitionFigure |
	newTransitionFigure := super connectFromPoint: myPoint to: aFigure at:
			figurePoint.
	newTransitionFigure model: ToolStateTransitionModel new.
	(newTransitionFigure model)
		from: self model;
		to: aFigure model.
	newTransitionFigure lineWidth: 2.
	self model connectToDestination: aFigure model.
	^newTransitionFigure
]

{ #category : #connection }
ActivityFigure >> connectionFigureClass [
	"The type of figure that we should use for connections"
	
	^LineFigure
]

{ #category : #accessing }
ActivityFigure >> cormas [
	"Direct acces to the cormas instance"
	
	^Cormas current
]

{ #category : #'initialize-release' }
ActivityFigure >> defaultAttributes [
	
	self lineColor: (ColorValue red: 0.152484 green: 0.533024 blue: 0.0578684).
	self lineColor: ColorValue darkRed.
	self lineWidth: 1.
	self fillColor: ColorValue orange	"asHiliteColor"	"self fillColor: (ColorValue red: 1.0 green: 0.624954 blue: 0.250031)"
]

{ #category : #changing }
ActivityFigure >> delete [
	"Since we're probably connected to the figure that was deleted, remove ourself"
	
	self model delete.
	^super delete
]

{ #category : #changing }
ActivityFigure >> deletionUpdateFrom: aFigure [
	"Since we're probably connected to the figure that was deleted, remove ourself"
	
	| anElementActivity depts |
	depts := (aFigure dependents
		select: [:fig | Figure allSubclasses includes: fig class])
		asOrderedCollection.
	depts remove: self.
	depts isEmpty ifTrue: [^super deletionUpdateFrom: aFigure].
	depts size > 1 ifTrue: [self halt].
	anElementActivity := depts first model.
	self model disconnectFromDestination: anElementActivity.
	super deletionUpdateFrom: aFigure
]

{ #category : #displaying }
ActivityFigure >> displayFigureOn: aGraphicsContext [
	
	| text |
	super displayFigureOn: aGraphicsContext.
	text := self model selectedActivity value asComposedText.	"aGraphicsContext setForeColorTo: ColorValue darkRed.

	aGraphicsContext
		paint: self lineColor;
		lineWidth: self lineWidth."
	text
		displayOn: aGraphicsContext
		at: (self extent - text extent) // 2 + self origin
]

{ #category : #accessing }
ActivityFigure >> id [
	
	^id
]

{ #category : #accessing }
ActivityFigure >> id: anObject [
	
	id := anObject
]

{ #category : #'initialize-release' }
ActivityFigure >> initialize [
	
	inset := 20 @ 20.
	model ifNil: [super initialize].
	self model: ActivityModel new.
	bounds := 0 @ 0 extent: 0 @ 0.
	self opaque.
	self defaultAttributes
]

{ #category : #'initialize-release' }
ActivityFigure >> initializeForClass: anEntityClass [
	
	self model setActivityChoicesFrom: anEntityClass
]

{ #category : #testing }
ActivityFigure >> isActivityFigure [
	
	^true
]

{ #category : #connection }
ActivityFigure >> isAlreadyConnected [
	
	^self model outgoing isEmpty not
]

{ #category : #menu }
ActivityFigure >> menuAt: aPoint [
	"Figures have a menu that pops-up when clicked on by the yellow mouse button."
	
	| mb |
	mb := MenuBuilder new.
	mb
		add: 'set activity...' -> #openActivitySetter;
		add: 'show Code' -> #inspectCode;
		add: 'inspect...' -> #inspect;
		line.
	mb
		addCopyCutPaste;
		line.
	self addLineColorMenuTo: mb.
	self addFillColorMenuTo: mb.
	self addLineWidthMenuTo: mb.	"finalize"
	self addModelMenuTo: mb at: aPoint.
	^mb menu
]

{ #category : #'initialize-release' }
ActivityFigure >> model [
	
	model ifNil: [model := ActivityModel new].
	^model
]

{ #category : #'initialize-release' }
ActivityFigure >> resetFigure [
	
	self
		computePreferredBounds;
		translateTo: model position
]

{ #category : #printing }
ActivityFigure >> storeOn: aStream [
	
	| deps contain hand mod |
	info := self model selectedActivity value.
	deps := self myDependents.
	self myDependents: nil.
	contain := container.
	container := nil.
	hand := eventHandlers.
	eventHandlers := nil.
	mod := model.
	model := nil.	"comp := component.
	component := nil."
	[super storeOn: aStream]
		ensure:
			[self myDependents: deps.
			container := contain.
			eventHandlers := hand.
			model := mod	"component := comp"]
]

{ #category : #updating }
ActivityFigure >> update: anAspectSymbol with: aParameter from: aSender [
	
	anAspectSymbol == #name ifTrue: [^self recomputePreferredBounds].
	^super update: anAspectSymbol with: aParameter from: aSender
]
