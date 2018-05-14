deprecated
initSimulation
"This method is obsolete. In cormas-pharo init simulation is managed by the simManger (and not by cormas)"
	| pop |
	self halt.
	self cormasModel ifNil: [ ^ nil ].
	self releaseProcess.
	self cormasModel activeInit isNil
		ifTrue: [ ^ self alert_NoInit ].	"xmlModel isNil
		ifFalse: 
			[xmlModel release.
			xmlModel := nil]."	"Load the XML file if we export the log or if we use an external visualization module"
	(self useExternalVisualization or: [ self exportPlaybackLog ])
		ifTrue: [ xmlModel := XMLModel with: self cormasModel.
			useExternalVisualization
				ifTrue:
					[ "Contact external visualization module via XML-RPC" xmlModel connectToExternalVisualizer ].
			exportPlaybackLog
				ifTrue: [ "Open playback log stream" xmlModel openPlaybackLog ] ]
		ifFalse: [ xmlModel := nil ].
	Cursor wait
		showWhile: [ "self stepCounter value: 0."
			self cormasModel initSimulation.
			pop := self cormasModel theAgentsComm.
			self makeVideo.
			self obsWin notNil
				ifTrue: [ self obsWin populationSource: pop.
					self obsWin msgObs: self cormasModelClass messages ] ].
	useExternalVisualization
		ifTrue:
			[ "Send initial map to external visualization module via XML-RPC" xmlModel sendMapToExternalVisualizer ]