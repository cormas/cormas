actions_buttons
warnExplanations
	
	| text |
	text := 'The analysis to classify the parameters of the model will be preformed in 2 sessions: \ \'
		withCRs asText emphasizeAllWith: #bold.
	text := text
		,
			('1) Standard simulations to store the probes'' outputs for the standard specifications of the attributes \'
				withCRs asText emphasizeAllWith: #(#italic)).
	text := text , '    then \ ' withCRs asText.
	text := text
		,
			('2) Several simulations to store the probes'' outputs for the new values of the attributes \'
				withCRs asText emphasizeAllWith: #(#italic)) withCRs asText.
	^Dialog warn: text asText