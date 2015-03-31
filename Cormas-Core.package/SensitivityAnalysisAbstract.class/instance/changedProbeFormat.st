aspects
changedProbeFormat
	
	| aMultiSelectionSequenceView minMax |
	(self probeFormat selections includes: 'average on period...')
		ifFalse:
			[averagePeriod := nil.
			(self builder componentAt: #periodLabel) beInvisible.
			^(self builder componentAt: #periodField) beInvisible].
	aMultiSelectionSequenceView := self probeFormat listHolder dependents
		detect: [:dep | dep isKindOf: MultiSelectionSequenceView]
		ifNone: [^nil].
	(aMultiSelectionSequenceView sequence
		at: aMultiSelectionSequenceView lastSelectionIndex) =
			'average on period...' ifFalse: [^nil].
	self finalStep value <= 0
		ifTrue:
			[self cormas warn:
					'Please, enter a final step to set the simulation duration'.
			^aMultiSelectionSequenceView
				retractSelectionIndex: aMultiSelectionSequenceView lastSelectionIndex].
	minMax := OneParameterWindow new.
	minMax openInterface: #periodDialog.
	minMax accept value
		ifFalse:
			[^aMultiSelectionSequenceView
				retractSelectionIndex: aMultiSelectionSequenceView lastSelectionIndex].
	averagePeriod := List
		with: minMax parameterInitialValue value
		with: minMax parameterFinalValue value.
	averagePeriod first < averagePeriod last
		ifFalse:
			[self cormas warn: 'Please, set a final step upper than the inital step'.
			^self changedProbeFormat].
	averagePeriod first < 0
		ifTrue:
			[self cormas warn: 'Please, set a positive inital step value'.
			^self changedProbeFormat].
	averagePeriod last > self timeSteps size
		ifTrue:
			[self cormas
				warn:
					'Final step is upper than the simulation duration<n>Final step will be setted to: <1s>'
				with: self finalStep value asString.
			averagePeriod
				at: 2
				put: self finalStep value].
	self periodField
		value:
			'[' , averagePeriod first asString , ' ' , averagePeriod last asString ,
					']'.
	(self builder componentAt: #periodLabel) beVisible.
	(self builder componentAt: #periodField) beVisible