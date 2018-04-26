private - irregular polygons creation
setBounds: allPolygons
	
	| entity origin corner |
	allPolygons isEmpty ifTrue: [^nil].
	entity := allPolygons first class.
	origin := allPolygons first bounds origin.
	corner := allPolygons first bounds corner.
	allPolygons
		do:
			[:b | 
			origin := b bounds origin min: origin.
			corner := b bounds corner max: corner].
	entity bounds: (Rectangle origin: origin corner: corner)