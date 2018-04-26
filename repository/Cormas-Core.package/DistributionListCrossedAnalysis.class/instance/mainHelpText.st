help
mainHelpText
	
	| text |
	text := super mainHelpText.
	text := text
		,
			('Distribution List' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text ,
			' means that this parameter will change its value from a given List defined by the user.\'.
	text := text ,
			'Each parameter can be modified from a Distribution List made of numbers.\'.
	text := text ,
			'To set this list, just write the Numbers separated by blank space or '';'' \Example: \'.
	text := text
		, ('	1 2 3 3.2 3.4 3.5 6 9 20' withCRs asText emphasizeAllWith: #bold).
	text := text , '\	or:\ '.
	text := text
		,
			('	1; 2; 3; 3,2; 3,4; 3,5;6;9;20' withCRs asText emphasizeAllWith: #bold).
	text := text ,
			'.\For each set of parameters'' values, N simulations can be repeated.'.
	text := text ,
			'\The selected probes are stored as time series or/and the mean values (according to Record as:).\'.
	^text