testing
isLastSimOfRepeat
	"answer if the current simulation is the last sim of a repeat loop"
	
	self nbOfRepeat value < 2 ifTrue: [^true].
	^(self simNumero / self nbOfRepeat value) isInteger