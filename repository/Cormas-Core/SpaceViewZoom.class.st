Class {
	#name : #SpaceViewZoom,
	#superclass : #SpaceView,
	#instVars : [
		'zoomFactor',
		'translationVector'
	],
	#category : 'Cormas-Core-Space'
}

{ #category : #'adding-removing' }
SpaceViewZoom >> add: aFigure [
	
	super add: aFigure.
	aFigure translateBy: self translationVector.
	aFigure scaleBy: self zoomFactor value
]

{ #category : #'adding-removing' }
SpaceViewZoom >> addFigureForOccupantPov: aPov on: aESERef [
	"Add the Figures of the Agent's POV.
Figures are adapted to my bounds and located on the center of the cell even if it is not loaded"
	
	| aCloneFig patchBounds aPoint |
	patchBounds := (self spaceModel elementaryEntitiesDefaultPovs
		at: aESERef entityId) bounds.
	aCloneFig := aPov asFigure.	"aCloneFig scaleBy: (patchBounds extent / PovSetter standardCellBounds extent)."
	self addFigure: aCloneFig.
	aPoint := aCloneFig calculateNewPositionOnPatchBounds: patchBounds.	"aCloneFig moveTo: (aPoint * self zoomFactor value). "
	self moveOccupant: aCloneFig to: aPoint.	"(self model trackedFigureTypes includes:aPov entityReference entityClass name) ifTrue:[aFig track]."
	aPov infoName = #nil ifFalse: [aCloneFig setText: aPov infoResult].
	self entityFiguresAt: aPov put: aCloneFig.
	^aCloneFig
]

{ #category : #zooming }
SpaceViewZoom >> applyZoom [
	
	| doZoom doTranslate |
	zoomFactor = 1 | (zoomFactor = (1 @ 1))
		ifTrue: [doZoom := false]
		ifFalse: [doZoom := true].
	translationVector = (0 @ 0)
		ifTrue: [doTranslate := false]
		ifFalse: [doTranslate := true].
	self components
		do:
			[:fig | 
			doTranslate ifTrue: [fig translateBy: translationVector].
			doZoom ifTrue: [fig scaleBy: zoomFactor]]
]

{ #category : #accessing }
SpaceViewZoom >> displayedFigures [
	
	^self figuresIn: self bounds
]

{ #category : #adapting }
SpaceViewZoom >> moveOccupant: occupantFigure to: absolutePoint [
	"Move origin of occupantFigure to aPoint x scaleFactor x zoomFactor."
	
	| lineFigures |
	"add a new point to the tracker as the last position"
	lineFigures := occupantFigure dependents
		select: [:f | f isKindOf: TrackFigure].
	lineFigures
		do:
			[:lf | 
			lf
				addPoint: occupantFigure center
				beforeIndex: lf pointsSize.
			lf testAndRemoveOrigine].	"move the figure"
	occupantFigure
		translateTo:
			(absolutePoint * self scaleFactor + self translationVector)
				* self zoomFactor
]

{ #category : #selection }
SpaceViewZoom >> selections [
	
	^selections
]

{ #category : #accessing }
SpaceViewZoom >> translationVector [
	
	^translationVector ifNil: [translationVector := 1]
]

{ #category : #accessing }
SpaceViewZoom >> translationVector: anObject [
	
	translationVector := anObject
]

{ #category : #accessing }
SpaceViewZoom >> zoomFactor [
	
	^zoomFactor ifNil: [zoomFactor := 1]
]

{ #category : #accessing }
SpaceViewZoom >> zoomFactor: anObject [
	
	zoomFactor := anObject
]

{ #category : #zooming }
SpaceViewZoom >> zoomProportionalTo: aSetOfPovs [
	"Change the bounds of the spaceView components in order to fit to the bounds of the targetPov bur keeping the shapes of the figure"
	
	| aRectangle targetFigs |
	targetFigs := self components
		select:
			[:fig | (aSetOfPovs collect: [:povx | povx entity]) includes: fig model entity].
	targetFigs isEmpty
		ifTrue:
			[targetFigs := OrderedCollection with: aSetOfPovs first dependents last].
	aRectangle := targetFigs first insetBounds.
	targetFigs do: [:fig | aRectangle := aRectangle merge: fig insetBounds].
	translationVector := self bounds origin - aRectangle origin.
	zoomFactor := (self bounds extent - (1 @ 1)) / aRectangle extent.
	zoomFactor := zoomFactor x min: zoomFactor y.
	zoomFactor := zoomFactor @ zoomFactor.
	self applyZoom
]

{ #category : #zooming }
SpaceViewZoom >> zoomProportionalTo: aSetOfPovs maximumBounds: maxBounds [
	"Change the bounds of the spaceView components in order to fit to the bounds of the targetPov bur keeping the shapes of the figure"
	
	| aRectangle targetFigs largeur hauteur |
	targetFigs := self components
		select:
			[:fig | (aSetOfPovs collect: [:povx | povx entity]) includes: fig model entity].
	targetFigs isEmpty
		ifTrue:
			[targetFigs := OrderedCollection with: aSetOfPovs first dependents last].
	aRectangle := targetFigs first insetBounds.
	targetFigs do: [:fig | aRectangle := aRectangle merge: fig insetBounds].
	translationVector := self bounds origin - aRectangle origin.
	largeur := self bounds extent x min: maxBounds extent x.
	hauteur := self bounds extent y min: maxBounds extent y.
	zoomFactor := (largeur @ hauteur - (1 @ 1)) / aRectangle extent.
	zoomFactor := zoomFactor x min: zoomFactor y.
	zoomFactor := zoomFactor @ zoomFactor.
	self applyZoom
]

{ #category : #zooming }
SpaceViewZoom >> zoomTo: aSetOfPovs [
	"Change the bounds of the spaceView components in order to fit to the bounds of the targetPov bur keeping the shapes of the figure"
	
	| aRectangle targetFigs |
	targetFigs := self components
		select:
			[:fig | (aSetOfPovs collect: [:povx | povx entity]) includes: fig model entity].
	targetFigs isEmpty
		ifTrue:
			[targetFigs := OrderedCollection with: aSetOfPovs first dependents last].
	aRectangle := targetFigs first insetBounds.
	targetFigs do: [:fig | aRectangle := aRectangle merge: fig insetBounds].	"aRectangle origin: (aRectangle origin - 1)."	"aRectangle := aRectangle expandedBy: 1."
	translationVector := self bounds origin - aRectangle origin.
	zoomFactor := (self bounds extent - (1 @ 1)) / aRectangle extent.
	self applyZoom
]
