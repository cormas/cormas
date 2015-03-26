interface specs
windowSpecTest
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpecTest"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Unlabeled Canvas' 
			#min: #(Point 40 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 1443 525 1680 662) 
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
				#layout: #(LayoutFrame 2 0 -10 0.5 0 1 9 0.5) 
				#name: #ComboBox1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #yellow)) 
				#model: #selectedActivity 
				#helpText: 'Choose a test method' 
				#comboList: #activityChoices) #(RegionSpec 
				#layout: #(Rectangle 35 7 204 125) 
				#name: #Region1 
				#lineWidth: 1 
				#regionType: #ellipse))))