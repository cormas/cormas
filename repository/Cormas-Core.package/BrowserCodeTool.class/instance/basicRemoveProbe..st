probes
basicRemoveProbe: aProbe
	
	| probedMethod replacementMethod |
	probedMethod := self selectedMethod.
	probedMethod totalProbes = 1 ifTrue: [^probedMethod revert].
	replacementMethod := probedMethod newFullProbedMethod.
	replacementMethod removeProbe: aProbe.
	probedMethod mclass
		addSelector: self selector
		withMethod: replacementMethod