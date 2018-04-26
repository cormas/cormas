interface specs
windowEntitiesHere
	"Tools.UIPainter new openOnClass: self andSelector: #windowEntitiesHere"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #occupants 
				#defaultString: 'Entities here') 
			#min: #(Point 232 89) 
			#max: #(Point 327 104) 
			#bounds: #(Rectangle 1600 600 1832 689) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.0301724 0 0.0674157 0 0.965517 0 0.955056) 
				#model: #entitiesList 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#focusInSelector: #displayCharts 
					#doubleClickSelector: #inspect) 
				#multipleSelections: false 
				#selectionType: #highlight))))