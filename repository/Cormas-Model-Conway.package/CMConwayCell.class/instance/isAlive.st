probes
isAlive
	self state = #alive
		ifTrue: [ ^ 1 ].
	^ 0