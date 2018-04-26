init
openReplayWin
	
	| directoryContent name firstStep |
	self terminateAllProcesses.
	directoryContent := (Cormas dumpPath: self cormasModel class name)
		directoryContents asOrderedCollection.
	directoryContent
		removeAllSuchThat:
			[:txt | 
			(txt
				startingAt: 1
				couldComplete: self simNameStart) not].
	directoryContent isEmpty
		ifTrue:
			[^Dialog warn: 'The ''Dump'' folder does not contain any stored simulation'].
	name := directoryContent
		detect: [:txt | txt = self simName]
		ifNone: [directoryContent first].
	self simName: name.
	name := Dialog
		requestDirectoryName: 'Choose a ''Dump'' Directory:'
		default: ((Cormas dumpPath: self cormasModel class name) construct: name).
	name isEmpty ifTrue: [^nil].
	self simFolder: name asFilename.
	self simNumero: self simNumero + 1.
	self enableBackward: true.
	directoryContent := name asFilename directoryContents asOrderedCollection.
	directoryContent
		removeAllSuchThat:
			[:txt | 
			(txt
				startingAt: 1
				couldComplete: self stepNameStart) not].
	directoryContent isEmpty
		ifTrue:
			[^Dialog
				warn:
					'The '' ' , name , ' '' folder does not contain any stored simulation'].
	self traceSize: directoryContent size - 1.
	self traceSize > 1
		ifTrue:
			[self simButtonAt: #replayRunForward displayActivated: true.
			self simButtonAt: #replayStepForward displayActivated: true].
	firstStep := self getStepNumberOfBosFilename: directoryContent first.
	firstStep > 0
		ifTrue:
			[Dialog warn: 'The replay will starts at step ' , firstStep printString].
	self currentTime: firstStep.
	self cormas cycle value: self traceSize + firstStep.
	self cormasModel spaceModel ifNil: [self cormasModel initializeSpaceModel].
	self replayStepForward: firstStep