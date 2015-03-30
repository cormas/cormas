interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Histograms' 
			#min: #(Point 20 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 1325 600 1920 895) 
			#flags: 4 
			#menu: #menu) 
		#component: #(SpecCollection 
			#collection: #(#(ChartViewSpec 
				#layout: #(LayoutFrame 152 0 18 0 0 0.952941 0 0.992537) 
				#name: #Chart1 
				#model: #data 
				#dataSeries: #(ChartDataSpec 
					#series: #(#(ChartDataSetSpec 
						#name: 'data1') #(ChartDataSetSpec 
						#isData: false 
						#name: 'labels'))) 
				#xAxis: #(ChartingAxisSpec 
					#scale: #(ChartingScaleSpec 
						#invert: false 
						#restrictions: #(#auto #zero #div #log)) 
					#unit: '' 
					#tickPosition: #tickOutside 
					#sectionMarkAt: #none) 
				#yAxis: #(ChartingValueAxisSpec 
					#scale: #(ChartingScaleSpec 
						#invert: true))) #(LabelSpec 
				#layout: #(Point 12 52) 
				#name: #Label1 
				#label: 'Histogram list') #(SequenceViewSpec 
				#layout: #(Rectangle 10 75 142 255) 
				#name: #List1 
				#model: #histoList 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#valueChangeSelector: #setNewHistoData) 
				#useModifierKeys: true 
				#selectionType: #highlight))))