zoom
updateGlobalChartsDisplayZoom
	
	| collecDataSeries newDescriptors res min max |
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
	newDescriptors := OrderedCollection new.
	1
		to: chartsList selections size
		do:
			[:index | 
			res := self
				setDataSerieZoom: index
				chart: (chartsList selections at: index)
				lineStyle: #solid
				label: (chartsList selections at: index) asString.
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
	self data value: collecDataSeries asList