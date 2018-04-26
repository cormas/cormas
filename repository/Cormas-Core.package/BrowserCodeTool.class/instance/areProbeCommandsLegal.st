probes
areProbeCommandsLegal
	
	^self selectors size = 1 and: [self textController textHasChanged not]