help
mainHelpText
	
	| text |
	text := super mainHelpText.
	text := text , 'The ' asText.
	text := text
		,
			('Crossed analysis ' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text
		,
			'is usefull to study the reaction of the model to several and simultaneous modifications of its parameters. '
				withCRs asText.
	text := text
		,
			'The Crossed Analysis is similar to OAT Analysis but the selected parameter values are crossed.\-------------------------------------------------------------------------------------------\'
				asText.
	^text