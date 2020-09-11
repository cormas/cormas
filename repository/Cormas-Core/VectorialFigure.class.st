Class {
	#name : #VectorialFigure,
	#superclass : #Object,
	#instVars : [
		'isDistortable'
	],
	#category : #'Cormas-Core-Interface'
}

{ #category : #new }
VectorialFigure class >> copyFrom: anOtherSEcoordinates [
	"return a copy of anOtherSEcoordinates"
	
	^anOtherSEcoordinates copy
]

{ #category : #new }
VectorialFigure class >> new: aPolyline [
	
	^self new points: aPolyline vertices
]

{ #category : #new }
VectorialFigure class >> newFromPOV: anImage [
	
	^self new: anImage polyline
]

{ #category : #displaying }
VectorialFigure >> adaptColorAndText [
	"Fill the figure. The agent is appearing for the first time. Color has to be asked to the entity"
	
	| color |
	"	self pov = #nil ifTrue: [^self].
	self info = #nil
		ifTrue: 
			[color := self model getColorForPov: pov.
			self fillColor: color]
		ifFalse: 
			[color := self model getColorForPov: pov stringForInfo: info. optimisation pour distribution: 1 seule requete plut√¥t que 2
			self fillColor: color first.
			self setText: color last]. "
	self pov = #nil ifTrue: [^self].
	self info = #nil ifFalse: [self setText: self infoText].
	self invalidate
]

{ #category : #adding }
VectorialFigure >> addPoint: aPoint [
	
	points := points copyWith: aPoint.
	self updatePreferredBoundsWith: aPoint.
	^aPoint
]

{ #category : #adding }
VectorialFigure >> addPoint: aPoint beforeIndex: aPosition [
	
	| copy |
	(self isDistortable not
		and:
			[self container class = SpaceView | (self container class = SpaceViewZoom)])
		ifTrue: [^self].
	copy := Array new: points size + 1.
	1
		to: aPosition - 1
		do:
			[:i | 
			copy
				at: i
				put: (points at: i)].
	copy at: aPosition put: aPoint.
	aPosition
		to: points size
		do:
			[:i | 
			copy
				at: i + 1
				put: (points at: i)].
	points := copy.
	self updatePreferredBoundsWith: aPoint.
	^aPoint
]

{ #category : #transforming }
VectorialFigure >> asCompositeFigure [
	
	| aCompositeFigure |
	aCompositeFigure := CompositeEntityFigure new.
	aCompositeFigure add: self.
	aCompositeFigure entityType: self entityType.
	aCompositeFigure model: self model.
	^aCompositeFigure
]

{ #category : #accessing }
VectorialFigure >> attributes: aFigureAttributes [
	
	attributes := aFigureAttributes
]

{ #category : #transforming }
VectorialFigure >> calculateNewPositionOnPatchBounds: absolutePatchBounds [
	"return the position Point (an absolute Point) where the POV should be placed"
	
	| positionName adaptedPatchBounds absoluteExtent |
	positionName := self model position.
	absoluteExtent := self model bounds extent * self model sizeRatio.	"/ self container scaleFactor"	"(absolutePatchBounds extent / PovSetter standardCellBounds extent)."	"Point when the fig is on a border (positionName starts with #border_) "
	(positionName copyFrom: 1 to: 6) = 'border'
		ifTrue:
			[^(absolutePatchBounds translatedBy: absoluteExtent / -2)
				perform:
					(positionName
						copyFrom: 8
						to: positionName size) asSymbol].	"Otherwise, calculate position INTO the cell"
	adaptedPatchBounds := absolutePatchBounds insetOriginBy: 0 cornerBy:
			absoluteExtent.
	positionName = #random
		ifTrue:
			[^(Cormas
				simpleRandomFrom: adaptedPatchBounds origin x
				to: adaptedPatchBounds corner x)
				@
					(Cormas
						simpleRandomFrom: adaptedPatchBounds origin y
						to: adaptedPatchBounds corner y)].
	^adaptedPatchBounds perform: positionName
]

{ #category : #aVirer }
VectorialFigure >> changeWith: anOtherCoordinate [
	"This message is sent when a figure (self) is being deleted and replaced by anOtherCoordinate. The old one (self) is removed from SpaceView and the new one is added"
	
	self deprecated: 'If it doesnt break nothing. This method will disappear in the next version'.

	self changed: #replace with: anOtherCoordinate
]

{ #category : #manipulate }
VectorialFigure >> chooseFillColor [
	
	| color |
	color := PovSetter colorChooser.
	color ifNil: [^nil].
	self fillColor: color
]

{ #category : #manipulate }
VectorialFigure >> chooseLineColor [
	
	| color |
	color := PovSetter colorChooser.
	color ifNil: [^nil].
	self lineColor: color
]

{ #category : #connection }
VectorialFigure >> connectionFigureClass [
	"The type of figure that we should use for connections"
	
	^TrackFigure
]

{ #category : #displaying }
VectorialFigure >> displayFigureOn: aGraphicsContext [
	
	super displayFigureOn: aGraphicsContext.
	self displayInfoOn: aGraphicsContext
]

{ #category : #'initialize-release' }
VectorialFigure >> initialize [
	
	super initialize.
	self moveable: false
]

{ #category : #'bounds accessing' }
VectorialFigure >> insetBounds [
	"return the bounds of the figure's points, without the extension"
	
	| rect |
	rect := points
		inject: (points first extent: 0 @ 0)
		into:
			[:sum :point | 
			sum
				origin: (sum origin min: point);
				corner: (sum corner max: point)].
	^rect
]

{ #category : #testing }
VectorialFigure >> isDistortable [
	
	self container class = VectorialView ifTrue: [^true].
	^isDistortable ifNil: [isDistortable := true]
]

{ #category : #accessing }
VectorialFigure >> isDistortable: anObject [
	
	isDistortable := anObject
]

{ #category : #testing }
VectorialFigure >> isMoveable [
	
	(self entityType inheritsFrom: CMSpatialEntity) ifTrue: [^false].
	self container model siConfig
		ifNotNil: [:aConfig | ^aConfig canBeMovedFor: self model entity class].
	^true
]

{ #category : #manipulate }
VectorialFigure >> isTranslatedBy: aPoint [
	
	self isMoveable ifTrue: [self translateBy: aPoint]
]

{ #category : #accessing }
VectorialFigure >> lineColor [
	
	^(attributes isNil or: [attributes lineColor isNil])
		ifTrue:
			[container isNil
				ifTrue: [self fillColor]
				ifFalse: [container lineColor]]
		ifFalse: [attributes lineColor]
]

{ #category : #accessing }
VectorialFigure >> menuAt: aPoint [
	"Figures have a menu that pops-up when clicked on by the yellow mouse button."
	
	| aMenuBuilder |
	self model entityReference ifNil: [^nil].
	aMenuBuilder := MenuBuilder new.	"menu for the local chart"
	aMenuBuilder add: 'chart' -> #openLocalChart.	"menu for the local INFO"
	self addInfoMenuTo: aMenuBuilder.
	self entityType isSpatialClass
		ifTrue:
			["menu for the local zoom window"
			aMenuBuilder add: 'zoom' -> #openZoom]
		ifFalse:
			["menu for the local TRACK"
			self isMoveable ifTrue: [aMenuBuilder add: 'track' -> #trackFigure]].
	aMenuBuilder line.	"menu for the model (image and Entity)"
	aMenuBuilder
		line;
		add: 'inspect...' -> #inspectEntity;
		add: 'visual inspector' -> #visualInspector;
		line.	"menu for changing color and line of the figure itself"
	aMenuBuilder line.
	self addPoVMenuTo: aMenuBuilder.
	aMenuBuilder add: 'fill color' -> #chooseFillColor.
	self addLineWidthMenuTo: aMenuBuilder.
	aMenuBuilder add: 'line color' -> #chooseLineColor.
	self addModelMenuTo: aMenuBuilder at: aPoint.
	^aMenuBuilder menu
]

{ #category : #accessing }
VectorialFigure >> model: anObject [
	
	model := anObject	"model addDependent: self."	"on ne veut pas de d√©pendance entre le pov et sa figure"	"ni entre la vue et la spaceInterface.
	La spaceInterface a tout fois la fenetre dans ses dependances"
]

{ #category : #transforming }
VectorialFigure >> newPolyline: aPolyline [
	
	| oldBounds |
	oldBounds := self preferredBounds.
	self removePoints.
	self points: aPolyline vertices self recomputePreferredBounds.	"1 to: aPolyline vertices size
		do: [:i | self addPoint: (aPolyline vertices at: i)]."
	self changedPreferredBounds: oldBounds.
	self changed
]

{ #category : #accessing }
VectorialFigure >> pointAt: anIndex put: aValue [
	
	(self isDistortable not
		and:
			[self container class = SpaceView | (self container class = SpaceViewZoom)])
		ifTrue: [^self].
	^super pointAt: anIndex put: aValue
]

{ #category : #accessing }
VectorialFigure >> points [
	
	^points ifNil: [points := #()]
]

{ #category : #'initialize-release' }
VectorialFigure >> points: aCollection [
	
	points := Array withAll: aCollection
]

{ #category : #copying }
VectorialFigure >> postCopy [
	"self class new: (self asGeometric)."
	
	| newFig |
	newFig := super postCopy.
	newFig points: points copy.	"newFig model: self model."
	^newFig
]

{ #category : #accessing }
VectorialFigure >> pov [
	
	^super pov
]

{ #category : #accessing }
VectorialFigure >> pov: aSelector [
	
	aSelector = #nil
		ifTrue: [self isOpaque ifTrue: [self transparent]]
		ifFalse: [self isOpaque ifFalse: [self opaque]].
	pov := aSelector
]

{ #category : #removing }
VectorialFigure >> release [
	
	self model removeDependent: self.
	self removeDependent: self model
]

{ #category : #removing }
VectorialFigure >> removePoints [
	
	self isSelected ifTrue: [self drawing deselectFigure: self].
	points size > 2 ifFalse: [^self].
	points := Array new
]

{ #category : #transforming }
VectorialFigure >> scaleBy: aScaleFactor [
	"Answer a new object scaled by the argument amount, which can be
	a Point or a scalar value."
	
	| scaledPolyline |
	scaledPolyline := self asGeometric scaledBy: aScaleFactor.
	self points: (scaledPolyline vertices collect: [:each | each rounded]).
	self recomputePreferredBounds
]

{ #category : #transforming }
VectorialFigure >> scaleByWithAnswer: aScaleFactor [
	
	self scaleBy: aScaleFactor.
	^true
]

{ #category : #changing }
VectorialFigure >> update: anAspectSymbol with: aParameter from: aSender [
	"Somebody has justed changed. If it is as a result of a deletion dependent then it will be #deleted."
	
	container isNil ifTrue: [^nil].
	anAspectSymbol = #stroked
		ifTrue:
			[^aParameter
				ifTrue: [self transparent]
				ifFalse: [self opaque]].
	anAspectSymbol = #lineWidth ifTrue: [^self lineWidth: aParameter].
	anAspectSymbol = #lineColor ifTrue: [^self lineColor: aParameter].
	anAspectSymbol = #deleted
		ifTrue:
			[(aSender isKindOf: TrackFigure)
				ifTrue: [^nil]
				ifFalse: [^container remove: self]].
	super update: anAspectSymbol with: aParameter from: aSender
]
