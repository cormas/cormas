interface specs
windowSpec2
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Unlabeled Canvas' 
			#min: #(Point 40 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 1336 462 1486 504) 
			#colors: #(LookPreferences 
				#setForegroundColor: #(ColorValue 6143 4096 8191) 
				#setBackgroundColor: #(ColorValue 5119 6655 8191)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ComboBoxSpec 
				#layout: #(LayoutFrame 2 0 7 0 -2 1 30 0) 
				#name: #ComboBox1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 6793 5676)) 
				#model: #selectedActivity 
				#comboList: #activityChoices))))