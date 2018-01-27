init
initializeSimulation
	
	self setSimName.
	self simFolder: nil.
	self simNumero: self simNumero + 1.
	self traceSize: 0.
	self allReplayButtonsTo: false.
	self finalTime > 0 ifTrue: [self simButtonAt: #run displayActivated: true].	"self updateCormasInterface."
	self initRandomSeed.
	self cormas initSimulation.
	self enableBackward ifTrue: [self storeCurrentStep]