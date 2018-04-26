initialize-release
initColorForGlobalProbes
	
	| probe color |
	1
		to: chartsList list size
		do:
			[:index | 
			probe := chartsList list at: index.
			self colorForGlobalProbes
				at: probe
				ifAbsentPut:
					[color := cormasModel colorOfProbe: probe.
					color
						ifNil:
							[color := CMEntity
								colorWithout: #white
								OfNumber: 23 + index	"start with red (24)"].
					color]].
	^colorForGlobalProbes