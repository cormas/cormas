interface specs
windowSpec
	"UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #probes 
				#defaultString: 'Probes') 
			#min: #(Point 367 194) 
			#max: #(Point 567 530) 
			#bounds: #(Rectangle 700 525 1067 719) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.0163488 0 0.149485 0 0.47139 0 0.984536) 
				#model: #listEntities 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyProbe) 
				#multipleSelections: false 
				#selectionType: #highlight) #(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.512262 0 0.149485 0 0.989101 0 0.969072) 
				#model: #listProbes 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyProbe) 
				#menu: #menuHolder 
				#multipleSelections: false 
				#selectionType: #highlight) #(LabelSpec 
				#layout: #(LayoutOrigin 0 0.0326975 0 0.0154639) 
				#label: #(UserMessage 
					#key: #levels 
					#defaultString: 'Levels')) #(LabelSpec 
				#layout: #(LayoutOrigin 0 0.509537 0 0.0154639) 
				#label: #(UserMessage 
					#key: #probes 
					#defaultString: 'Probes')))))