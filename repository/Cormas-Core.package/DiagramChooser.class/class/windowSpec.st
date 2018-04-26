interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: #(UserMessage 
				#key: #attributAnalysis 
				#defaultString: 'Diagram chooser') 
			#min: #(Point 242 292) 
			#max: #(Point 242 292) 
			#bounds: #(Rectangle 720 450 962 742) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(Rectangle 16 34 228 163) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #diagramList 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #actionModifierInit)) #(ActionButtonSpec 
				#layout: #(Rectangle 30 248 102 278) 
				#model: #createNewDiagram 
				#label: 'New diagram' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 13 5) 
				#label: 'Select a diagram:') #(GroupBoxSpec 
				#layout: #(Rectangle 13 226 223 285) 
				#name: #GroupBox1 
				#label: #(UserMessage 
					#key: #enterParameterValues 
					#defaultString: 'Create or Remove')) #(ActionButtonSpec 
				#layout: #(Rectangle 30 182 102 212) 
				#name: #ActionButton1 
				#model: #accept 
				#label: 'Open' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 134 182 206 212) 
				#name: #ActionButton2 
				#model: #cancel 
				#label: 'Cancel' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 134 248 206 278) 
				#name: #ActionButton3 
				#model: #removeDiagram 
				#label: 'Remove' 
				#defaultable: true))))