display
updateGlobalChartsDisplay_old
	
	| collecDataSeries newDescriptors res min max markers |
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
			res := self
				setDataSerie: index
				chart: (chartsList selections at: index)
				lineStyle: #solid
				label: (chartsList selections at: index) asString
				foregroundColor: ColorValue yellow
				backgroundColor: ColorValue red
				markerType:
					(markers
						at:
							(Cormas
								number: index
								onCycle: markers size)).	"(CormasNS.Kernel.Entity colorWithout: #white OfNumber: 23 + index)"	"start with red (24)"	"(CormasNS.Kernel.Entity darkColorOfNumber: index * 3)"
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