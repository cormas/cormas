interface specs
windowForOneAttribute
	"Tools.UIPainter new openOnClass: self andSelector: #windowForOneAttribute"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Histogram' 
			#min: #(Point 300 200) 
			#max: #(Point 1000 800) 
			#bounds: #(Rectangle 800 450 1300 763) 
			#flags: 4 
			#menu: #menuHolder 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue #white))) 
		#component: #(SpecCollection 
			#collection: #(#(ChartViewSpec 
				#layout: #(LayoutFrame 17 0 25 0 0 0.952941 0 0.992674) 
				#name: #Chart1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue #white)) 
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
						#invert: true))) #(InputFieldSpec 
				#layout: #(LayoutFrame 0 0 3 0 0 1 31 0) 
				#name: #InputField1 
				#flags: 0 
				#model: #histoName 
				#tabable: false 
				#alignment: #center 
				#style: #large 
				#isReadOnly: true))))