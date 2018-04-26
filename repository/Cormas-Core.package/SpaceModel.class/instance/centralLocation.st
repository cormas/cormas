ESE (regular) - special locations
centralLocation
	(line even or: [ column even ])
		ifTrue: [ ^ self cormas warn: 'Grid dimensions is not odd' ].
	^ self elementaryEntities at: (line * column / 2) asInteger + 1