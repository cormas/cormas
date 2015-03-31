- obsolete
displayImageOn: aGC
	
	self components do: [:c | c displayImageOn: (aGC paint: self color)]