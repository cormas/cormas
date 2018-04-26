private
displayOn: aGC
	
	(Circle
		center: self bounds extent / 2
		radius: r) asFiller
		displayOn: (aGC paint: (ColorValue perform: #royalBlue)).
	e asStroker
		displayOn: (aGC paint: (ColorValue perform: #black))
		at: self bounds extent / 2.
	f asStroker
		displayOn: (aGC paint: (ColorValue perform: #red))
		at: self bounds extent / 2