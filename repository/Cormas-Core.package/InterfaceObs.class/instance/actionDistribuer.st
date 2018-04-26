actions
actionDistribuer
	
	modeleObs isInitialized ifFalse: [^self].
	compteur value: 0.
	modeleObs actionDistribuer