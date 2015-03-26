interface specs
winPatchesConstraints
	"Tools.UIPainter new openOnClass: self andSelector: #winPatchesConstraints"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false) 
			#label: 'Patches constraints' 
			#min: #(Point 238 74) 
			#max: #(Point 238 74) 
			#bounds: #(Rectangle 719 449 957 523) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 7798 7798 7798)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#layout: #(Rectangle 165 43.0 224 65.0) 
				#name: #applyPatchesConstraints 
				#model: #applyPatchesConstraints 
				#label: 'Done' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 181 2 231 21) 
				#name: #att1Value 
				#model: #att1Value 
				#tabable: true 
				#alignment: #right 
				#isReadOnly: false 
				#type: #object) #(ComboBoxSpec 
				#layout: #(Rectangle 135 2 180 21) 
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
				#layout: #(Rectangle 181 21 231 40) 
				#name: #att2Value 
				#model: #att2Value 
				#tabable: true 
				#alignment: #right 
				#isReadOnly: false 
				#type: #object) #(ComboBoxSpec 
				#layout: #(Rectangle 135 21 180 40) 
				#name: #att2OpeChoices 
				#model: #att2Ope 
				#comboList: #att2OpeChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 18 21 134 40) 
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