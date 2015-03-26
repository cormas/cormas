display
setYScaleMin: min max: max
	"scale the Y axis between min and max. If autoscale (menu Option) is true, uses the default autoscale with 0 as minimum value, otherwise use the min value of the data as min"
	
	self autoScale
		ifFalse: [chartsView grid y scale autoMin: min max: max]
		ifTrue:
			[| aMin aMax |
			aMin := min floor.
			aMax := max ceiling.
			aMin = aMax ifTrue: [aMax := aMax + 10].
			chartsView grid y scale zero: aMin.
			(aMax - aMin) abs <= 1
				ifTrue:
					[| diff |
					diff := (max - min) / 3.
					chartsView grid y scale
						sourceMin: min - diff
						max: max + diff.
					chartsView grid y scale step: ((diff * 100) rounded / 100) asFloat]
				ifFalse:
					[chartsView grid y scale
						sourceMin: aMin
						max: aMax + 1.	"- ((aMax - aMin)/50)"
					chartsView grid y scale step: ((aMax - aMin) / 10) rounded]]