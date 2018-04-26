help
mainHelpText
	
	| text |
	text := super mainHelpText.
	text := text , '\Each parameter can be modified from a '.
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
			'.\Thus, for 2 parameters, let''s say 
		X (initValue: 1 ; finalValue: 3 ; increment: 1) and 
		Y (initValue: 0 ; finalValue: 1 ; increment: 0.1), 
then 30 simulations (3 x 10) will be runned.'.
	text := text ,
			'.\Of course, for each set of parameters'' values, N simulations can be repeated.'.
	text := text ,
			'\The selected probes are stored as time series or/and the mean values (according to Record as:).\'.
	^text