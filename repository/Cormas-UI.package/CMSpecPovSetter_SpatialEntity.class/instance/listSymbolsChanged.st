changed
listSymbolsChanged
	
	couleur := super listSymbolsChanged.
	couleur ifNil: [^self]	"	w := (self builder componentAt: #imageOS) widget.
	(imageOS model)
		wp: w bounds asFiller;
		color: couleur.
	imageOS displayOn: w graphicsContext"