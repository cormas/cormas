accessing from entity references
findRegisteredFigureFor: anEntityReference
	
	| dict |
	dict := self figuresByReference
		at: anEntityReference entityId
		ifAbsent: [^nil].
	^dict
		at: anEntityReference entityClass
		ifAbsent: [nil]