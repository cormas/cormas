controle
newState
	
	| nbOfAlives |
	nbOfAlives := (self neighbourhood select: [:n | n state = #alive]) size.
	self state = #dead & (nbOfAlives = 3) ifTrue: [^self bufferState: #alive].
	(self state = #alive and: [nbOfAlives = 2 or: [nbOfAlives = 3]])
		ifTrue: [^self bufferState: #alive].
	^self bufferState: #dead