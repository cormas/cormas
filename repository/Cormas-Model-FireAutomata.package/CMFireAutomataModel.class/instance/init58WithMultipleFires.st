init
init58WithMultipleFires

	self initCells: #init58.
	1 to: 10 do: [:i | self pickCell state: #fire].
	