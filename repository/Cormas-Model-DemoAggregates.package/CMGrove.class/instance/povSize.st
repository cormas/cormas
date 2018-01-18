pov
povSize
	
	self components size < 50 ifTrue: [^#small].
	self components size < 250 ifTrue: [^#medium].
	^#big