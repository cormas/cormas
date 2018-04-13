control
newState
	| nbOfAlives |
	nbOfAlives := self neighbourhood count: [ :n | n state = #alive ].
	self state = #dead & (nbOfAlives = 3)
		ifTrue: [ ^ self bufferState: #alive ].
	(self state = #alive and: [ nbOfAlives = 2 or: [ nbOfAlives = 3 ] ])
		ifTrue: [ ^ self bufferState: #alive ].
	^ self bufferState: #dead