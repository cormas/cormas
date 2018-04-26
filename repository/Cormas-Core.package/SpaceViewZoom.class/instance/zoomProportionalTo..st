zooming
zoomProportionalTo: aSetOfPovs
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