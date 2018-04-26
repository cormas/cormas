callbacks
requestStepSim: simName directory: dumpDir 

	| directoryContent firstStep |
	self simFolder: simName.
	self simNumero: self simNumero + 1.
	self enableBackward: true.

	directoryContent := simName asFileReference entries.
	(directoryContent removeAllSuchThat: [ : txt | (txt beginsWith: self stepNameStart) not]) isEmpty
		ifTrue: [ ^ self alertMessage: simName , self translator tNoStoredSimFolder ].

	self traceSize: directoryContent size - 1.
	self traceSize > 1
		ifTrue: [ 
			self simButtonAt: #replayRunForward displayActivated: true.
			self simButtonAt: #replayStepForward displayActivated: true ].

	(firstStep := self getStepNumberOfBosFilename: directoryContent first) > 0
		ifTrue: [ self alertMessage: self translator tReplayStartStep , firstStep printString ].
	self currentTime: firstStep.
	self cormas cycle value: self traceSize + firstStep.
	self cormasModel spaceModel ifNil: [ self cormasModel initializeSpaceModel ].
	self replayStepForward: firstStep