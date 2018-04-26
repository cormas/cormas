interface specs
windowSaveMIFMID
	"UIPainter new openOnClass: self andSelector: #windowSaveMIFMID"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Save To MIF MID' 
			#min: #(Point 308 297) 
			#max: #(Point 308 297) 
			#bounds: #(Rectangle 516 203 824 500)) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(Rectangle 14 28 306 164) 
				#name: #List1 
				#model: #attributeSavedMIFMID 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(Point 94 6) 
				#name: #Label1 
				#label: 'Attributes to be saved') #(ActionButtonSpec 
				#layout: #(Rectangle 61 263 142 286) 
				#name: #ActionButton1 
				#model: #validateSaveToMIFMID 
				#label: 'Ok' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 172 262 253 285) 
				#name: #ActionButton2 
				#model: #cancelSaveToMIFMID 
				#label: 'Cancel' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 183 211 283 234) 
				#name: #InputField5 
				#model: #units) #(LabelSpec 
				#layout: #(Point 180 191) 
				#name: #Label6 
				#label: 'Units') #(InputFieldSpec 
				#layout: #(Rectangle 25 211 125 234) 
				#name: #InputField6 
				#model: #coordSys) #(LabelSpec 
				#layout: #(Point 23 190) 
				#name: #Label7 
				#label: 'CoordSys'))))