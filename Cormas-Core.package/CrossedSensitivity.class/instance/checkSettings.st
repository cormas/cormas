actions_buttons
checkSettings
	"return self if ok"
	
	super checkSettings = self ifFalse: [^nil].
	self parametersToAnalyse size < 2
		ifTrue:
			[^self cormas warn: 'There should be at least 2 attributes to analyse']