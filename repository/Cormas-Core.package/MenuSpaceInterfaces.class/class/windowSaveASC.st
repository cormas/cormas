interface specs
windowSaveASC
	"UIPainter new openOnClass: self andSelector: #windowSaveASC"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Save to ASC' 
			#min: #(Point 266 339) 
			#max: #(Point 266 339) 
			#bounds: #(Rectangle 512 384 778 723)) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(Rectangle 41 41 231 142) 
				#name: #List1 
				#model: #attributesSavedASC 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(Point 34 8) 
				#name: #Label1 
				#label: 'Attributes to be saved') #(ActionButtonSpec 
				#layout: #(Rectangle 123 313 204 336) 
				#name: #ActionButton1 
				#model: #cancelSaveToASC 
				#label: 'Cancel' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 29 312 110 335) 
				#name: #ActionButton2 
				#model: #validateSaveToASC 
				#label: 'Ok' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 132 161 232 184) 
				#name: #InputField1 
				#model: #xllcorner 
				#helpText: '' 
				#alignment: #right 
				#type: #number) #(InputFieldSpec 
				#layout: #(Rectangle 132 202 232 225) 
				#name: #InputField2 
				#model: #yllcorner 
				#alignment: #right 
				#type: #number) #(InputFieldSpec 
				#layout: #(Rectangle 132 239 232 262) 
				#name: #InputField3 
				#model: #cellsize 
				#alignment: #right 
				#type: #number) #(LabelSpec 
				#layout: #(Point 56 161) 
				#name: #Label2 
				#label: 'xllcorner') #(LabelSpec 
				#layout: #(Point 56 202) 
				#name: #Label3 
				#label: 'yllcorner') #(LabelSpec 
				#layout: #(Point 56 239) 
				#name: #Label4 
				#label: 'Cell size') #(LabelSpec 
				#layout: #(Point 56 276) 
				#name: #Label5 
				#label: 'No data') #(InputFieldSpec 
				#layout: #(Rectangle 132 276 232 299) 
				#name: #InputField4 
				#model: #nodata 
				#alignment: #right 
				#type: #number))))