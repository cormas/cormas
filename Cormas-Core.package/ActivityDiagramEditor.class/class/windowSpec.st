interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false #openType #advanced #sizeType #specifiedSize #positionType #positionSystemDefault) 
			#label: 'Activity Diagram Editor' 
			#min: #(Point 20 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 840 525 1395 1005) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 2 0 34 0 0 1.0 0 1.0) 
				#flags: 11 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#component: #drawing) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 3 0 0 0 0 1.0 34 0) 
				#flags: 0 
				#component: #toolbar) #(ActionButtonSpec 
				#layout: #(LayoutOrigin 0 0.873874 0 0.00833333) 
				#name: #ActionButton1 
				#model: #verifyAndInstall 
				#label: 'Install' 
				#defaultable: true))))