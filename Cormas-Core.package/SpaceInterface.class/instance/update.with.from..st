updating
update: anAspectSymbol with: aParameter from: aSender
	"Somebody has justed changed. If it is as a result of a deletion dependent then it will be #deleted."
	
	anAspectSymbol = #noticeChanges
		ifTrue:
			[aParameter isEmpty ifTrue: [^self].
			aParameter do: [:aChange | self noticeChange: aChange].
			^Cormas refresh: self].
	anAspectSymbol = #noticeChange
		ifTrue:
			[self noticeChange: aParameter.
			^Cormas refresh: self].
	anAspectSymbol = #changePov
		ifTrue:
			[^self
				changePov: aParameter povName
				ofEntity: aParameter entityClass].
	anAspectSymbol = #removeAllFigures
		ifTrue: [^self drawing removeAllFigures].
	anAspectSymbol = #openedSpatialGridsForHabitus:
		ifTrue:
			[^self
				registerInto: aParameter value
				forHabitus: aParameter key].	" hack : avoid isKindOf: when getting SpaceInterface from openedSpatialGrid"
	anAspectSymbol = #timeChanged ifTrue: [^self timeChanged].
	anAspectSymbol = #backgroundColor
		ifTrue: [^self drawing fillColor: aParameter].
	anAspectSymbol = #delimitorSize ifTrue: [^self perform: aParameter].
	anAspectSymbol = #newCells
		ifTrue:
			[self displayGrid.
			^self updateWindowName].
	anAspectSymbol = #newAggregates
		ifTrue:
			[self displayCompoundSpatialEntityClass: aParameter.	"= class"
			^self updateWindowName].
	anAspectSymbol = #shapeHasChanged
		ifTrue:
			[self adaptMenuForNewShape.
			^self updateWindowName].
	anAspectSymbol = #removeAllCompoundSpatialEntityFigures
		ifTrue: [^self drawing removeAllCompoundSpatialEntityFigures].
	anAspectSymbol = #boundariesChanged ifTrue: [^self boundariesChanged].
	anAspectSymbol = #closeRequest ifTrue: [^self closeRequest].
	anAspectSymbol = #snapGridTimeForMovie
		ifTrue:
			[^self
				snapGridTimeForMovie: aParameter first
				makingMovie: aParameter last].
	anAspectSymbol = #listMethodsChanged ifTrue: [^self listMethodsChanged].
	anAspectSymbol = #loadSilentltySIConfigName
		ifTrue:
			[aParameter key = self
				ifTrue: [^self loadSilentltySIConfigName: aParameter value]].
	super update: anAspectSymbol with: aParameter from: aSender