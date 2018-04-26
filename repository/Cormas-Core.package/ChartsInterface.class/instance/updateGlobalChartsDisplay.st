display
updateGlobalChartsDisplay
	
	| collecDataSeries newDescriptors res min max markers probe |
	chartsList selections isEmpty ifTrue: [^self data value: List new].
	collecDataSeries := OrderedCollection new.
	self toStep value - self fromStep value + 1
		timesRepeat: [collecDataSeries add: List new].
	min := ((self cormasModel_data at: self levelClassName)
		at: chartsList selections first) isEmpty
		ifTrue: [0]
		ifFalse:
			[((self cormasModel_data at: self levelClassName)
				at: chartsList selections first) first].
	max := min.
	markers := #(#circle #triangle #square #triangle2 #diamond).
	newDescriptors := OrderedCollection new.
	1
		to: chartsList selections size
		do:
			[:index | 
			probe := chartsList selections at: index.
			res := self
				setDataSerie: index
				chart: probe
				lineStyle: #solid
				label: probe asString
				foregroundColor:
					(self colorForGlobalProbes
						at: probe
						ifAbsent: [nil])
				backgroundColor: ColorValue red
				markerType:
					(markers
						at:
							(Cormas
								number: index
								onCycle: markers size)).	"(CormasNS.Kernel.Entity darkColorOfNumber: index * 3)"
			newDescriptors add: res first.
			res last
				with: collecDataSeries
				do:
					[:x :set | 
					set add: x.
					x < min ifTrue: [min := x].
					x > max ifTrue: [max := x]]].
	chartsView descriptors: newDescriptors asArray.
	self setYScaleMin: min max: max.
	self displayValues
		ifTrue: [chartsView dataInside]
		ifFalse: [chartsView hideData].	"chartsView dataStyle textStyle scalingFactor: 1."
	self displayMarkers
		ifTrue: [chartsView showMarker]
		ifFalse: [chartsView hideMarker].
	self data value: collecDataSeries asList