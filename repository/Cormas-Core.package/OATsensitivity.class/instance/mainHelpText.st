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
	text := text , 'The ' asText.
	text := text
		,
			('OAT (''One-Factor-At-A-Time'') analysis ' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text
		,
			'is usefull for the study of the signature of the model parameters.\'
				asText.
	text := text
		,
			'It allows to conduct One factor At a Time sensitivity analysis by modifying parameters'' values. It means that the parameter sets are not crossed during analysis. 
Each studied parameter may be analysed by changing its initial value for each simulation run.\\'
				asText.
	text := text
		, 'The OAT (One factor At a Time) analysis is usefull for ' asText.
	text := text
		,
			'the study of the signature of the model parameters.\-------------------------------------------------------------------------------------------\'
				withCRs asText.
	^text