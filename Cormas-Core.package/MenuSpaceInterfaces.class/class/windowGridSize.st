interface specs
windowGridSize
	"UIPainter new openOnClass: self andSelector: #windowGridSize"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: #(#UserMessage 
				#key: #gridsize 
				#defaultString: 'Dimension grille') 
			#min: #(#Point 200 147) 
			#max: #(#Point 200 147) 
			#bounds: #(#Rectangle 219 243 419 390) 
			#isEventDriven: true) 
		#component: #(#SpecCollection 
			#collection: #(#(#LabelSpec 
				#layout: #(#Point 127 22) 
				#label: #(#UserMessage 
					#key: #lineTab 
					#defaultString: 'Ligne')) #(#LabelSpec 
				#layout: #(#Point 128 54) 
				#label: #(#UserMessage 
					#key: #column 
					#defaultString: 'Colonnes')) #(#LabelSpec 
				#layout: #(#Point 24 22) 
				#label: #iconLine 
				#hasCharacterOrientedLabel: false) #(#LabelSpec 
				#layout: #(#Point 32 46) 
				#label: #iconColumn 
				#hasCharacterOrientedLabel: false) #(#InputFieldSpec 
				#layout: #(#Rectangle 80 14 117 44) 
				#model: #line 
				#type: #number 
				#formatString: '0') #(#InputFieldSpec 
				#layout: #(#Rectangle 79 52 117 86) 
				#model: #column 
				#type: #number 
				#formatString: '0') #(#ActionButtonSpec 
				#layout: #(#Rectangle 31 106 161 131) 
				#model: #validateWindowGridSize 
				#label: #(#UserMessage 
					#key: #valide 
					#defaultString: 'Valider') 
				#isDefault: true 
				#defaultable: true))))