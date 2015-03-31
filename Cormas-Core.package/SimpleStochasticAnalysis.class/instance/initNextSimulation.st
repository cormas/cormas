simulation
initNextSimulation
	"Incrementes simNumero by 1.
	If in a Repeat loop, initialize the model otherwise return Nil"
	
	self simNumero: self simNumero + 1.
	(self nbOfRepeat value = 0 and: [self simNumero > 1]) ifTrue: [^nil].
	self nbOfRepeat value = 0
		ifFalse:
			[self simNumero > self nbOfRepeat value ifTrue: [^nil].
			self simNumero > self totalSimNumberWithRepeat ifTrue: [self halt]].
	self initRandomSeed.
	self initSimulation