accessing
trackedFigureTypes
	"a Collection containing #Class name of the tracked Entities"
	
	^trackedFigureTypes ifNil: [trackedFigureTypes := OrderedCollection new]