interface specs
reducedCommandsBar
	"UIPainter new openOnClass: self andSelector: #reducedCommandsBar"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'CORMAS' 
			#min: #(Point 571 35) 
			#max: #(Point 571 35) 
			#bounds: #(Rectangle 282 380 853 415) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue #white)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 391 6 430 30) 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #stepCounter 
				#alignment: #right 
				#isReadOnly: true 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 352 8) 
				#label: #(UserMessage 
					#key: #time 
					#defaultString: 'Horloge')) #(InputFieldSpec 
				#layout: #(Rectangle 303 5 343 31) 
				#model: #cycle 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(ActionButtonSpec 
				#layout: #(Rectangle 119 5 189 32) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #runStepByStep 
				#label: #(UserMessage 
					#key: #step 
					#defaultString: 'Pas a pas') 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 43 5 117 32) 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #openScenarioBuilderWin 
				#label: #(UserMessage 
					#key: #initialiser 
					#defaultString: 'Initialiser...') 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 193 5 280 32) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #runSimulation 
				#label: #(UserMessage 
					#key: #ntimes 
					#defaultString: 'Lancer N fois') 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 6 7 32 30) 
				#model: #expandMainWindow 
				#label: '<->' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 242 324) 
				#name: #Label2 
				#label: 'simulation') #(LabelSpec 
				#layout: #(Point 446 8) 
				#name: #Label1 
				#label: 'simulation') #(ActionButtonSpec 
				#layout: #(Rectangle 501 6 560 30) 
				#name: #simButton2 
				#model: #openParametersWin 
				#label: '0' 
				#defaultable: true))))