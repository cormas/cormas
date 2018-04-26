- displaying
joinSegments2: aCollecOfLineSegments
	"clp juin 2000, revu PB Fev 2002"
	"Prend en parametre une collection de LineSegments et 
	retourne la collection des noeuds de la ligne brisee"
	
	| vertices firstSegment segment |
	vertices := OrderedCollection new.
	firstSegment := aCollecOfLineSegments first.
	segment := firstSegment.
	vertices
		add: segment start;
		add: segment end.
	aCollecOfLineSegments remove: segment.
	[segment end = firstSegment start]
		whileFalse:
			[segment := aCollecOfLineSegments
				detect: [:s | s start = segment end]
				ifNone: [nil].
			segment isNil not
				ifTrue:
					[vertices add: segment end.
					aCollecOfLineSegments remove: segment]
				ifFalse: [self halt]].
	^vertices