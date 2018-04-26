probes
makeProbeTyped: probeType using: aProbeRecord at: selectionRange method: probedMethod
	"Prompts the user to select a probe and returns an Association where the key is the probe
	and the value is the conditional flag."
	
	| probe probeRecord |
	probeRecord := aProbeRecord isNil
		ifTrue: [probedMethod probeRecordFor: selectionRange]
		ifFalse: [aProbeRecord].
	probeType == #Breakpoint ifTrue: [probe := CodeProbe new].
	probeType == #Variable
		ifTrue:
			[probe := self
				promptForProbeVariableClass: self selectedClass
				method: probedMethod
				record: probeRecord.
			probe isNil ifTrue: [^nil]].
	probeType == #Expression ifTrue: [probe := DisplayActionProbe new].
	probe record: probeRecord.
	^probe