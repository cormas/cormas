private
disableAll: aSymbolList
	
	builder isNil ifTrue: [^self].
	aSymbolList
		do:
			[:each | 
			| widget |
			widget := builder componentAt: each.
			widget notNil
				ifTrue:
					[widget
						disable;
						beInvisible]]