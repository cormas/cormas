interface specs
ecranHierarchisation
	"UIPainter new openOnClass: self andSelector: #ecranHierarchisation"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: 'Hierarchisation' 
			#bounds: #(#Rectangle 293 390 508 535)) 
		#component: #(#SpecCollection 
			#collection: #(#(#InputFieldSpec 
				#layout: #(#Rectangle 35 38 83 61) 
				#model: #levelHolder 
				#type: #number) #(#ActionButtonSpec 
				#layout: #(#Rectangle 145 32 195 67) 
				#model: #actionIncLevel 
				#label: '+' 
				#defaultable: true) #(#ActionButtonSpec 
				#layout: #(#Rectangle 94 32 144 67) 
				#model: #actionDecLevel 
				#label: '-' 
				#defaultable: true) #(#GroupBoxSpec 
				#layout: #(#Rectangle 12 9 208 136) 
				#label: 'Niveau') #(#CheckBoxSpec 
				#layout: #(#Point 35 74) 
				#name: #higherLevels 
				#model: #higherLevels 
				#label: 'Affichage Niveau >') #(#CheckBoxSpec 
				#layout: #(#Point 35 100) 
				#name: #oneLevel 
				#model: #oneLevel 
				#label: 'Unifier les Niveaux'))))