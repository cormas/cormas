interface specs
palette
	"Tools.UIPainter new openOnClass: self andSelector: #palette"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Image Editor' 
			#min: #(Point 354 50) 
			#max: #(Point 454 50) 
			#bounds: #(Rectangle 1007 216 1361 266) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#layout: #(LayoutFrame -259 1 -48 1 -236 1 -27 1) 
				#name: #whiteButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white) 
					#setSelectionBackgroundColor: #(ColorValue #white)) 
				#model: #doWhite 
				#tabable: false) #(RegionSpec 
				#layout: #(Rectangle 94 3 117 24) 
				#name: #Region1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 6553 6553 6553)) 
				#lineWidth: 1) #(ActionButtonSpec 
				#layout: #(LayoutFrame -259 1 -24 1 -236 1 -4 1) 
				#name: #blackButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #black) 
					#setSelectionBackgroundColor: #(ColorValue #black)) 
				#model: #doBlack 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -226 1 -46 1 -203 1 -26 1) 
				#name: #greyButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #lightGray) 
					#setSelectionBackgroundColor: #(ColorValue #lightGray)) 
				#model: #doGrey 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -226 1 -24 1 -203 1 -4 1) 
				#name: #darkGreyButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #gray) 
					#setSelectionBackgroundColor: #(ColorValue #gray)) 
				#model: #doDarkGrey 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -193 1 -46 1 -170 1 -26 1) 
				#name: #redButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #red) 
					#setSelectionBackgroundColor: #(ColorValue #red)) 
				#model: #doRed 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -193 1 -24 1 -170 1 -4 1) 
				#name: #darkRedButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkRed) 
					#setSelectionBackgroundColor: #(ColorValue #darkRed)) 
				#model: #doDarkRed 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -160 1 -46 1 -137 1 -27 1) 
				#name: #yellowButton 
				#flags: 0 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #yellow) 
					#setSelectionBackgroundColor: #(ColorValue #yellow)) 
				#model: #doYellow 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -160 1 -24 1 -137 1 -4 1) 
				#name: #darkYellowButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #olive) 
					#setSelectionBackgroundColor: #(ColorValue #olive)) 
				#model: #doDarkYellow 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -127 1 -46 1 -104 1 -26 1) 
				#name: #greenButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #green) 
					#setSelectionBackgroundColor: #(ColorValue #green)) 
				#model: #doGreen 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -127 1 -24 1 -104 1 -4 1) 
				#name: #darkGreenButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkGreen) 
					#setSelectionBackgroundColor: #(ColorValue #darkGreen)) 
				#model: #doDarkGreen 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -94 1 -46 1 -71 1 -26 1) 
				#name: #cyanButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #cyan) 
					#setSelectionBackgroundColor: #(ColorValue #cyan)) 
				#model: #doCyan 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -94 1 -24 1 -71 1 -4 1) 
				#name: #darkCyanButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkCyan) 
					#setSelectionBackgroundColor: #(ColorValue #darkCyan)) 
				#model: #doDarkCyan 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -61 1 -46 1 -38 1 -26 1) 
				#name: #blueButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #blue) 
					#setSelectionBackgroundColor: #(ColorValue #blue)) 
				#model: #doBlue 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -61 1 -24 1 -38 1 -4 1) 
				#name: #darkBlueButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #navy) 
					#setSelectionBackgroundColor: #(ColorValue #navy)) 
				#model: #doDarkBlue 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -28 1 -46 1 -5 1 -26 1) 
				#name: #magentaButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #magenta) 
					#setSelectionBackgroundColor: #(ColorValue #magenta)) 
				#model: #doMagenta 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -28 1 -24 1 -5 1 -4 1) 
				#name: #darkMagentaButton 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkMagenta) 
					#setSelectionBackgroundColor: #(ColorValue #darkMagenta)) 
				#model: #doDarkMagenta 
				#tabable: false))))