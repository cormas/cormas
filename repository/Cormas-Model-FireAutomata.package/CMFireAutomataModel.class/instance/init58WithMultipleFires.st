init
init58WithMultipleFires

	self initCells: #init58.
	1 to: self numberOfFires  do: [:i | self pickCell state: #fire].
	