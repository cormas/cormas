interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false) 
			#label: 'Patches constraints' 
			#min: #(Point 231 68) 
			#max: #(Point 231 68) 
			#bounds: #(Rectangle 720 477 951 545) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 7798 7798 7798)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#layout: #(Rectangle 165 43.0 224 65.0) 
				#name: #selectCells 
				#model: #selectCells 
				#label: 'Done' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 177 2 227 21) 
				#name: #att1Value 
				#model: #att1Value 
				#tabable: true 
				#alignment: #right 
				#isReadOnly: false 
				#type: #object) #(ComboBoxSpec 
				#layout: #(Rectangle 133 2 178 21) 
				#name: #att1OpeChoices 
				#model: #att1Ope 
				#comboList: #att1OpeChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 18 2 134 21) 
				#name: #att1Choices 
				#model: #att1 
				#comboList: #att1Choices) #(LabelSpec 
				#layout: #(Point 4 1) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: '1-') 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 177 20 227 39) 
				#name: #att2Value 
				#model: #att2Value 
				#tabable: true 
				#alignment: #right 
				#isReadOnly: false 
				#type: #object) #(ComboBoxSpec 
				#layout: #(Rectangle 133 20 178 39) 
				#name: #att2OpeChoices 
				#model: #att2Ope 
				#comboList: #att2OpeChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 18 20 134 39) 
				#name: #att2Choices 
				#model: #att2 
				#comboList: #att2Choices) #(LabelSpec 
				#layout: #(Point 4 18) 
				#name: #Label3 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: '2-') 
				#style: #pixelDefault) #(CheckBoxSpec 
				#layout: #(Point 19 44) 
				#name: #CheckBox1 
				#model: #shouldBeEmptyPatches 
				#label: 'Should be empty'))))