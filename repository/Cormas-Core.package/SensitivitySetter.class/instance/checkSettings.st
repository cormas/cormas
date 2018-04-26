actions_buttons
checkSettings
	"return self if ok"
	
	self finalStep value > 0
		ifFalse:
			[^self cormas warn:
					'Please, enter a final step to set the duration of each simulation'].
	self listProbes selections isEmpty
		ifTrue: [^self cormas warn: 'Please, select one probe, at least'].
	self fileFormat value isEmpty
		ifTrue: [^self cormas warn: 'Please, choose the file output format'].
	self initMethod value isEmpty
		ifTrue: [^self cormas warn: 'Please, select an init method'].
	self stepMethod value isEmpty
		ifTrue: [^self cormas warn: 'Please, select a step method'].
	self probeFormat selections isEmpty
		ifTrue: [^self cormas warn: 'Please, select one probe format, at least'].
	self
		parametersToAnalyse:
			(self classAttribValue_List list
				select: [:defAttrib | defAttrib hasBeenModified]).
	self parametersToAnalyse isEmpty
		ifTrue:
			[(self cormas confirm:
					'There is no attribute to analyse.
OK to continue?') ifFalse: [^false]].
	self classAttribValueAnalysis_List list: self parametersToAnalyse