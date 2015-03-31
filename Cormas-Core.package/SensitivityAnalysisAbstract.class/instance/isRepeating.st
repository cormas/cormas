testing
isRepeating
	"answer if the current simulation is into a repeat loop"
	
	^((self simNumero - 1) / (self nbOfRepeat value max: 1)) isInteger not