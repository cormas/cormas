changed
listSymbolsChanged
	
	| anImage |
	self listSymbols selection ifNil: [^nil].
	anImage := selectedClass imageAtPov: listSymbols selection asSymbol.
	imageOS model: anImage copy.
	imageOS figure: imageOS model asFigure.
	couleur := super listSymbolsChanged.
	imageOS model color: couleur.
	self startAnnotation value: anImage startAnnotation.
	self stopAnnotation value: anImage stopAnnotation.
	self lineWidth value: anImage lineWidth.
	imageOS invalidate