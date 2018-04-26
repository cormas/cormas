displaying
adaptColorAndText
	"Fill the figure. The agent is appearing for the first time. Color has to be asked to the entity"
	
	| color |
	"	self pov = #nil ifTrue: [^self].
	self info = #nil
		ifTrue: 
			[color := self model getColorForPov: pov.
			self fillColor: color]
		ifFalse: 
			[color := self model getColorForPov: pov stringForInfo: info. optimisation pour distribution: 1 seule requete plut√¥t que 2
			self fillColor: color first.
			self setText: color last]. "
	self pov = #nil ifTrue: [^self].
	self info = #nil ifFalse: [self setText: self infoText].
	self invalidate