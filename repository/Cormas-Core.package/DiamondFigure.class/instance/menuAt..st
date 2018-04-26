menu
menuAt: aPoint
	"Figures have a menu that pops-up when clicked on by the yellow mouse button."
	
	| mb |
	mb := MenuBuilder new.
	mb
		add: 'set activity...' -> #openActivitySetter;
		add: 'show Code' -> #inspectCode;
		add: 'inspect...' -> #inspect;
		line.
	mb
		addCopyCutPaste;
		line.
	self addLineColorMenuTo: mb.
	self addFillColorMenuTo: mb.
	self addLineWidthMenuTo: mb.	"finalize"
	self addModelMenuTo: mb at: aPoint.
	^mb menu