aspects
labels
	
	| indice |
	^(PluggableAdaptor new)
		getBlock:
				[:m | 
				indice := self data value indexOf: m.
				indice \\ self betweenLabels = 0
					ifTrue: [indice printString]
					ifFalse: ['']]
			putBlock: [:b :v | ]
			updateBlock: [:b :a :p | false];
		yourself