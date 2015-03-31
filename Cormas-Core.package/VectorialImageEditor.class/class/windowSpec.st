interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #figureEditor 
				#defaultString: 'Figure Editor') 
			#min: #(Point 176 272) 
			#max: #(Point 759 614) 
			#bounds: #(Rectangle 720 450 963 786) 
			#toolBar: #toolBar 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 0 0 0 1 28 0) 
				#flags: 0 
				#component: #toolbar) #(ActionButtonSpec 
				#layout: #(Rectangle 37 4 79 34) 
				#name: #ActionButton1 
				#model: #openVectorialLibrary 
				#label: 'Lib' 
				#style: #large 
				#defaultable: true) #(SliderSpec 
				#layout: #(LayoutFrame 20 0 39 0 41 0 -60 0.916666) 
				#name: #sliderHeigth 
				#model: #sliderHeigth 
				#orientation: #vertical 
				#start: 0.1 
				#stop: 2 
				#step: 0.1) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 50 0 37 0 -30 1 -80 1) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#component: #drawing) #(SliderSpec 
				#layout: #(LayoutFrame 52 0 -70 1 -30 1 -50 1) 
				#name: #sliderWidth 
				#model: #sliderWidth 
				#orientation: #horizontal 
				#start: 0.1 
				#stop: 2 
				#step: 0.1) #(ActionButtonSpec 
				#layout: #(LayoutFrame -15 0.5 -38 1 35 0.5 -10 1) 
				#name: #install 
				#model: #install 
				#label: 'OK' 
				#style: #large 
				#defaultable: true))))