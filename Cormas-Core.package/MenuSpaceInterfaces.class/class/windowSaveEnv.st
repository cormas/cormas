interface specs
windowSaveEnv
	"Tools.UIPainter new openOnClass: self andSelector: #windowSaveEnv"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #saveEnvironment 
				#defaultString: 'Save the Environment') 
			#min: #(Point 224 166) 
			#max: #(Point 224 166) 
			#bounds: #(Rectangle 1475 591 1699 757) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(Rectangle 30 34 203 122) 
				#model: #attributesToBeSaved 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(ActionButtonSpec 
				#layout: #(Rectangle 42 133 102 159) 
				#model: #accept 
				#label: #(UserMessage 
					#key: #ok 
					#defaultString: 'Ok') 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 34 12) 
				#label: #(UserMessage 
					#key: #attributesToBeSaved 
					#defaultString: 'Attributes to be saved')) #(ActionButtonSpec 
				#layout: #(Rectangle 118 133 178 159) 
				#model: #cancel 
				#label: #(UserMessage 
					#key: #cancel 
					#defaultString: 'Cancel') 
				#defaultable: true))))