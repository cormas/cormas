accessing-simulations
findSimulationNamed: aName
	" Answer <true> if the dump folder has stored simulations "

	^ (Cormas dumpPath: self cormasModel class name)
		removeAllSuchThat: [ : txt | (txt beginsWith: self simNameStart) not ].
