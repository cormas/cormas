callbacks
requestStoredSims: directoryContent

	| cmSimName dumpDir |
	cmSimName := directoryContent
		detect: [ : txt | txt = self simName ]
		ifNone: [ directoryContent first ].
	self simName: cmSimName.
	(dumpDir := self 
		requestDirectoryName: self translator tChooseDumpDir
		from: ((self application dumpPath: self cormasModel class name) / cmSimName)) isEmpty
			ifFalse: [ self requestStepSim: dumpDir ].