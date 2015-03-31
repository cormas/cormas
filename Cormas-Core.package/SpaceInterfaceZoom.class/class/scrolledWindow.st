interface specs
scrolledWindow
	"Tools.UIPainter new openOnClass: self andSelector: #scrolledWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #space 
				#defaultString: 'space') 
			#min: #(Point 20 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 840 525 1182 868) 
			#flags: 4 
			#menu: #menuBar 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 28 0 0 1 0 1) 
				#flags: 11 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 4915 4915 4915)) 
				#component: #drawing) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 0 0 0 1 28 0) 
				#flags: 0 
				#component: #toolbar) #(CompositeSpecCollection 
				#collection: #(#(InputFieldSpec 
					#layout: #(LayoutSizedOrigin 40 0 1 0 48 21) 
					#name: #timeUnitName 
					#flags: 0 
					#isOpaque: true 
					#model: #timeUnitName 
					#isReadOnly: true) #(InputFieldSpec 
					#layout: #(LayoutFrame 0 0 0 0 41 0 22 0) 
					#name: #timeField 
					#model: #timeField 
					#isReadOnly: true 
					#type: #number 
					#formatString: '0')) 
				#compositeSpec: #(CompositeSpec 
					#layout: #(LayoutSizedOrigin -90 1.0 3 0.0 88 22) 
					#name: #Composite1)))))