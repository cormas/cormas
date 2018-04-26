interface specs
barChart
	"Tools.UIPainter new openOnClass: self andSelector: #barChart"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #charts 
				#defaultString: 'Charts - Histogram') 
			#min: #(Point 597 310) 
			#max: #(Point 1440 1068) 
			#bounds: #(Rectangle 640 531 1237 841) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ChartViewSpec 
				#layout: #(LayoutFrame 0 0.301508 -5 0 0 0.9866 0 0.870175) 
				#name: #charts 
				#model: #data 
				#chartType: #BG_BarChartView 
				#dataSeries: #(ChartDataSpec 
					#series: #(#(ChartDataSetSpec 
						#name: '1' 
						#look: #(ChartElementLookSpec 
							#lineType: #solid)) #(ChartDataSetSpec 
						#aspect: #labels 
						#isData: false 
						#name: #(UserMessage 
							#key: #labels 
							#defaultString: 'Labels') 
						#isComputed: true) #(ChartDataSetSpec 
						#name: '2'))) 
				#xAxis: #(ChartingAxisSpec 
					#scale: #(ChartingScaleSpec 
						#restrictions: #(#auto #zero #div #log)) 
					#tickPosition: #tickOutside 
					#axisLine: true 
					#sectionMarkAt: #none) 
				#yAxis: #(ChartingValueAxisSpec 
					#scale: #(ChartingScaleSpec 
						#invert: true) 
					#unit: '') 
				#legendPosition: 1) #(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.0234506 0 0.171141 0 0.261307 0 0.52349) 
				#name: #chartsList 
				#model: #chartsList 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(LayoutOrigin 16 0 0 0.0774194) 
				#name: #chartsNames 
				#label: 'Histograms'' names') #(LabelSpec 
				#layout: #(Point 58 204) 
				#name: #id 
				#label: 'Label') #(LabelSpec 
				#layout: #(Point 71 265) 
				#name: #idList 
				#label: 'Label'))))