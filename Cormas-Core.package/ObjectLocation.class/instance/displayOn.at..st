- displaying
displayOn: aGC at: unPoint
	
	self halt	"self povs2 isNil
		ifFalse: 
			[(self class image) color: (self class colorsDict at: self povs2 ifAbsent:[^nil]);
				displayOn: aGC at: unPoint]"