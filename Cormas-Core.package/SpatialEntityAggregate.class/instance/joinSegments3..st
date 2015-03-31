- displaying
joinSegments3: aCollecOfLineSegments
	"clp juin 2000, revu PB Fev 2002"
	"Prend en parametre une collection de LineSegments et 
	retourne la collection des noeuds de la ligne brisee"
	" !! Recursive !!"
	
	| vertices firstSegment segment segments |
	vertices := OrderedCollection new.
	firstSegment := aCollecOfLineSegments first.
	segment := firstSegment.
	vertices
		add: segment start;
		add: segment end.
	aCollecOfLineSegments remove: segment.
	[segment end = firstSegment start or: [aCollecOfLineSegments isEmpty]]
		whileFalse:
			[segments := aCollecOfLineSegments select: [:s | s start = segment end].
			segment := segments at: 1.
			vertices add: segment end.
			aCollecOfLineSegments remove: segment	"segments size > 1 ifTrue: [^vertices addAll: (self joinSegments: aCollecOfLineSegments)]"].
	aCollecOfLineSegments isEmpty
		ifTrue: [^vertices]
		ifFalse:
			[vertices addAll: (self joinSegments: aCollecOfLineSegments).
			^vertices]	" !! Recursive !!"