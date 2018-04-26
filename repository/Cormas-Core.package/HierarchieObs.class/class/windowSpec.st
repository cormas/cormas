interface specs
windowSpec
	"UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: 'Hierarchisation' 
			#bounds: #(#Rectangle 235 313 453 437)) 
		#component: #(#SpecCollection 
			#collection: #(#(#InputFieldSpec 
				#layout: #(#Rectangle 117 15 150 37) 
				#model: #levelHolder 
				#type: #number) #(#ActionButtonSpec 
				#layout: #(#Rectangle 186 11 217 42) 
				#model: #actionIncLevel 
				#label: '+' 
				#defaultable: true) #(#ActionButtonSpec 
				#layout: #(#Rectangle 161 11 192 42) 
				#model: #actionDecLevel 
				#label: '-' 
				#defaultable: true) #(#CheckBoxSpec 
				#layout: #(#Point 11 75) 
				#name: #higherLevels 
				#model: #higherLevels 
				#label: 'Affichage Niveau >') #(#CheckBoxSpec 
				#layout: #(#Point 11 99) 
				#name: #oneLevel 
				#model: #oneLevel 
				#label: 'Unifier les Niveaux') #(#InputFieldSpec 
				#layout: #(#Rectangle 117 41 150 63) 
				#model: #degreMaxHolder 
				#type: #number) #(#LabelSpec 
				#layout: #(#Point 14 42) 
				#label: 'Degre Max: ') #(#LabelSpec 
				#layout: #(#Point 14 16) 
				#label: 'Niveau Actuel:'))))