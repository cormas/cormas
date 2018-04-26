zoom
updateLocalChartsDisplayZoom
	
	| collecDataSeries newDescriptors styles res min max |
	(chartsList selections isNil
		or:
			[chartsList selections isEmpty
				or: [idList selections isNil or: [idList selections isEmpty]]])
		ifTrue: [^self data value: List new].
	styles := #(#solid #dotted #dashed #broken #dotted2 #dashed2 #broken2).
	collecDataSeries := OrderedCollection new.
	self toStep value - self fromStep value + 1
		timesRepeat: [collecDataSeries add: List new].
	min := ((self cormasModel_data at: self levelClassName)
		at: chartsList selections first) isEmpty
		ifTrue: [0]
		ifFalse:
			[(((self cormasModel_data at: self levelClassName)
				at: chartsList selections first) at: idList selections first) first].
	max := min.
	newDescriptors := OrderedCollection new.
	1
		to: idList selections size
		do:
			[:id | 
			1
				to: chartsList selections size
				do:
					[:j | 
					res := self
						setDataSerieZoom: (id - 1) * chartsList selections size + j
						chart: (chartsList selections at: j)
						id: (idList selections at: id)
						lineStyle: (styles at: (j min: styles size))
						color:
							(CMEntity
								colorWithout: #white
								OfNumber: 23 + id)
						label:
							(chartsList selections size = 1
								ifTrue: [(idList selections at: id) printString]
								ifFalse:
									[(idList selections at: id) printString , ':'
										, (chartsList selections at: j) asString]).
					newDescriptors add: res first.
					res last
						with: collecDataSeries
						do:
							[:x :set | 
							set add: x.
							x < min ifTrue: [min := x].
							x > max ifTrue: [max := x]]]].
	chartsView descriptors: newDescriptors asArray.
	self setYScaleMin: min max: max.
	self data value: collecDataSeries asList