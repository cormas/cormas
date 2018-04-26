main menu
snapshotModel
	"Snapshot the current simulation state as BOS file. Time is temporary set to 0, in order to use the BOS file as initial state of further simulations"
	
	self cormasModel ifNil: [^Dialog warn: 'No model'].
	self simManager snapshotCurrentState