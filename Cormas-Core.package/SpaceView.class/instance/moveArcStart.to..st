adding-removing
moveArcStart: aArcRef to: startCellReference
	"First detects the arcFigure that match aArcRef on this spaceView,
	If the Nodes are displayed, then put the start position of the arc fig to the center of the Node FIg, 
	otherwise move the start point to it position into the figure matching the startCellReference"
	
	| aFig absolutePoint patchBounds startNodeFig |
	aFig := self findRegisteredFigureFor: aArcRef.
	aFig
		ifNil:
			[aFig := self findFigureFor: aArcRef.
			aFig ifNil: [^nil]].
	aFig container ifNil: [^self release].
	startNodeFig := self
		findRegisteredFigureFor: (EntityReference on: aArcRef entity startNode).
	startNodeFig
		ifNil:
			[startNodeFig := self
				findFigureFor: (EntityReference on: aArcRef entity startNode)].
	startNodeFig isNil
		ifTrue:
			[patchBounds := (self spaceModel elementaryEntitiesDefaultPovs
				at: startCellReference entityId) bounds.
			absolutePoint := aFig calculateNewStartPositionOnPatchBounds:
					patchBounds.
			aFig startPoint: absolutePoint * self scaleFactor	"aFig startPoint: absolutePoint * localContainer scaleFactor * localContainer zoomFactor + (localContainer translationVector * localContainer zoomFactor)"]
		ifFalse: [aFig startPoint: startNodeFig center]