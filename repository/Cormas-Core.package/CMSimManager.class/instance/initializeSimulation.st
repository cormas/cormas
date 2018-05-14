init
initializeSimulation
	self setSimName.
	self simFolder: nil.
	self simNumero: self simNumero + 1.
	self traceSize: 0.
	self flag: #shouldBeRevised.
	"the 2 following instructions are the responsability of the CMSpecSimulationWindow  isn't it?
	self allReplayButtonsTo: false.
	self finalTime > 0 ifTrue: [self simButtonAt: #run displayActivated: true]."
	self initRandomSeed.
	"The 2 following instructions replace the old cormas-vw instruction self cormas initiSimulation ( which was delegating the init simulation to cormas). Now it is the simManger which is in charge of initializing the simulation"
	self cormasModel activeInit isNil
		ifTrue: [ ^ self cormas alert_NoInit ].
	Cursor wait showWhile: [ self cormasModel initSimulation ].
	self flag: #shouldBeRevised
	"the  following instruction is not yet operational with cormas-pharo
	self enableBackward ifTrue: [self storeCurrentStep]"