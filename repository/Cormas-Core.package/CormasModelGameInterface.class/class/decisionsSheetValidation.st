interface specs
decisionsSheetValidation
	"UIPainter new openOnClass: self andSelector: #decisionsSheetValidation"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: '' 
			#min: #(#Point 262 53) 
			#max: #(#Point 262 53) 
			#bounds: #(#Rectangle 234 326 496 379) 
			#flags: 4 
			#colors: #(#LookPreferences 
				#setForegroundColor: #(#ColorValue #black) 
				#setBackgroundColor: #(#ColorValue #white)) 
			#isEventDriven: true) 
		#component: #(#SpecCollection 
			#collection: #(#(#ActionButtonSpec 
				#layout: #(#Rectangle 155 5 259 35) 
				#model: #delete 
				#label: 'Effacer la fiche' 
				#style: #pixelDefault 
				#defaultable: true) #(#ActionButtonSpec 
				#layout: #(#Rectangle 4 5 108 35) 
				#model: #validate 
				#label: 'Enregistrer la fiche' 
				#style: #pixelDefault 
				#defaultable: true))))