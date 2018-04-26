interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Unlabeled Canvas' 
			#min: #(Point 40 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 840 525 990 567) 
			#colors: #(LookPreferences 
				#setForegroundColor: #(ColorValue 6143 4096 8191) 
				#setBackgroundColor: #(ColorValue 5119 6655 8191) 
				#setSelectionForegroundColor: nil 
				#setSelectionBackgroundColor: nil) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(LayoutFrame 1 0 7 0 -1 1 35 0) 
				#name: #nameHolder 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #nameHolder 
				#helpText: 'Choose activity name'))))