histogram
updateHistogramChartsDisplay
	
	| t1 t4 t5 t2 t3 |
	chartsList selections isEmpty
		ifTrue: [self data value: List new]
		ifFalse:
			[t1 := OrderedCollection new.
			t4 := 1.
			t5 := ((self cormasModel_data at: #Histogram)
				at: (chartsList selections at: 1)) first size + 1.
			[t4 <= t5]
				whileTrue:
					[t1 add: List new.
					t4 := t4 + 1].
			t2 := OrderedCollection new.
			t3 := self
				setHistogramDataSerie: 1
				chart: (chartsList selections at: 1)
				lineStyle: #solid
				label: (chartsList selections at: 1) asString.
			t2 add: t3 first.
			t3 last
				with: t1
				do: [:t8 :t9 | t9 add: t8].
			self halt.
			chartsView descriptors: t2 asArray.
			self data value: t3 asList].
	^self