interface specs
windowSpec
	"UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Drawing Editor' 
			#bounds: #(Rectangle 800 600 1355 1080) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 28 0 0 1 0 1) 
				#flags: 11 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#component: #drawing) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 0 0 0 1 28 0) 
				#flags: 0 
				#component: #toolbar))))