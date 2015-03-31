adding-removing
removeAllSpatialFiguresBut: aClass
	"remove the figures of the SpatialFigure but keep the figures of aClass AND the agregates figures which POV = delimitors"
	
	| classes |
	self model activeSpatialEntity: aClass.
	classes := self model spatialClasses copy.
	classes remove: aClass.
	classes
		removeAllSuchThat:
			[:cl | (self model povMethodDico at: cl name) = #delimitors].
	classes do: [:cl | self removeAll: (self figuresOfEntity: cl)]