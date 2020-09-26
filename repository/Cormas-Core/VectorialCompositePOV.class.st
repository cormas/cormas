Class {
	#name : #VectorialCompositePOV,
	#superclass : #VectorialPOV,
	#instVars : [
		'components'
	],
	#category : #'Cormas-Core-Interface'
}

{ #category : #viewCorrespondance }
VectorialCompositePOV class >> asFigure [
	
	^CompositeEntityFigure
]

{ #category : #'instance creation' }
VectorialCompositePOV class >> newFrom: aSetOfPovs [
	
	| inst |
	inst := self new.
	inst addAll: aSetOfPovs.
	inst setDelimitors.
	^inst
]

{ #category : #'instance creation' }
VectorialCompositePOV class >> newFromFigures: aSetOfFigures [
	"Recursivite, non test√© !!!!"
	
	| inst aSetOfImages |
	inst := self new.
	aSetOfImages := aSetOfFigures
		collect:
			[:figure | 
			(figure isKindOf: CompositeFigure)
				ifTrue: [VectorialCompositePOV newFromFigures: figure components]
				ifFalse:
					[VectorialElementaryPOV
						new:
							((Polyline vertices: figure points) translatedBy: figure center negated)]].
	inst addAll: aSetOfImages.
	^inst
]

{ #category : #private }
VectorialCompositePOV >> asFigure [
	
	| instFigure |
	"	instFigure := self class asFigure newFromPOV: self ."
	instFigure := CompositeEntityFigure newFromPOV: self.
	instFigure model: self.
	self isStroked
		ifFalse:
			[instFigure
				opaque;
				fillColor: self color]
		ifTrue: [instFigure transparent].
	instFigure scaleBy: self sizeRatio.
	instFigure lineWidth: self lineWidth.
	instFigure lineColor: self lineColor.
	^instFigure
]

{ #category : #private }
VectorialCompositePOV >> asFigure_basic [
	
	^self class asFigure newFromPOV: self
]

{ #category : #accessing }
VectorialCompositePOV >> bounds [
	
	^self asFigure_basic bounds
]

{ #category : #changed }
VectorialCompositePOV >> changeWith: anOtherCompositePOV [
	"This message is sent when a figure (self) is being deleted or if shape has changed with anOtherCompositePOV. The old one (self) is removed from SpaceView and the new one is added"
	
	anOtherCompositePOV setDelimitors.
	super changeWith: anOtherCompositePOV
]

{ #category : #accessing }
VectorialCompositePOV >> color [
	
	^ color 
		ifNil: [ color := Color green ]
]

{ #category : #accessing }
VectorialCompositePOV >> components [
	
	^components ifNil: [components := OrderedCollection new]
]

{ #category : #accessing }
VectorialCompositePOV >> components: anObject [
	
	components := anObject
]

{ #category : #delimitors }
VectorialCompositePOV >> getPointsFromSegments: segmentsColl [
	"returns a collection of points from a collectin of connected segments. The segmentsColl is reduced"
	
	| points initialSegment |
	points := OrderedCollection new.
	initialSegment := segmentsColl first.
	segmentsColl remove: initialSegment.
	points
		add: initialSegment start;
		add: initialSegment end.
	[initialSegment isNil or: [segmentsColl isEmpty]]
		whileFalse:
			[initialSegment := segmentsColl
				detect: [:seg | seg start = initialSegment end]
				ifNone: [nil].
			initialSegment isNil
				ifFalse:
					[segmentsColl remove: initialSegment.
					points last = initialSegment start
						ifFalse: [points add: initialSegment start]]].
	points add: points first copy.
	^points
]

{ #category : #testing }
VectorialCompositePOV >> isVectorialCompositePOV [
	
	^true
]

{ #category : #delimitors }
VectorialCompositePOV >> setDelimitors [
	"outline = external Polyline.
internalLines  = collection of Polylines. nbSegments lineWidth "
	
	| allSegments duplicates |
	allSegments := OrderedCollection new.	"roundedOutline, car 2 points qui semblent identiques (m√™me valeur de x et y) ne sont pas √©gaux: x et y sont convertis en Double avant d'etre compar√©s"
	self components
		do:
			[:aPov | 
			aPov roundedOutline
				edgesDo: [:i :j | allSegments add: (LineSegment from: i to: j)]].	"Lines with equal endpoints but opposite directions will be also removed"
	duplicates := Set new.
	allSegments
		do:
			[:seg1 | 
			allSegments
				do:
					[:seg2 | 
					seg1 == seg2
						ifFalse:
							[((seg1 start = seg2 start and: [seg1 end = seg2 end])
								or:
									[(seg1 start = seg2 end and: [seg1 end = seg2 start])
										or: [seg1 end = seg2 start and: [seg1 start = seg2 end]]])
								ifTrue:
									[duplicates
										add: seg1;
										add: seg2]]]].
	allSegments removeAll: duplicates.	"outline = contour externe. on prend les points successifs en partant du 1er point"
	outline := GPolygon newVertices: (self getPointsFromSegments: allSegments).	"internalLines = les contours internes d'un agregat de type anneau. on prend les points successifs en partant du 1er point"
	[allSegments isEmpty]
		whileFalse: [
			self internalLines add: ( GPolygon newVertices: (self getPointsFromSegments: allSegments))]
]
