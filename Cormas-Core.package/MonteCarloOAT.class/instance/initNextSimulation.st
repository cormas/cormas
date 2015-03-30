simulation
initNextSimulation
	"Incrementes simNumero by 1.
	Updates the values of the attributs of 
	the model (CormasModel) and initialize the model. Then updates 
	the 	values of the attributs of the entities"
	
	self simNumero: self simNumero + 1.
	self setNextAttributeValue ifNil: [^nil].
	self simNumero > self totalSimNumberWithRepeat ifTrue: [^nil].
	self initRandomSeed.
	self initSimulation