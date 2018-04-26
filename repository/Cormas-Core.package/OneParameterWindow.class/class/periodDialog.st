interface specs
periodDialog
	"Tools.UIPainter new openOnClass: self andSelector: #periodDialog"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: #(UserMessage 
				#key: #attributAnalysis 
				#defaultString: 'Average on period...') 
			#min: #(Point 276 112) 
			#max: #(Point 276 112) 
			#bounds: #(Rectangle 720 450 996 562) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#layout: #(Rectangle 77 76 136 104) 
				#model: #apply 
				#label: #(UserMessage 
					#key: #valideandclose 
					#defaultString: 'Apply') 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 18 5) 
				#label: #(UserMessage 
					#key: #selectClass 
					#defaultString: 'Enter Min and Max time steps of the period')) #(LabelSpec 
				#layout: #(Point 74 26) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #initValue 
					#defaultString: 'initial step') 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 77 45.5 119 67.5) 
				#name: #InputField1 
				#model: #parameterInitialValue 
				#helpText: 'enter initial value of the attribute' 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 188 26) 
				#name: #Label2 
				#label: #(UserMessage 
					#key: #finalValue 
					#defaultString: 'final step') 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 189 45.5 231 67.5) 
				#name: #InputField2 
				#model: #parameterFinalValue 
				#helpText: 'enter final value of the attribute' 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(ActionButtonSpec 
				#layout: #(Rectangle 157 76 216 104) 
				#name: #cancel 
				#model: #close 
				#label: #(UserMessage 
					#key: #valideandclose 
					#defaultString: 'Cancel') 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 143 44) 
				#name: #Label3 
				#label: #(UserMessage 
					#key: #finalValue 
					#defaultString: 'to:') 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 33 44) 
				#name: #Label4 
				#label: #(UserMessage 
					#key: #finalValue 
					#defaultString: 'From:') 
				#style: #systemDefault))))