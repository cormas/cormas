adding-removing
registerFigure: aFigure
	
	| ref |
	aFigure model ifNil: [^nil].
	ref := aFigure model entityReference.
	(self figuresByReference
		at: ref entityId
		ifAbsentPut: [Dictionary new])
		at: ref entityClass
		put: aFigure