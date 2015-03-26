interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #charts 
				#defaultString: 'Charts') 
			#min: #(Point 59 31) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 719 449 1316 759) 
			#flags: 4 
			#menu: #menuHolder 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
				#layout: #(LayoutFrame -33 0.25 2 0 -2 1 -39 1) 
				#name: #Region1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white))) #(ChartViewSpec 
				#layout: #(LayoutFrame -30 0.25 2 0 -2 1 -39 1) 
				#name: #charts 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700) 
					#setSelectionBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #data 
				#chartType: #BG_LineChartView 
				#dataSeries: #(ChartDataSpec 
					#series: #(#(ChartDataSetSpec 
						#name: '1' 
						#look: #(ChartElementLookSpec 
							#markerType: #circle 
							#lineType: #solid)) #(ChartDataSetSpec 
						#aspect: #labels 
						#isData: false 
						#name: #(UserMessage 
							#key: #labels 
							#defaultString: 'Labels') 
						#isComputed: true) #(ChartDataSetSpec 
						#name: '2'))) 
				#options: #(LineChartOptionsSpec 
					#showMarker: true 
					#showLine: true 
					#dataLocation: #none) 
				#xAxis: #(ChartingAxisSpec 
					#scale: #(ChartingScaleSpec 
						#restrictions: #(#auto #zero #div #log)) 
					#tickPosition: #tickOutside 
					#axisLine: true 
					#sectionMarkAt: #none) 
				#yAxis: #(ChartingValueAxisSpec 
					#scale: #(ChartingScaleSpec 
						#invert: true) 
					#unit: '' 
					#tickPosition: #hideTick 
					#borderLine: false) 
				#legendPosition: 3) #(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.0100503 0 0.0986395 -35 0.25 0 0.608844) 
				#name: #chartsList 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #chartsList 
				#helpText: '' 
				#menu: #menuProbe 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(SequenceViewSpec 
				#layout: #(LayoutFrame 6 0 0 0.690476 70 0 -2 1) 
				#name: #idList 
				#model: #idList 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(LayoutOrigin 0 0.0100503 0 0.622449) 
				#name: #id 
				#label: 'id') #(LabelSpec 
				#layout: #(LayoutOrigin 0 0.0100503 0 0.0136054) 
				#name: #chartsNames 
				#label: #(UserMessage 
					#key: #chartsNames 
					#defaultString: 'Charts names')) #(ResizingSplitterSpec 
				#layout: #(LayoutFrame -35 0.25 -2 0 -30 0.25 0 1) 
				#name: #ResizingSplitter1 
				#flags: 8 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 5734 5734 5734)) 
				#horizontal: false 
				#minAboveSize: 0 
				#minBelowSize: 0 
				#aboveWidgets: 'chartsList' 
				#belowWidgets: 'charts Region1 fromSlider toSlider ') #(ActionButtonSpec 
				#layout: #(LayoutFrame -113 1 -23 1 -53 1 0 1.0) 
				#name: #DefaultRange 
				#model: #defaultRange 
				#label: 'Default' 
				#defaultable: true) #(LabelSpec 
				#layout: #(LayoutFrame -91 1 -57 1 -16 1 -38 1) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #timeSteps 
					#defaultString: 'Time steps') 
				#style: #small) #(ActionButtonSpec 
				#layout: #(LayoutFrame -172 1 -23 1 -116 1 0 1.0) 
				#name: #Zoom 
				#model: #zoom 
				#label: 'Zoom' 
				#defaultable: true) #(LabelSpec 
				#layout: #(LayoutOrigin -352 1 -24 1) 
				#name: #from 
				#label: 'From:') #(LabelSpec 
				#layout: #(LayoutOrigin -259 1 -24 1) 
				#name: #to 
				#label: 'To:') #(InputFieldSpec 
				#layout: #(LayoutFrame -310 1 -23 1 -271 1 0 1.0) 
				#name: #fromStep 
				#model: #fromStep 
				#type: #number 
				#formatString: '0') #(InputFieldSpec 
				#layout: #(LayoutFrame -229 1 -23 1 -186 1 0 1.0) 
				#name: #toStep 
				#model: #toStep 
				#type: #number 
				#formatString: '0') #(SliderSpec 
				#layout: #(LayoutFrame -2 0.25 -39 1 -2 1 -30 1) 
				#name: #toSlider 
				#colors: #(LookPreferences 
					#setSelectionBackgroundColor: #(ColorValue #red)) 
				#model: #toSlider 
				#helpText: 'set the Stop step of the zoom' 
				#orientation: #horizontal) #(SliderSpec 
				#layout: #(LayoutFrame -2 0.25 -30 1 -2 1 -22 1) 
				#name: #fromSlider 
				#colors: #(LookPreferences 
					#setSelectionBackgroundColor: #(ColorValue #green)) 
				#model: #fromSlider 
				#helpText: 'set the Start step of the zoom' 
				#orientation: #horizontal) #(ActionButtonSpec 
				#layout: #(LayoutFrame -430 1 -21 1 -370 1 0 1) 
				#name: #duplicateButton 
				#model: #duplicate 
				#label: 'Duplicate' 
				#defaultable: true))))