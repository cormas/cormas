adding-removing
unregisterFigure: aFigure
	"remove aFigure from the figuresByReference dictionary"
	
	| ref dict |
	ref := aFigure model entityReference.
	dict := self figuresByReference
		at: ref entityId
		ifAbsent: [^nil].
	dict
		removeKey: ref entityClass
		ifAbsent: [nil]