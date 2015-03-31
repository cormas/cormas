- displaying
joinSegments_PB: aCollecOfLineSegments
	"clp juin 2000, revu PB Fev 2002"
	"Prend en parametre une collection de LineSegments et 
	retourne la collection des noeuds de la ligne brisee"
	
	| vertices firstSegment segment endLoop |
	vertices := OrderedCollection new.
	firstSegment := aCollecOfLineSegments first.
	segment := firstSegment.
	vertices
		add: segment start;
		add: segment end.
	aCollecOfLineSegments remove: segment.
	endLoop := false.
	["[segment end = firstSegment start] whileFalse: ds le cas de la connexite = 8 il faut aussi verifier que 'firstSegment start' est un point qui n'appartient pas a d'autres segments. correction PB"
	endLoop]
		whileFalse:
			[segment := aCollecOfLineSegments
				detect: [:s | s start = segment end]
				ifNone: [nil].
			segment isNil not
				ifTrue:
					[vertices add: segment end.
					aCollecOfLineSegments remove: segment]
				ifFalse: [self halt].
			endLoop := segment end = firstSegment start	"and: [(aCollecOfLineSegments contains: [:s | s start = segment end]) not]"].
	^vertices