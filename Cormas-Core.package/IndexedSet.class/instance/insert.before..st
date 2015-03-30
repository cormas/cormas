private
insert: anObject before: spot
	
	(self includes: anObject) ifFalse: [^super insert: anObject before: spot].
	^anObject