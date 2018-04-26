testing
hasStoredSimulations
	" Answer <true> if the dump folder has stored simulations "

	| directoryContent |
	self terminateAllProcesses.
	(directoryContent := Cormas dumpPath: self cormasModel class name)
		removeAllSuchThat: [ : txt | (txt beginsWith: self simNameStart) not ].
	^ directoryContent isEmpty