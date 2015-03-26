probes
findSelectedProbeEmphasisIn: aText from: aController
	
	^PDPManager
		findSelectedProbeEmphasisIn:
			(aText
				copyFrom: aController selectionStartIndex
				to: aController selectionStopIndex + 1)