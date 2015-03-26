attribute accessing
fillColor: aColor
	
	self components do: [:fig | fig fillColor: aColor].
	super fillColor: aColor