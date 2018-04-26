adding-removing
moveArcStop: aArcRef to: endCellReference
	"First detects the arcFigure that match aArcRef on this spaceView,
	If the Nodes are displayed, then put the stop position of the arc fig to the center of the Node FIg, 
	otherwise move the stop point to it position into the figure matching the endCellReference"
	
	| aFig absolutePoint patchBounds stopNodeFig |
	aFig := self findRegisteredFigureFor: aArcRef.
	aFig
		ifNil:
			[aFig := self findFigureFor: aArcRef.
			aFig ifNil: [^nil]].
	aFig container ifNil: [^self release].
	stopNodeFig := self
		findRegisteredFigureFor: (EntityReference on: aArcRef entity stopNode).
	stopNodeFig
		ifNil:
			[stopNodeFig := self
				findFigureFor: (EntityReference on: aArcRef entity stopNode)].
	stopNodeFig isNil
		ifTrue:
			[patchBounds := (self spaceModel elementaryEntitiesDefaultPovs
				at: endCellReference entityId) bounds.
			absolutePoint := aFig calculateNewStopPositionOnPatchBounds: patchBounds.
			aFig stopPoint: absolutePoint * self scaleFactor.
			aFig entity isCyclic ifTrue: [aFig addTwoPointOutside: patchBounds]	"aFig startPoint: absolutePoint * localContainer scaleFactor * localContainer zoomFactor + (localContainer translationVector * localContainer zoomFactor)"]
		ifFalse:
			[aFig stopPoint: stopNodeFig center.
			aFig entity isCyclic
				ifTrue:
					[| cyclicsArcs |
					cyclicsArcs := stopNodeFig entity cyclicsArcs.
					aFig
						addTwoPointOutside: stopNodeFig bounds
						position:
							(cyclicsArcs
								indexOf: aFig entity
								ifAbsent: [1]) / cyclicsArcs size]]