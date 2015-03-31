help
help
	
	| text |
	self probeFormat selections isEmpty ifTrue: [^nil].
	text := 'Help: \ \' withCRs asText emphasizeAllWith: #bold.
	self probeFormat selections
		do:
			[:f | 
			text := text
				,
					((f , ': \') asText emphasizeAllWith:
							#(#bold #italic #color #-> #ColorValue #red)) asText.
			f = 'time series'
				ifTrue:
					[text := text ,
							'Save each selected probe as time serie values for each simulation \ \'].
			f = 'average per simulation'
				ifTrue:
					[text := text ,
							'Save each selected probe as average value per simulation \ \'].
			f = 'average on period...'
				ifTrue:
					[text := text ,
							'Save each selected probe as time serie values over a given period (between step1 and step2) \ \'].
			f = 'averaged over repetitions'
				ifTrue:
					[text := text ,
							'Save each selected probe as time serie averaged over the repetition.
Each stored value at time T is the average of the probe value at T over the X repetions of the parameters set. \ \']].
	self cormas warn: text withCRs asText