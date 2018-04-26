interface specs
windowSpec
	"UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: #(#UserMessage 
				#key: #communicationobserver 
				#defaultString: 'Observateur Graphique') 
			#bounds: #(#Rectangle 128 146 552 572) 
			#flags: 4 
			#menu: #mainMenu 
			#isEventDriven: true) 
		#component: #(#SpecCollection 
			#collection: #(#(#ArbitraryComponentSpec 
				#layout: #(#LayoutFrame 0 0.0377359 0 0.0350877 0 0.964623 0 0.969925) 
				#name: #vueObs 
				#component: #vueObs))))