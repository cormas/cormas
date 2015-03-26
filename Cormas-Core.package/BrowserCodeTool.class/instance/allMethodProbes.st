probes
allMethodProbes
	"Return all probes in the current method, regardless of selection status."
	
	| probedMethod probes |
	probedMethod := self selectedMethod.
	probedMethod isProbed ifFalse: [^#()].
	probes := OrderedCollection new.
	probedMethod allProbesDo: [:each | probes add: each].
	^probes