interface specs
valueChooserWindow
	"Tools.UIPainter new openOnClass: self andSelector: #valueChooserWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #DefaultValueChooser 
				#defaultString: 'Default value chooser') 
			#min: #(Point 323 214) 
			#max: #(Point 355 311) 
			#bounds: #(Rectangle 851 493 1174 707)) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 119 77 303 101) 
				#name: #defaultInputField 
				#model: #defaultValueHolder 
				#helpText: 'Enter a number, a String, a Symbo or ''''random'''' as default value for this attribute' 
				#type: #object) #(ActionButtonSpec 
				#layout: #(Rectangle 121 183 202 206) 
				#name: #ActionButton1 
				#model: #ValidateValue 
				#label: 'OK' 
				#isDefault: true 
				#defaultable: true) #(CheckBoxSpec 
				#layout: #(Point 23 8) 
				#name: #CheckBox1 
				#model: #setterAccessor 
				#helpText: 'Select if you want to define a Setter accessor' 
				#label: #(UserMessage 
					#key: #setterAccessor 
					#defaultString: 'Setter accessor')) #(CheckBoxSpec 
				#layout: #(Point 23 33) 
				#name: #CheckBox2 
				#model: #getterAccessor 
				#helpText: 'Select if you want to define a Getter accessor' 
				#label: #(UserMessage 
					#key: #getterAccessor 
					#defaultString: 'Getter accessor')) #(CheckBoxSpec 
				#layout: #(Point 138 33) 
				#name: #setNotification 
				#model: #setNotification 
				#helpText: 'add ''''self changed'''' in Getter method' 
				#label: 'Notify observers when changed') #(RadioButtonSpec 
				#layout: #(Point 22 78) 
				#name: #RadioButton1 
				#model: #typeOfValue 
				#label: 'Fixed value' 
				#select: #fixedValue) #(RadioButtonSpec 
				#layout: #(Point 23 111) 
				#name: #RadioButton2 
				#model: #typeOfValue 
				#label: 'Random value' 
				#select: #randomValue) #(GroupBoxSpec 
				#layout: #(Rectangle 9 57 314 175) 
				#name: #GroupBox1 
				#label: 'Enter a default value for this attribute:') #(RadioButtonSpec 
				#layout: #(Point 22 144) 
				#name: #RadioButton3 
				#model: #typeOfValue 
				#label: 'Without default value' 
				#select: #nilAsValue) #(InputFieldSpec 
				#layout: #(Rectangle 119 111 303 136) 
				#name: #InputField1 
				#model: #randomValueHolder 
				#isReadOnly: true))))