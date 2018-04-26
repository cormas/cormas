help
mainHelpText
	
	| text |
	text := super mainHelpText.
	text := text
		,
			('Monte Carlo' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text ,
			' means that this parameter will change its value randomly within an interval (from Min to Max).\'.
	text := text ,
			'At each simulation, a new value is set for the analysed parameter (the other being fixed with their standard values).\'.
	text := text ,
			'To set this analysis, just write the Min, the Max and the Repetition values for each parameter to analyse.\'.
	text := text ,
			'\The selected probes are stored as time series or/and the mean values (according to Record as:).\'.
	^text