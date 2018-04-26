deprecated
displayOn: aGC at: unPoint

self deprecated:'Should be deprecated in the next CORMAS version'.
self halt
	"| couleur |
	couleur := self color.
	couleur notNil ifTrue: 
			[self class image class = EntityPOV
				ifTrue: [self class image color: couleur]. 
			self class image displayOn: aGC at: unPoint]"