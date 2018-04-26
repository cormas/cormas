interface specs
dialogNewParameter
	"Tools.UIPainter new openOnClass: self andSelector: #dialogNewParameter"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: #(UserMessage 
				#key: #attributAnalysis 
				#defaultString: 'One attribute analysis') 
			#min: #(Point 407 329) 
			#max: #(Point 407 329) 
			#bounds: #(Rectangle 640 427 1047 756) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(Rectangle 16 34 186 162) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #classesList 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #actionModifierInit)) #(SequenceViewSpec 
				#layout: #(Rectangle 214 35 385 161) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #attributsList 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #actionModifierControle)) #(ActionButtonSpec 
				#layout: #(Rectangle 144 286 258 316) 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 8191 4096) 
					#setSelectionBackgroundColor: #(ColorValue 759 6197 759)) 
				#model: #confirmParameter 
				#label: #(UserMessage 
					#key: #valideandclose 
					#defaultString: 'Apply and close') 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 13 5) 
				#label: #(UserMessage 
					#key: #selectClass 
					#defaultString: 'Select a Class')) #(LabelSpec 
				#layout: #(Point 211 5) 
				#label: #(UserMessage 
					#key: #selectAnAttribut 
					#defaultString: 'Select an attribute')) #(LabelSpec 
				#layout: #(Point 17 258) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #initValue 
					#defaultString: 'Initial value')) #(InputFieldSpec 
				#layout: #(Rectangle 89 257 131 279) 
				#name: #InputField1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 8191 4096)) 
				#model: #parameterInitialValue 
				#helpText: 'enter initial value of the attribute' 
				#alignment: #right 
				#type: #number 
				#formatString: '0.00') #(LabelSpec 
				#layout: #(Point 148 258) 
				#name: #Label2 
				#label: #(UserMessage 
					#key: #finalValue 
					#defaultString: 'Final value')) #(InputFieldSpec 
				#layout: #(Rectangle 211 257 253 279) 
				#name: #InputField2 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 8191 4096)) 
				#model: #parameterFinalValue 
				#helpText: 'enter final value of the attribute' 
				#alignment: #right 
				#type: #number 
				#formatString: '0.00') #(LabelSpec 
				#layout: #(Point 273 258) 
				#name: #Label3 
				#label: #(UserMessage 
					#key: #stepValue 
					#defaultString: 'Step value')) #(InputFieldSpec 
				#layout: #(Rectangle 338 257 380 279) 
				#name: #InputField3 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 8191 4096)) 
				#model: #parameterStep 
				#helpText: 'enter a value for the step that will increment the attribute' 
				#alignment: #right 
				#type: #number 
				#formatString: '0.00') #(GroupBoxSpec 
				#layout: #(Rectangle 13 235 386 320) 
				#name: #GroupBox1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 759 6197 759) 
					#setBackgroundColor: #(ColorValue 7178 8191 6141)) 
				#label: #(UserMessage 
					#key: #enterParameterValues 
					#defaultString: 'Set the Parameter Values')) #(GroupBoxSpec 
				#layout: #(Rectangle 13 174 386 231) 
				#name: #GroupBox2 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue) 
					#setBackgroundColor: #(ColorValue 6143 8191 8191)) 
				#label: #(UserMessage 
					#key: #enterParameterValue 
					#defaultString: 'Set the Parameter Value')) #(ActionButtonSpec 
				#layout: #(Rectangle 238 191 355 220) 
				#name: #ActionButton1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 4096 6143 8191)) 
				#model: #confirm1Parameter 
				#label: #(UserMessage 
					#key: #valideandclose 
					#defaultString: 'Apply and close') 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 19 195) 
				#name: #Label4 
				#label: #(UserMessage 
					#key: #newValue 
					#defaultString: 'New value : ')) #(InputFieldSpec 
				#layout: #(Rectangle 116 194 158 216) 
				#name: #InputField4 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 4096 6143 8191)) 
				#model: #parameterInitialValue 
				#helpText: 'set a new value to the attribute' 
				#alignment: #right 
				#type: #number 
				#formatString: '0.00'))))