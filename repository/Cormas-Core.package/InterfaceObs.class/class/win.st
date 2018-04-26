interface specs
win
	"UIPainter new openOnClass: self andSelector: #win"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: 'Observateur Graphique' 
			#bounds: #(#Rectangle 371 327 795 753)) 
		#component: #(#SpecCollection 
			#collection: #(#(#ArbitraryComponentSpec 
				#layout: #(#LayoutFrame 0 0.0377359 0 0.0375587 0 0.962264 0 0.880282) 
				#name: #'1' 
				#component: #vueObs) #(#LabelSpec 
				#layout: #(#LayoutOrigin 0 0.417453 0 0.924883) 
				#label: 'Duree du Cycle') #(#LabelSpec 
				#layout: #(#LayoutOrigin 0 0.0518868 0 0.920188) 
				#label: 'Tour No') #(#InputFieldSpec 
				#layout: #(#LayoutFrame 0 0.653302 0 0.920188 0 0.78066 0 0.978873) 
				#model: #cycle 
				#type: #number) #(#InputFieldSpec 
				#layout: #(#LayoutFrame 0 0.195755 0 0.91784 0 0.323113 0 0.976526) 
				#model: #stepCounter 
				#type: #number))))