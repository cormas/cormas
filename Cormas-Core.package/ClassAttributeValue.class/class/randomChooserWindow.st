interface specs
randomChooserWindow
	"Tools.UIPainter new openOnClass: self andSelector: #randomChooserWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Random chooser' 
			#min: #(Point 229 211) 
			#max: #(Point 329 311) 
			#bounds: #(Rectangle 720 450 949 661)) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 21 73) 
				#name: #Label1 
				#label: 'Enter the range limits:' 
				#style: #systemDefault) #(InputFieldSpec 
				#layout: #(Rectangle 43 117.5 94 142.5) 
				#model: #minValueHolder 
				#helpText: 'Write a number, a String or a Symbol as default value for this attribute' 
				#type: #object) #(ActionButtonSpec 
				#layout: #(Rectangle 25 171 106 194) 
				#name: #ActionButton1 
				#model: #accept 
				#label: 'OK' 
				#isDefault: true 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 128 171 209 194) 
				#name: #ActionButton2 
				#model: #cancel 
				#label: 'Cancel' 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 13 6 211 70) 
				#name: #GroupBox1 
				#label: 'Number type' 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 134 118 185 142) 
				#name: #InputField1 
				#model: #maxValueHolder 
				#type: #object) #(LabelSpec 
				#layout: #(Point 148 95) 
				#name: #Label2 
				#label: 'and:' 
				#style: #small) #(LabelSpec 
				#layout: #(Point 42 95) 
				#name: #Label3 
				#label: 'between:' 
				#style: #small) #(RadioButtonSpec 
				#layout: #(Point 62 22) 
				#name: #RadioButton1 
				#model: #intOrFloat 
				#label: 'random Integer' 
				#select: #randomInteger) #(RadioButtonSpec 
				#layout: #(Point 62 45) 
				#name: #RadioButton2 
				#model: #intOrFloat 
				#label: 'random Float' 
				#select: #randomFloat) #(InputFieldSpec 
				#layout: #(Rectangle 24 115 42 143) 
				#name: #lowerConstraint 
				#flags: 0 
				#model: #lowerConstraint 
				#tabable: false 
				#style: #large 
				#isReadOnly: true) #(InputFieldSpec 
				#layout: #(Rectangle 186 115 204 143) 
				#name: #upperConstraint 
				#flags: 0 
				#model: #upperConstraint 
				#tabable: false 
				#style: #large 
				#isReadOnly: true) #(LabelSpec 
				#layout: #(Point 108 120) 
				#name: #Label4 
				#label: ';'))))