accessing-Figures
removeEntityFigure: aFigure
	"remove aFigure from the figuresByReference & entityFigures dictionaries"
	
	| key |
	aFigure model ifNil: [^nil].
	self unregisterFigure: aFigure.
	key := (self entityFigures
		at: aFigure entityType
		ifAbsent: [^nil])
		keyAtValue: aFigure
		ifAbsent: [^nil].
	(self entityFigures at: aFigure entityType)
		removeKey: key
		ifAbsent: [^nil]