interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Unlabeled Canvas' 
			#min: #(Point 5 5) 
			#max: #(Point 0 20) 
			#bounds: #(Rectangle 720 450 885 470) 
			#colors: #(LookPreferences 
				#setForegroundColor: #(ColorValue 6143 4096 8191) 
				#setBackgroundColor: #(ColorValue 5119 6655 8191)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle -1 2 449 22) 
				#name: #InputField1 
				#flags: 32 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue 8191 5119 2048) 
					#setSelectionForegroundColor: #(ColorValue #black) 
					#setSelectionBackgroundColor: #(ColorValue 8191 5119 2048)) 
				#model: #selectedActivity 
				#tabable: false 
				#isReadOnly: true 
				#type: #string))))