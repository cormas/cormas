aVirer
adaptImageAndText
	
	self halt.
	self pov = #nil ifTrue: [^self].
	self info = #nil
		ifFalse: [self setText: (self model getInfoFor: self info)]	"self info = #nil 
		ifTrue: 
			[newImage := self model getImageForPov: pov.
			self model == newImage ifTrue: [^self].
			self model changeFor: newImage]
		ifFalse: 
			[newImage := self model getImageForPov: pov stringForInfo: info. 
			self model == newImage first ifFalse: [self model changeFor: newImage].
			self setText: newImage last]"