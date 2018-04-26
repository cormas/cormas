help
mainHelpText
	"
	text := 'Purpose for Monte Carlo OAT Analysis: \ \' withCRs asText emphasizeAllWith: #bold.
	 text := text , 'The ' asText.
	 text := text , ('OAT (''One-Factor-At-A-Time'') analysis ' asText emphasizeAllWith: #(#bold #italic #color -> ColorValue red)).
	 text := text , 'is usefull for the study of the signature of the model parameters.\' asText.
	 text := text , 'It allows to conduct One factor At a Time sensitivity analysis by modifying parameters'' values. It means that the parameter sets are not crossed during analysis. 
Each studied parameter may be analysed by changing its initial value for each simulation run.\\' asText."
	
	| text |
	text := super mainHelpText.
	text := text , 'Each parameter can be modified from a '.
	text := text
		,
			('Start value' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text , ' to a '.
	text := text
		,
			('Final value' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text , '. For each simulation, its value is increased by '.
	text := text
		,
			('Increment' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text ,
			'.\For each set of parameters'' values, N simulations can be repeated.'.
	text := text ,
			'\The selected probes are stored as time series or/and the mean values (according to Record as:).\'.
	^text