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
			#bounds: #(Rectangle 720 450 1043 664)) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 119 79 303 103) 
				#name: #defaultInputField 
				#model: #defaultValueHolder 
				#helpText: 'Enter a number, a ''String'' or a Symbo as default value for this attribute' 
				#type: #object) #(ActionButtonSpec 
				#layout: #(Rectangle 121 183 202 206) 
				#name: #ActionButton1 
				#model: #accept 
				#label: 'OK' 
				#isDefault: true 
				#defaultable: true) #(CheckBoxSpec 
				#layout: #(Point 23 8) 
				#name: #CheckBox1 
				#model: #setterAccessor 
				#helpText: 'Select to define a Setter accessor' 
				#label: #(UserMessage 
					#key: #setterAccessor 
					#defaultString: 'Setter accessor')) #(CheckBoxSpec 
				#layout: #(Point 23 33) 
				#name: #CheckBox2 
				#model: #getterAccessor 
				#helpText: 'Select to define a Getter accessor' 
				#label: #(UserMessage 
					#key: #getterAccessor 
					#defaultString: 'Getter accessor')) #(CheckBoxSpec 
				#layout: #(Point 138 10) 
				#name: #setNotification 
				#model: #setNotification 
				#helpText: 'add ''''self changed'''' in Getter method' 
				#label: 'Notify observers when changed') #(RadioButtonSpec 
				#layout: #(Point 22 80) 
				#name: #RadioButton1 
				#model: #typeOfValue 
				#helpText: 'Select this option to set a default value' 
				#label: 'Fixed value' 
				#select: #fixedValue) #(RadioButtonSpec 
				#layout: #(Point 22 113) 
				#name: #RadioButton2 
				#model: #typeOfValue 
				#helpText: 'Select this option to define a random value' 
				#label: 'Random value' 
				#select: #randomValue) #(GroupBoxSpec 
				#layout: #(Rectangle 9 57 314 175) 
				#name: #GroupBox1 
				#label: 'Enter a default value for this attribute') #(RadioButtonSpec 
				#layout: #(Point 22 146) 
				#name: #RadioButton3 
				#model: #typeOfValue 
				#helpText: 'Select this option if the attribute has no default value' 
				#label: 'Without default value' 
				#select: #nilAsValue) #(InputFieldSpec 
				#layout: #(Rectangle 119 110 303 135) 
				#name: #randomField 
				#model: #randomValueHolder 
				#isReadOnly: true))))