interface specs
windowSpec2
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Unlabeled Canvas' 
			#min: #(Point 40 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 1443 534 1680 671) 
			#colors: #(LookPreferences 
				#setForegroundColor: #(ColorValue 6143 4096 8191) 
				#setBackgroundColor: #(ColorValue 5119 6655 8191)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(AlignmentOrigin 0 0.5 0 0.5 0.5 0.5) 
				#name: #Label1 
				#label: #diamondImage 
				#hasCharacterOrientedLabel: false) #(ComboBoxSpec 
				#layout: #(LayoutFrame 0 0.0833333 -10 0.5 0 0.916666 9 0.5) 
				#name: #ComboBox1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #yellow)) 
				#model: #selectedActivity 
				#helpText: 'Choose a test method' 
				#comboList: #activityChoices))))