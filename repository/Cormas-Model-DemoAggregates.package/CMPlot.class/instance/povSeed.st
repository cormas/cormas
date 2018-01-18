pov
povSeed
	
	self isSeed ifTrue: [^#seed].
	(self myCSE: CMGrove) isNil
		ifFalse: [^(self theCSE at: #CMGrove) colorId]
		ifTrue: [^#empty]