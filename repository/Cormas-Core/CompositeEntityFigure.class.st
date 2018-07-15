Class {
	#name : #CompositeEntityFigure,
	#superclass : #Object,
	#instVars : [
		'delimitors'
	],
	#category : 'Cormas-Core-Interface'
}

{ #category : #new }
CompositeEntityFigure class >> newFrom: aSetOfPovs [
	
	| newFigure |
	newFigure := self new.
	newFigure addAll: (aSetOfPovs collect: [:pov | pov asFigure]).
	^newFigure
]

{ #category : #new }
CompositeEntityFigure class >> newFromPOV: aComposedPOV [
	
	| inst |
	inst := self newFrom: aComposedPOV components.
	inst delimitors add: aComposedPOV outline.
	inst delimitors addAll: aComposedPOV internalLines.
	^inst
]

{ #category : #'add-remove' }
CompositeEntityFigure >> add: aFigure [
	
	aFigure opaque.
	aFigure lineWidth: 0.
	^super add: aFigure
]

{ #category : #'add-remove' }
CompositeEntityFigure >> addAll: aCollection [
	"For efficiency"
	
	aCollection isEmpty ifTrue: [^aCollection].
	aCollection
		do:
			[:fig | 
			fig opaque.
			fig lineWidth: 0].
	^super addAll: aCollection
]

{ #category : #transforming }
CompositeEntityFigure >> asCompositeFigure [
	
	^self
]

{ #category : #transforming }
CompositeEntityFigure >> asGeometrics [
	"returns a collection of Polylines. The first one is the external Polyline."
	
	| coll |
	coll := OrderedCollection new.
	self delimitors do: [:points | coll add: (Polyline vertices: points)].
	^coll
]

{ #category : #accessing }
CompositeEntityFigure >> attributes: aFigureAttributes [
	
	attributes := aFigureAttributes
]

{ #category : #transforming }
CompositeEntityFigure >> basicTranslateBy: aPoint [
	"il faut aussi transferrer les contours de l'agr√©gat"
	
	| newDelimitors |
	super basicTranslateBy: aPoint.
	newDelimitors := OrderedCollection new: self delimitors size.
	self delimitors
		do: [:aPolyline | newDelimitors add: (aPolyline translatedBy: aPoint)].
	self delimitors: newDelimitors
]

{ #category : #accessing }
CompositeEntityFigure >> celluleFigureAt: point [
	"returns the elementary figure of this component figure at point."
	
	| cellFig |
	cellFig := self components
		detect: [:fig | fig containsPoint: point]
		ifNone: [nil].
	cellFig ifNil: [^nil].
	cellFig entityType isSpatialEntityElementClass
		ifTrue: [^cellFig]
		ifFalse: [^cellFig celluleFigureAt: point]
]

{ #category : #connection }
CompositeEntityFigure >> connectionFigureClass [
	"The type of figure that we should use for connections"
	
	^TrackFigure
]

{ #category : #accessing }
CompositeEntityFigure >> delimitors [
	"returns a collection of collections of points, in order to build the Polylines. The first one is the external collection of points."
	
	^delimitors ifNil: [delimitors := OrderedCollection new]
]

{ #category : #accessing }
CompositeEntityFigure >> delimitors: anObject [
	
	delimitors := anObject
]

{ #category : #displaying }
CompositeEntityFigure >> displayFigureOn: aGraphicsContext [
	
	self isOpaque ifTrue: [super displayFigureOn: aGraphicsContext].	"display the delimitors"	"self model entity id = 14 ifTrue:[self halt]."
	self lineWidth > 0
		ifTrue:
			[aGraphicsContext lineWidth: self lineWidth.
			aGraphicsContext paint: self lineColor.
			self delimitors
				do: [:aPolyline | aPolyline displayStrokedOn: aGraphicsContext]].	"display the text info"
	self displayInfoOn: aGraphicsContext
]

{ #category : #displaying }
CompositeEntityFigure >> displayInfoOn: aGraphicsContext [
	
	self info = #nil ifTrue: [^nil].
	[infoText
		translateTo: self bounds center - ((self info size / 2) ceiling @ 12)]
		on: GenericException
		do: [:ex | nil].
	self pov = #delimitors
		ifTrue: [infoText lineColor: ColorValue black]
		ifFalse:
			[self fillColor brightness < 0.4
				ifTrue: [infoText lineColor: ColorValue white]
				ifFalse: [infoText lineColor: ColorValue black]].
	infoText displayFigureOn: aGraphicsContext
]

{ #category : #accessing }
CompositeEntityFigure >> figureAt: point [
	"redefined in order to access the subfigures in case the Composite figure shows only its outlines"
	
	self isOpaque ifFalse: [^nil].
	^super figureAt: point
]

{ #category : #'attribute accessing' }
CompositeEntityFigure >> fillColor: aColor [
	
	self components do: [:fig | fig fillColor: aColor].
	super fillColor: aColor
]

{ #category : #'bounds accessing' }
CompositeEntityFigure >> insetBounds [
	"return the bounds of the figure's points, without the extension"
	
	| rect |
	components isEmpty ifTrue: [^0 @ 0 extent: 0 @ 0].
	rect := components first insetBounds.
	2
		to: components size
		do: [:i | rect := rect merge: (components at: i) insetBounds].
	^rect	"	| rect |
	rect := points inject: (points first extent: 0 @ 0)
				into: 
					[:sum :point | 
					sum
						origin: (sum origin min: point);
						corner: (sum corner max: point)].
	^rect"	"^self bounds"
]

{ #category : #testing }
CompositeEntityFigure >> isCompositeEntityFigure [
	
	^true
]

{ #category : #testing }
CompositeEntityFigure >> isMoveable [
	
	^self entityType isSpatialClass not
]

{ #category : #manipulate }
CompositeEntityFigure >> isTranslatedBy: aPoint [
	"not moveable"
	
	self isMoveable ifTrue: [self translateBy: aPoint]
]

{ #category : #accessing }
CompositeEntityFigure >> lineColor [
	
	^(attributes isNil or: [attributes lineColor isNil])
		ifTrue:
			[container isNil
				ifTrue: [self fillColor]
				ifFalse: [container lineColor]]
		ifFalse: [attributes lineColor]
]

{ #category : #'attribute accessing' }
CompositeEntityFigure >> lineColor: aColorValue [
	
	self attributes lineColor: aColorValue.
	self invalidate
]

{ #category : #'attribute accessing' }
CompositeEntityFigure >> lineWidth: anInteger [
	"| set |
	set := Set new. 
	self components do:[:c| set addAll: c points].
	StrokingWrapper on: (Polyline vertices: set)."
	
	self attributes lineWidth: anInteger.
	self recomputePreferredBounds
]

{ #category : #menu }
CompositeEntityFigure >> menuAt: aPoint [
	"Figures have a menu that pops-up when clicked on by the yellow mouse button."
	
	| aMenuBuilder |
	aMenuBuilder := MenuBuilder new.	"menu for the local chart"
	aMenuBuilder add: 'chart' -> #openLocalChart.
	self isMoveable ifTrue: [aMenuBuilder add: 'track' -> #trackFigure].	"menu for the local zoom window"
	self entityType isSpatialClass
		ifTrue: [aMenuBuilder add: 'zoom' -> #openZoom].	"menu for the model (image and Entity)"
	aMenuBuilder
		line;
		add: 'inspect...' -> #inspectEntity;
		add: 'visual inspector' -> #visualInspector;
		line.
	self addModelMenuTo: aMenuBuilder at: aPoint.
	^aMenuBuilder menu
]

{ #category : #accessing }
CompositeEntityFigure >> model: anImage [
	
	model := anImage.	"	model addDependent: self."
	self invalidate	"Tell the controller where to send menu messages."	"self controller performer: anOriginalFigure"
]

{ #category : #'attribute accessing' }
CompositeEntityFigure >> moveable: aBoolean [
	
	self components do: [:fig | fig moveable: aBoolean].
	super moveable: aBoolean
]

{ #category : #accessing }
CompositeEntityFigure >> points [
	
	^self delimitors first vertices
]

{ #category : #accessing }
CompositeEntityFigure >> pov: aSelector [
	
	aSelector = #nil
		ifTrue: [self isOpaque ifTrue: [self transparent]]
		ifFalse: [self isOpaque ifFalse: [self opaque]].
	pov := aSelector
]

{ #category : #transforming }
CompositeEntityFigure >> scaleBy: aScaleFactor [
	"Answer a new object scaled by the argument amount, which can be
	a Point or a scalar value."
	
	| newDelimitors |
	self components do: [:fig | fig scaleBy: aScaleFactor].
	newDelimitors := OrderedCollection new: self delimitors size.
	self delimitors
		do: [:line | newDelimitors add: (line scaledBy: aScaleFactor)].
	delimitors := newDelimitors.
	self recomputePreferredBounds
]

{ #category : #transforming }
CompositeEntityFigure >> scaleByWithAnswer: aScaleFactor [
	
	self scaleBy: aScaleFactor.
	^true
]

{ #category : #transforming }
CompositeEntityFigure >> scaleByWithConstraints: aScaleFactor [
	"Answer a new object scaled by aScaleFactor, which can be
	a Point or a scalar value."
	
	self scaleBy: aScaleFactor
]

{ #category : #'attribute accessing' }
CompositeEntityFigure >> transparent [
	
	self components do: [:c | c transparent].
	super transparent
]

{ #category : #changing }
CompositeEntityFigure >> update: anAspectSymbol with: aParameter from: aSender [
	"Somebody has justed changed. If it is as a result of a deletion dependent then it will be #deleted."
	
	anAspectSymbol = #stroked
		ifTrue:
			[^aParameter
				ifTrue: [self transparent]
				ifFalse: [self opaque]].
	anAspectSymbol = #lineWidth ifTrue: [^self lineWidth: aParameter].
	anAspectSymbol = #lineColor ifTrue: [^self lineColor: aParameter].
	super update: anAspectSymbol with: aParameter from: aSender
]
