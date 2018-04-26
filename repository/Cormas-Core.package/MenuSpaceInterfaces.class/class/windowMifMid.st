interface specs
windowMifMid
	"UIPainter new openOnClass: self andSelector: #windowMifMid"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: #(#UserMessage 
				#key: #mifWindow 
				#defaultString: 'Importer fichiers mif (contours)') 
			#min: #(#Point 517 174) 
			#max: #(#Point 517 174) 
			#bounds: #(#Rectangle 148 275 665 449) 
			#isEventDriven: true) 
		#component: #(#SpecCollection 
			#collection: #(#(#LabelSpec 
				#layout: #(#Point 70 7) 
				#label: #(#UserMessage 
					#key: #filename 
					#defaultString: 'Fichier')) #(#LabelSpec 
				#layout: #(#Point 321 7) 
				#label: #(#UserMessage 
					#key: #spatialEntity 
					#defaultString: 'Spatial entity')) #(#ActionButtonSpec 
				#layout: #(#Rectangle 289 118 364 148) 
				#model: #validateWindowMifMid 
				#label: 'OK' 
				#defaultable: true) #(#SequenceViewSpec 
				#layout: #(#Rectangle 13 31 249 104) 
				#model: #listMifFiles 
				#useModifierKeys: true 
				#selectionType: #highlight) #(#ActionButtonSpec 
				#layout: #(#Rectangle 392 117 473 148) 
				#model: #cancelWindowMifMid 
				#label: #(#UserMessage 
					#key: #cancel 
					#defaultString: 'Annuler') 
				#defaultable: true) #(#SequenceViewSpec 
				#layout: #(#Rectangle 272 30 497 108) 
				#model: #listEntities 
				#useModifierKeys: true 
				#selectionType: #highlight) #(#CheckBoxSpec 
				#layout: #(#Point 42 114) 
				#model: #processNeighbourhood 
				#label: #(#UserMessage 
					#key: #processNeighbourhood 
					#defaultString: 'process neighbourhood')))))