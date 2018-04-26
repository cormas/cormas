initialize-release
initColorForLocalProbes
	
	| probe color targetClass |
	1
		to: chartsList list size
		do:
			[:index | 
			probe := chartsList list at: index.
			colorForLocalProbes
				at: probe
				ifAbsentPut:
					[targetClass := levelClassName class.
					color := targetClass colorOfProbe: probe.
					color
						ifNil:
							[color := CMEntity
								colorWithout: #white
								OfNumber: 23 + index	"start with red (24)"].
					color]].
	^colorForLocalProbes