actions
connect
	
	| mode |
	self brokerStarted ifFalse: [^Dialog warn: 'No broker started'].
	mode := self distributedMode value.
	mode ifNil: [^Dialog warn: 'Choose a distributed mode (Server or Client)'].
	mode = #client ifTrue: [^self connectAsClient].
	mode = #server ifTrue: [^self connectAsServer].
	^self error: 'Internal problem : unknown mode'