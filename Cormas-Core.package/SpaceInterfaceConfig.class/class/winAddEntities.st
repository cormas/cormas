interface specs
winAddEntities
	"Tools.UIPainter new openOnClass: self andSelector: #winAddEntities"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication true) 
			#label: #winAddEntities_title 
			#min: #(Point 224 166) 
			#max: #(Point 350 500) 
			#bounds: #(Rectangle 720 450 944 703) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(Rectangle 9 33 218 209) 
				#model: #entitiesToAddList 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #highlight) #(ActionButtonSpec 
				#layout: #(Rectangle 36 218 96 244) 
				#model: #accept 
				#label: #(UserMessage 
					#key: #ok 
					#defaultString: 'Ok') 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 42 8) 
				#label: #(UserMessage 
					#key: #attributesToBeSaved 
					#defaultString: 'Select entities to add')) #(ActionButtonSpec 
				#layout: #(Rectangle 112 218 172 244) 
				#model: #cancel 
				#label: #(UserMessage 
					#key: #cancel 
					#defaultString: 'Cancel') 
				#defaultable: true))))