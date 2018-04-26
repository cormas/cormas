interface specs
simulationWindow
	"Tools.UIPainter new openOnClass: self andSelector: #simulationWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #openType #advanced #openPosition #(Point 10 305) #positionType #specifiedPosition) 
			#label: 'Simulation' 
			#min: #(Point 395 108) 
			#max: #(Point 404 150) 
			#bounds: #(Rectangle 720 450 1124 558) 
			#colors: #(LookPreferences 
				#setForegroundColor: #(ColorValue #black) 
				#setBackgroundColor: #(ColorValue #white) 
				#setSelectionForegroundColor: #(ColorValue #black) 
				#setSelectionBackgroundColor: #(ColorValue 6143 6143 6143) 
				#setBorderColor: #(ColorValue #black)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ArbitraryComponentSpec 
				#layout: #(Rectangle 120 38 344 91) 
				#name: #ViewHolder1 
				#flags: 0 
				#component: #twoWaysIcon) #(LabelSpec 
				#layout: #(Point 191 24) 
				#label: 'current step' 
				#style: #pixelSmall) #(InputFieldSpec 
				#layout: #(Rectangle 344 52.0 399 76.0) 
				#model: #cycle 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#requestValueChangeSelector: #changeFinalV) 
				#helpText: 'Enter the Final step' 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 242 324) 
				#name: #Label2 
				#label: 'simulation') #(DividerSpec 
				#layout: #(Rectangle 84 25 88 99) 
				#name: #Divider2 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#orientation: #vertical) #(LabelSpec 
				#layout: #(Point 353 24) 
				#name: #Label3 
				#label: 'Final step' 
				#style: #pixelSmall) #(LabelSpec 
				#layout: #(Point 40 -1) 
				#name: #Label6 
				#label: 'Initialize') #(InputFieldSpec 
				#layout: #(LayoutSizedOrigin 190 0 50 0 45 24) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #stepCounter 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#requestValueChangeSelector: #changeV) 
				#tabable: false 
				#helpText: 'current time' 
				#alignment: #right 
				#isReadOnly: false 
				#type: #number 
				#formatString: '0') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 249 0 20 0 40 40) 
				#name: #stepButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #runStepByStep 
				#tabable: false 
				#helpText: 'Execute 1 step' 
				#label: #stepIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 290 0 20 0 43 40) 
				#name: #runButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #run 
				#tabable: false 
				#helpText: 'Run simulation until final step' 
				#label: #runIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 91 0 43 0 43 40) 
				#name: #runBackButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #runBack 
				#tabable: false 
				#helpText: 'Replay simulation backward' 
				#label: #runBackIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 267 -3) 
				#name: #Label1 
				#label: 'Forward' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 106 -3) 
				#name: #Label7 
				#label: 'backward' 
				#style: #systemDefault) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 136 0 43 0 40 40) 
				#name: #stepBackButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #stepBack 
				#tabable: false 
				#helpText: 'Return 1 step backward' 
				#label: #stepBackIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 290 0 61 0 43 40) 
				#name: #replayRunForwardButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #replayRunForward 
				#tabable: false 
				#helpText: 'Replay stored simulation' 
				#label: #replayRunForwardIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 249 0 61 0 40 40) 
				#name: #replayStepForwardButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #replayStepForward 
				#tabable: false 
				#helpText: 'Replay 1 stored step' 
				#label: #replayStepForwardIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 1 32) 
				#name: #Label4 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 7466 2799 2799)) 
				#label: 'simulate' 
				#style: #pixelSmall) #(LabelSpec 
				#layout: #(Point 11 74) 
				#name: #Label5 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4607 1024 8191)) 
				#label: 'replay' 
				#style: #pixelSmall) #(DividerSpec 
				#layout: #(Rectangle 339 25 343 99) 
				#name: #Divider3 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#orientation: #vertical) #(ActionButtonSpec 
				#layout: #(Rectangle 386 2 401 16) 
				#name: #ActionButton1 
				#model: #openSimulationGUI 
				#tabable: false 
				#label: 'X' 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 40 0 20 0 40 40) 
				#name: #ActionButton4 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #openScenarioBuilderWin 
				#tabable: false 
				#helpText: 'Define the scenario' 
				#label: #initSimIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 40 0 61 0 40 40) 
				#name: #ActionButton3 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #openReplayWin 
				#tabable: false 
				#helpText: 'Replay a stored simulation' 
				#label: #initReplayIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 352.5 84 390.5 99) 
				#name: #ActionButton2 
				#model: #setStepMethod 
				#label: 'Change' 
				#style: #pixelSmall 
				#defaultable: true))))