interface specs
windowOccupants
	"UIPainter new openOnClass: self andSelector: #windowOccupants"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: #(#UserMessage 
				#key: #occupants 
				#defaultString: 'occupants') 
			#min: #(#Point 232 89) 
			#max: #(#Point 327 104) 
			#bounds: #(#Rectangle 85 210 317 299) 
			#isEventDriven: true) 
		#component: #(#SpecCollection 
			#collection: #(#(#SequenceViewSpec 
				#layout: #(#LayoutFrame 0 0.0301724 0 0.0674157 0 0.965517 0 0.955056) 
				#model: #occupantsList 
				#callbacksSpec: #(#UIEventCallbackSubSpec #focusInSelector: #displayCharts #doubleClickSelector: #inspect) 
				#multipleSelections: false 
				#selectionType: #highlight))))