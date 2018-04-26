- obsolete
setImage4
	
	| vertices mainPolyline epiderme |
	OrderedCollection new.
	self halt.
	epiderme := self getEpidermis.
	vertices := OrderedCollection new.
	epiderme do: [:c | vertices addAll: c image component asPolyline vertices].
	mainPolyline := Polyline vertices: vertices.
	self image: mainPolyline