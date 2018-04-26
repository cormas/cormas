actions_buttons
checkSettings
	"return self if ok"
	
	self nbOfRepeat value < 1
		ifTrue: [^self cormas warn: 'Please, enter the number of repetitions'].
	self finalStep value > 0
		ifFalse:
			[^self cormas warn:
					'Please, enter a final step to set the duration of each simulation'].
	self listProbes selections isEmpty
		ifTrue: [^self cormas warn: 'Please, select one probe, at least'].
	self fileFormat value isEmpty
		ifTrue: [^self cormas warn: 'Please, choose the file output format'].
	self listInit selection isEmpty
		ifTrue: [^self cormas warn: 'Please, select an init method'].
	self listControle selection isEmpty
		ifTrue: [^self cormas warn: 'Please, select a step method'].
	self probeFormat selections isEmpty
		ifTrue: [^self cormas warn: 'Please, select one probe format, at least']