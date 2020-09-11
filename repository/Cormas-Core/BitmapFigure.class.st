Class {
	#name : #BitmapFigure,
	#superclass : #Object,
	#instVars : [
		'bitmap',
		'ratio',
		'scale',
		'cacheScaleFactor'
	],
	#category : #'Cormas-Core-Interface'
}

{ #category : #displaying }
BitmapFigure >> adaptColorAndText [
	"do nothing except for the info"
	
	self pov = #nil ifTrue: [^self].
	self info = #nil
		ifFalse: [self setText: (self model entity getInfoFor: info)]
]

{ #category : #accessing }
BitmapFigure >> bitmap [
	
	^bitmap
]

{ #category : #accessing }
BitmapFigure >> bitmap: aBitmap [
	"store the full original bitmap"
	
	^self
		bitmap: aBitmap
		ratio: 1 @ 1
]

{ #category : #accessing }
BitmapFigure >> bitmap: aBitmap ratio: aPoint [
	"store the full original bitmap and a logical ratio that should be used for displaying"
	
	cache := bitmap := aBitmap.
	ratio := aPoint.
	cacheScaleFactor := 1.
	self computeCache
]

{ #category : #accessing }
BitmapFigure >> cache: aBitmap [
	
	cache := aBitmap
]

{ #category : #transforming }
BitmapFigure >> calculateNewPositionOnPatchBounds: patchBounds [
	"return the position Point where the POV should be placed"

	| positionName adaptedPatchBounds diagonal origin |
	positionName := self model position.	"	positionName = #topLeft ifTrue: [^patchBounds topLeft]."
	diagonal := self bounds extent * self model sizeRatio.
	origin := 0 @ 0.
	self flag:#TODO.
	"trop penible cet histoire de placement d un bitmap. A revoir...."
	"	(diagonal x > patchBounds extent x) ifTrue:[origin x: diagonal x - 5].
	(diagonal y > patchBounds extent y) ifTrue:[origin y: diagonal y - 5].
	Point when the fig is on a border (positionName starts with #border_) "
	(positionName copyFrom: 1 to: 6) = 'border'
		ifTrue: [ ^ (patchBounds translatedBy: diagonal / -2)
				perform: (positionName copyFrom: 8 to: positionName size) asSymbol ].	"otherwise, into the cell"
	adaptedPatchBounds := patchBounds
		insetOriginBy: origin
		cornerBy: diagonal.	"adaptedPatchBounds := patchBounds translatedBy: diagonal / -2."
	positionName = #random
		ifTrue: [ ^ (Cormas
				simpleRandomFrom: adaptedPatchBounds origin x
				to: adaptedPatchBounds corner x)
				@
					(Cormas
						simpleRandomFrom: adaptedPatchBounds origin y
						to: adaptedPatchBounds corner y) ].
	^ adaptedPatchBounds perform: positionName
]

{ #category : #aVirer }
BitmapFigure >> changeWith: anOtherCoordinate [
	"This message is sent when a figure (self) is being deleted and replaced by anOtherCoordinate. The old one (self) is removed from SpaceView and the new one is added"
	
	self deprecated: 'If it doesnt break nothing. This method will disappear in the next version'.
	self changed: #replace with: anOtherCoordinate
]

{ #category : #accessing }
BitmapFigure >> computeCache [
	"recompute a cache using bitmap and ratio.
	resizing the bitmap requiert integer ratio.
	keep actual cache scale avoiding unecessary resize.
	"
	
	| s scaleFactor |
	s := self ratio * self scale.
	scaleFactor := s x min: s y.
	scaleFactor >= 1
		ifTrue:
			[scaleFactor := scaleFactor rounded.
			scaleFactor = cacheScaleFactor
				ifFalse:
					[cache := self bitmap magnifiedBy: scaleFactor asPoint.
					cacheScaleFactor := scaleFactor]]
		ifFalse:
			[scaleFactor := (1 / scaleFactor) rounded.
			1 / scaleFactor = cacheScaleFactor
				ifFalse:
					[cache := self bitmap shrunkenBy: scaleFactor asPoint.
					cacheScaleFactor := 1 / scaleFactor]].
	self setBoundsTo: self cache bounds
]

{ #category : #connection }
BitmapFigure >> connectionFigureClass [
	"The type of figure that we should use for connections"
	
	^TrackFigure
]

{ #category : #displaying }
BitmapFigure >> displayFigureOn: aGraphicsContext [
	
	super displayFigureOn: aGraphicsContext.
	self displayInfoOn: aGraphicsContext
]

{ #category : #displaying }
BitmapFigure >> displayInfoOn: aGraphicsContext [
	
	self info = #nil
		ifFalse:
			[infoText translateTo: self bounds origin.
			infoText displayFigureOn: aGraphicsContext]
]

{ #category : #'bounds accessing' }
BitmapFigure >> insetBounds [
	"just return the bounds"
	
	^self bounds
]

{ #category : #testing }
BitmapFigure >> isBitmapFigure [
	
	^true
]

{ #category : #testing }
BitmapFigure >> isMoveable [
	
	self container model siConfig
		ifNil: [^self entityType isSpatialClass not]
		ifNotNil:
			[^self container model siConfig canBeMovedFor: self model entity class]
]

{ #category : #manipulate }
BitmapFigure >> isTranslatedBy: aPoint [
	
	self isMoveable ifTrue: [self translateBy: aPoint]
]

{ #category : #menu }
BitmapFigure >> menuAt: aPoint [
	"Figures have a menu that pops-up when clicked on by the yellow mouse button."
	
	| aMenuBuilder |
	aMenuBuilder := MenuBuilder new.	"menu for the local chart"
	aMenuBuilder add: 'chart' -> #openLocalChart.	"menu for the local INFO"
	self addInfoMenuTo: aMenuBuilder.	"menu for the local TRACK"
	self isMoveable ifTrue: [aMenuBuilder add: 'track' -> #trackFigure].	"menu for the model (image and Entity)"
	aMenuBuilder
		line;
		add: 'inspect...' -> #inspectEntity;
		add: 'visual inspector' -> #visualInspector;
		line.	"menu for changing color and line of the figure itself"	"NOT APPLICABLE To BitmapFigures"
	aMenuBuilder line.
	self addPoVMenuTo: aMenuBuilder.	"		aMenuBuilder line.
		aMenuBuilder add: 'fill color' -> #chooseFillColor.
		self addLineWidthMenuTo: aMenuBuilder.
		aMenuBuilder add: 'line color' -> #chooseLineColor."
	self addModelMenuTo: aMenuBuilder at: aPoint.
	^aMenuBuilder menu
]

{ #category : #accessing }
BitmapFigure >> model: anImage [
	
	model := anImage.
	self invalidate
]

{ #category : #accessing }
BitmapFigure >> ratio [
	
	^ratio ifNil: [1 @ 1]
]

{ #category : #accessing }
BitmapFigure >> ratio: aPoint [
	"set a ratio which should be applyed to bitmap before displaying"
	
	| newRatio |
	newRatio := aPoint asPoint.
	newRatio = ratio
		ifFalse:
			[ratio := newRatio.
			self computeCache]
]

{ #category : #transforming }
BitmapFigure >> release [
	
	self model removeDependent: self.
	self removeDependent: self model
]

{ #category : #accessing }
BitmapFigure >> scale [
	"a second ratio applied by the figure"
	
	^scale ifNil: [scale := 1 @ 1]
]

{ #category : #changing }
BitmapFigure >> scale: aPoint [
	
	scale := aPoint.
	self computeCache
]

{ #category : #changing }
BitmapFigure >> scaleBy: aPoint [
	"on augmente par le min (x ou y) du point seulement si il est + grand que 2, sinon, on ne fait rien.
on a besoin d'un seul nbre entier positif : 
magnifiedBy: scale ou shrunkenBy: scale et Scale X and Y must be integers"
	"Transcript cr; show: 'scaleBy: '; print: aPoint; show: ' (oldScale: '; print: self scale; nextPut:$)."
	
	self scale: self scale * aPoint
]

{ #category : #changing }
BitmapFigure >> scaleByWithAnswer: aPoint [
	"on augmente par le min (x ou y) du point seulement si il est + grand que 2, sinon, on ne fait rien.
on a besoin d'un seul nbre entier positif : 
magnifiedBy: scale ou shrunkenBy: scale et Scale X and Y must be integers"
	
	| min |
	min := aPoint isReal
		ifTrue: [aPoint]
		ifFalse: [aPoint x min: aPoint y].
	min > 1
		ifTrue:
			[min := min rounded.
			min > 1
				ifTrue:
					[cache := cache magnifiedBy: min @ min.
					^true]]
		ifFalse:
			[min := (1 / min) rounded.
			min > 1
				ifTrue:
					[cache := cache shrunkenBy: min @ min.
					^true]].
	^false
]

{ #category : #changing }
BitmapFigure >> scaleByWithConstraints: aPoint [
	
	self scale: aPoint
]
