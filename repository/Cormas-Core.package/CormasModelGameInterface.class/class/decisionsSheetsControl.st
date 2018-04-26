interface specs
decisionsSheetsControl
	"UIPainter new openOnClass: self andSelector: #decisionsSheetsControl"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: '' 
			#min: #(#Point 152 312) 
			#max: #(#Point 152 312) 
			#bounds: #(#Rectangle 277 285 429 597) 
			#flags: 4 
			#colors: #(#LookPreferences 
				#setForegroundColor: #(#ColorValue #black) 
				#setBackgroundColor: #(#ColorValue #white)) 
			#isEventDriven: true) 
		#component: #(#SpecCollection 
			#collection: #(#(#ActionButtonSpec 
				#layout: #(#Rectangle 35 259 118 295) 
				#colors: #(#LookPreferences 
					#setForegroundColor: #(#ColorValue #red)) 
				#model: #go 
				#label: 'Go' 
				#style: #large 
				#defaultable: true) #(#LabelSpec 
				#layout: #(#Point 5 -1) 
				#label: 'Ordonnancement des fiches' 
				#style: #pixelDefault) #(#SequenceViewSpec 
				#layout: #(#Rectangle 29 17 124 138) 
				#flags: 12 
				#model: #playersScheduling 
				#useModifierKeys: true 
				#selectionType: #highlight) #(#ActionButtonSpec 
				#layout: #(#Rectangle 3 39 25 61) 
				#model: #moveUp 
				#label: #up 
				#hasCharacterOrientedLabel: false) #(#ActionButtonSpec 
				#layout: #(#Rectangle 3 68 25 90) 
				#model: #moveDown 
				#label: #down 
				#hasCharacterOrientedLabel: false) #(#InputFieldSpec 
				#layout: #(#Rectangle 61 202 91 227) 
				#model: #validity 
				#alignment: #center 
				#type: #number 
				#formatString: '1') #(#LabelSpec 
				#layout: #(#Point 47 182) 
				#label: 'du modele)' 
				#style: #pixelDefault) #(#LabelSpec 
				#layout: #(#Point 8 171) 
				#label: '(nombre de pas de temps' 
				#style: #pixelDefault) #(#CompositeSpecCollection 
				#collection: #(#(#LabelSpec 
					#layout: #(#Point 0 0) 
					#label: 'Duree de validite des fiches' 
					#style: #pixelDefault)) 
				#compositeSpec: #(#CompositeSpec 
					#layout: #(#Rectangle 5 161 147 181))))))