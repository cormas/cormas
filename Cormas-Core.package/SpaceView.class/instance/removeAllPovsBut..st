adding-removing
removeAllPovsBut: targetPovs
	"removes a ll the displayed Figures but keeps the targetFigures of the targetPovs"
	
	| targetFigs |
	targetFigs := self components
		select:
			[:fig | (targetPovs collect: [:povx | povx entity]) includes: fig model entity].
	targetFigs isEmpty
		ifTrue:
			[targetFigs := OrderedCollection with: targetPovs first dependents last].
	self removeAllFiguresBut: targetFigs