control
step

	self consumeEnergy.
	self move.
	self eat.
	self isEnergyHigh ifTrue: [self reproduce].
	self isEnergyTooLow ifTrue:[self die]