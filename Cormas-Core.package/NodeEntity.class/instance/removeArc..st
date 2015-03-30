+ add-remove
removeArc: anArc
	
	self arcs
		remove: anArc
		ifAbsent: [nil].
	self arcs isEmpty
		ifTrue:
			[self
				leave;
				destroyed: true].
	self changed