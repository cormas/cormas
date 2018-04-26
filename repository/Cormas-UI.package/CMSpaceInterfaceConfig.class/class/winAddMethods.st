interface specs
winAddMethods
	"Tools.UIPainter new openOnClass: self andSelector: #winAddMethods"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication true) 
			#label: #winAddMethods_title 
			#min: #(Point 224 166) 
			#max: #(Point 350 500) 
			#bounds: #(Rectangle 720 450 944 703) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(Rectangle 9 33 218 209) 
				#model: #methodsToAddList 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #highlight) #(ActionButtonSpec 
				#layout: #(Rectangle 36 218 96 244) 
				#model: #accept 
				#label: #(UserMessage 
					#key: #ok 
					#defaultString: 'Ok') 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 3 9) 
				#label: #(UserMessage 
					#key: #attributesToBeSaved 
					#defaultString: 'Select available methods for')) #(ActionButtonSpec 
				#layout: #(Rectangle 112 218 172 244) 
				#model: #cancel 
				#label: #(UserMessage 
					#key: #cancel 
					#defaultString: 'Cancel') 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 135 8 220 31) 
				#name: #InputField1 
				#flags: 0 
				#model: #entitySelected 
				#tabable: false 
				#isReadOnly: true))))