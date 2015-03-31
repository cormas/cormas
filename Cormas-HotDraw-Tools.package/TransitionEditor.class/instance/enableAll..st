private
enableAll: aSymbolList
	
	builder isNil ifTrue: [^self].
	aSymbolList
		do:
			[:each | 
			| widget |
			widget := builder componentAt: each.
			widget notNil
				ifTrue:
					[widget
						beVisible;
						enable]]