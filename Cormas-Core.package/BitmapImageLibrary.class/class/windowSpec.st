interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Picture Library' 
			#min: #(Point 354 298) 
			#max: #(Point 354 298) 
			#bounds: #(Rectangle 720 558 1074 856) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue #white))) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 1 0 89 81) 
				#name: #ActionButton1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib1 
				#tabable: false 
				#label: #imLib1 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 89 0 177 81) 
				#name: #ActionButton2 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib2 
				#tabable: false 
				#label: #imLib2 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 265 0 353 81) 
				#name: #ActionButton4 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib4 
				#tabable: false 
				#label: #imLib4 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 177 0 265 81) 
				#name: #ActionButton3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib3 
				#tabable: false 
				#label: #imLib3 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 265 80 353 161) 
				#name: #ActionButton8 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib8 
				#tabable: false 
				#label: #imLib8 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 177 80 265 161) 
				#name: #ActionButton7 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib7 
				#tabable: false 
				#label: #imLib7 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 89 80 177 161) 
				#name: #ActionButton6 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib6 
				#tabable: false 
				#label: #imLib6 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 1 80 89 161) 
				#name: #ActionButton5 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib5 
				#tabable: false 
				#label: #imLib5 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 205 258 242 290) 
				#name: #ActionButton33 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #imLibNextPage 
				#label: #arrowNext 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 116 257 153 289) 
				#name: #ActionButton34 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #imLibPreviousPage 
				#label: #arrowPrevious 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 1 160 89 241) 
				#name: #ActionButton9 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib9 
				#tabable: false 
				#label: #imLib9 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 89 160 177 241) 
				#name: #ActionButton10 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib10 
				#tabable: false 
				#label: #imLib10 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 177 160 265 241) 
				#name: #ActionButton11 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib11 
				#tabable: false 
				#label: #imLib11 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 265 160 353 241) 
				#name: #ActionButton12 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #selectImLib12 
				#tabable: false 
				#label: #imLib12 
				#hasCharacterOrientedLabel: false 
				#defaultable: true))))