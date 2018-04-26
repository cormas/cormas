simulation
initNextSimulation
	"Incrementes simNumero by 1.
	If not in a Repeat loop, it updates the values of the attributs of 
	the model (CormasModel) and initialize the model. Then updates 
	the 	values of the attributs of the entities"
	
	self simNumero: self simNumero + 1.
	(self simNumero = 1 or: [self isRepeating not])
		ifTrue:
			[self classAttribValueAnalysis_List list isEmpty
				ifTrue: [self simNumero > self totalSimNumberWithRepeat ifTrue: [^nil]]
				ifFalse: [self setNextAttributeValue ifNil: [^nil]]].
	self simNumero > self totalSimNumberWithRepeat ifTrue: [^nil].
	self initRandomSeed.
	self initSimulation