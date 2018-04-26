help
mainHelp
	
	| text |
	text := 'Purpose for Simple Stochastic Analysis: \ \' withCRs asText
		emphasizeAllWith: #bold.
	text := text , 'This analysis is usefull for ' asText.
	text := text
		,
			('stochastic model' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text ,
			'.\Starting from identical initial conditions and from identical parameters'' values, N simulations are repeated.'.
	text := text ,
			'\The selected probes are stored as time series, and the mean values of the probes are saved at each time step.\'.
	self cormas warn: text withCRs asText