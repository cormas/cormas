Class {
	#name : #DiamondFigure,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #'instance creation' }
DiamondFigure class >> createAt: aPoint forClass: anEntityClass [
	
	| inst |
	inst := self withPoints: VectorialElementaryPOV diamond outline vertices.	""
	inst initializeForClass: anEntityClass.
	^inst
		translateTo: aPoint - (26 @ 26);
		yourself
]

{ #category : #'bounds accessing' }
DiamondFigure >> bounds [
	
	self points isEmpty ifTrue: [^super bounds].
	^self insetBounds
]

{ #category : #connection }
DiamondFigure >> canConnectToFigure: aFigure [
	
	aFigure = self
		ifTrue:
			[Dialog warn: 'Unauthorized  connection'.
			^false].
	aFigure class = StartFigure
		ifTrue:
			[Dialog warn: 'Unauthorized  connection'.
			^false].
	self isAlreadyConnected
		ifTrue:
			[Dialog warn: 'Only 2 transitions per test : True & False'.
			^false].
	^super canConnectToFigure: aFigure
]

{ #category : #connection }
DiamondFigure >> connectFromPoint: myPoint to: aFigure at: figurePoint [
	"Return a figure that represents the connection from self to aFigure (using myPoint
	and figurePoint as the connection points)."
	
	| newFigure |
	newFigure := super connectFromPoint: myPoint to: aFigure at: figurePoint.
	newFigure model: ToolStateTransitionModel new.
	(newFigure model)
		from: self model;
		to: aFigure model.
	newFigure lineWidth: 2.
	self model outgoingTrue isNil
		ifTrue:
			["newFigure entityType: 'transition_TRUE'."
			newFigure setText: '[true]'.
			newFigure lineColor: ColorValue green.
			self model connectToDestinationTrue: aFigure model]
		ifFalse:
			["newFigure entityType: 'transition_FALSE'."
			newFigure setText: '[false]'.
			newFigure lineColor: ColorValue red.
			self model connectToDestinationFalse: aFigure model].
	^newFigure
]

{ #category : #connection }
DiamondFigure >> connectionFigureClass [
	"The type of figure that we should use for connections"
	
	^LineFigure
]

{ #category : #'initialize-release' }
DiamondFigure >> defaultAttributes [
	
	self lineColor: ColorValue darkRed.
	self lineWidth: 1.
	self fillColor: ColorValue yellow
]

{ #category : #changing }
DiamondFigure >> delete [
	"Since we're probably connected to the figure that was deleted, remove ourself"
	
	self model delete.
	^super delete
]

{ #category : #changing }
DiamondFigure >> deletionUpdateFrom: aFigure [
	"Since we're probably connected to the figure that was deleted, remove ourself"
	
	| anElementActivity depts |
	depts := (aFigure dependents
		select: [:fig | Figure allSubclasses includes: fig class])
		asOrderedCollection.
	depts remove: self.
	depts isEmpty
		ifTrue:
			[aFigure removeDependent: self.
			^self removeDependent: aFigure].
	depts size > 1 ifTrue: [self halt].
	anElementActivity := depts first model.
	self model disconnectFromDestination: anElementActivity.
	aFigure removeDependent: self.
	self removeDependent: aFigure
]

{ #category : #displaying }
DiamondFigure >> displayFigureOn: aGraphicsContext [
	
	| text |
	info := nil.
	super displayFigureOn: aGraphicsContext.
	text := self model selectedActivity value asComposedText.
	aGraphicsContext paint: ColorValue black.
	text
		displayOn: aGraphicsContext
		at: (self extent - text extent) // 2 + self origin	"pour afficher le bounds"	"self bounds displayStrokedOn: aGraphicsContext"
]

{ #category : #displaying }
DiamondFigure >> displayFilledOn: aGraphicsContext [
	
	aGraphicsContext paint: self fillColor.
	aGraphicsContext displayPolygon: self points	"at: self center."
]

{ #category : #displaying }
DiamondFigure >> displayOutlineOn: aGraphicsContext [
	
	aGraphicsContext lineWidth: self lineWidth.
	aGraphicsContext paint: self lineColor.
	aGraphicsContext displayPolyline: self points
]

{ #category : #accessing }
DiamondFigure >> handles [
	
	| handles transitionHandle |
	handles := ((1 to: self points size - 1)
		collect: [:i | TrackHandle pointAtIndex: i of: self]) asOrderedCollection.
	transitionHandle := Handle connectionOn: self at: #center.
	handles add: transitionHandle.
	transitionHandle fillColor: ColorValue blue.
	transitionHandle lineColor: ColorValue blue.
	^handles
]

{ #category : #accessing }
DiamondFigure >> id [
	
	^id
]

{ #category : #accessing }
DiamondFigure >> id: anObject [
	
	id := anObject
]

{ #category : #'initialize-release' }
DiamondFigure >> initialize [
	
	model ifNil: [super initialize].
	self model: DecisionPointModel new.
	bounds := 0 @ 0 extent: 10 @ 10.
	self opaque.
	self defaultAttributes.
	self moveable: true
]

{ #category : #'initialize-release' }
DiamondFigure >> initializeForClass: anEntityClass [
	
	self model setActivityChoicesFrom: anEntityClass
]

{ #category : #connection }
DiamondFigure >> isAlreadyConnected [
	
	^(self model outgoingTrue isNil | self model outgoingFalse isNil) not
]

{ #category : #testing }
DiamondFigure >> isDiamondFigure [
	
	^true
]

{ #category : #menu }
DiamondFigure >> menuAt: aPoint [
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
DiamondFigure >> model [
	
	model ifNil: [model := DecisionPointModel new].
	^model
]

{ #category : #updating }
DiamondFigure >> recomputePreferredBounds [
	
	| scaleFactor scaledPolyline |
	self points isEmpty ifTrue: [^self bounds].
	scaleFactor := (100
		min:
			(self model selectedActivity value asComposedText extent + (10 @ 10)) x)
		/ self bounds extent x max: 0.2.
	scaledPolyline := self asGeometric scaledBy: scaleFactor.
	scaledPolyline := scaledPolyline
		translatedBy: 1 * (self bounds center - scaledPolyline bounds center).
	self points: scaledPolyline vertices.
	^super recomputePreferredBounds
]

{ #category : #'initialize-release' }
DiamondFigure >> resetFigure [
	
	self
		computePreferredBounds;
		translateTo: model position
]

{ #category : #printing }
DiamondFigure >> storeOn: aStream [
	
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
DiamondFigure >> update: anAspectSymbol with: aParameter from: aSender [
	
	anAspectSymbol == #name ifTrue: [^self recomputePreferredBounds].
	anAspectSymbol = #deleted ifTrue: [^self deletionUpdateFrom: aSender].
	^super update: anAspectSymbol with: aParameter from: aSender
]
