interface specs
palette3
	"Tools.UIPainter new openOnClass: self andSelector: #palette"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Image Editor' 
			#min: #(Point 332 50) 
			#max: #(Point 332 50) 
			#bounds: #(Rectangle 512 384 844 434) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#layout: #(LayoutFrame -244 1 -44 1 -204 1 -24 1) 
				#name: #redButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #red) 
					#setSelectionBackgroundColor: #(ColorValue #red)) 
				#model: #doRed 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -204 1 -44 1 -164 1 -24 1) 
				#name: #yellowButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #yellow) 
					#setSelectionBackgroundColor: #(ColorValue #yellow)) 
				#model: #doYellow 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -164 1 -44 1 -124 1 -24 1) 
				#name: #greenButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #green) 
					#setSelectionBackgroundColor: #(ColorValue #green)) 
				#model: #doGreen 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -124 1 -44 1 -84 1 -24 1) 
				#name: #cyanButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #cyan) 
					#setSelectionBackgroundColor: #(ColorValue #cyan)) 
				#model: #doCyan 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -84 1 -44 1 -44 1 -24 1) 
				#name: #blueButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #blue) 
					#setSelectionBackgroundColor: #(ColorValue #blue)) 
				#model: #doBlue 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -44 1 -44 1 -4 1 -24 1) 
				#name: #magentaButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #magenta) 
					#setSelectionBackgroundColor: #(ColorValue #magenta)) 
				#model: #doMagenta 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -284 1 -44 1 -244 1 -24 1) 
				#name: #greyButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #lightGray) 
					#setSelectionBackgroundColor: #(ColorValue #lightGray)) 
				#model: #doGrey 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -44 1 -24 1 -4 1 -4 1) 
				#name: #darkMagentaButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkMagenta) 
					#setSelectionBackgroundColor: #(ColorValue #darkMagenta)) 
				#model: #doDarkMagenta 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -244 1 -24 1 -204 1 -4 1) 
				#name: #darkRedButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkRed) 
					#setSelectionBackgroundColor: #(ColorValue #darkRed)) 
				#model: #doDarkRed 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -204 1 -24 1 -164 1 -4 1) 
				#name: #darkYellowButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #olive) 
					#setSelectionBackgroundColor: #(ColorValue #olive)) 
				#model: #doDarkYellow 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -164 1 -24 1 -124 1 -4 1) 
				#name: #darkGreenButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkGreen) 
					#setSelectionBackgroundColor: #(ColorValue #darkGreen)) 
				#model: #doDarkGreen 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -124 1 -24 1 -84 1 -4 1) 
				#name: #darkCyanButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #darkCyan) 
					#setSelectionBackgroundColor: #(ColorValue #darkCyan)) 
				#model: #doDarkCyan 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -84 1 -24 1 -44 1 -4 1) 
				#name: #darkBlueButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #navy) 
					#setSelectionBackgroundColor: #(ColorValue #navy)) 
				#model: #doDarkBlue 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -284 1 -24 1 -244 1 -4 1) 
				#name: #darkGreyButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #gray) 
					#setSelectionBackgroundColor: #(ColorValue #gray)) 
				#model: #doDarkGrey 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -324 1 -44 1 -284 1 -24 1) 
				#name: #whiteButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white) 
					#setSelectionBackgroundColor: #(ColorValue #white)) 
				#model: #doWhite 
				#tabable: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -324 1 -24 1 -284 1 -4 1) 
				#name: #blackButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #black) 
					#setSelectionBackgroundColor: #(ColorValue #black)) 
				#model: #doBlack 
				#tabable: false))))