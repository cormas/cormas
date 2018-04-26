interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Stochastic analysis setter' 
			#min: #(Point 590 486) 
			#max: #(Point 590 627) 
			#bounds: #(Rectangle 719 321 1309 807) 
			#flags: 4 
			#menu: #menuBar 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
				#layout: #(Rectangle 144 424 266 459) 
				#name: #Region1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 6655 5119 8191) 
					#setBackgroundColor: #(ColorValue 4096 0 8191)) 
				#lineWidth: 1) #(SequenceViewSpec 
				#layout: #(Rectangle 338 80 581 265) 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 6143 8191)) 
				#model: #listProbes 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyProbe) 
				#helpText: 'select the probes (indicators). Ctrl click for several probes' 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(Point 340 56) 
				#label: 'Select global probes to record' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 349 297) 
				#name: #Label4 
				#label: 'Save as:') #(CheckBoxSpec 
				#layout: #(Point 9 42) 
				#name: #CheckBox1 
				#model: #fixRandomSeed 
				#helpText: 'Select if you want to fix the random seed and start each simulation with same seed value. Thus, each initial state will be identical' 
				#label: 'Fix the random seed') #(ActionButtonSpec 
				#layout: #(Rectangle 150 429 198 454) 
				#model: #apply 
				#label: 'Apply' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 213 429 260 454) 
				#name: #cancel 
				#model: #close 
				#label: 'Cancel' 
				#defaultable: true) #(CheckBoxSpec 
				#layout: #(Point 11 237) 
				#name: #releaseRandomSeed 
				#flags: 32 
				#model: #releaseRandomSeed 
				#helpText: 'Select if you want to release the initial random seed. Thus, each run may be different' 
				#label: 'Release random seed after initialization') #(LabelSpec 
				#layout: #(Point 24 425) 
				#name: #Label6 
				#label: 'final step:') #(InputFieldSpec 
				#layout: #(Rectangle 80 425 122 447) 
				#name: #InputField1 
				#model: #finalStep 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(DividerSpec 
				#layout: #(Rectangle -4 35 589 39) 
				#name: #Divider1) #(InputFieldSpec 
				#layout: #(Rectangle 152 47 262 71) 
				#name: #randomSeed 
				#flags: 40 
				#model: #randomSeed 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(MenuButtonSpec 
				#layout: #(Rectangle 432 297 572 320) 
				#name: #MenuButton1 
				#model: #fileFormat 
				#menu: #fileFormatChooser) #(SequenceViewSpec 
				#layout: #(Rectangle 378 340 573 434) 
				#name: #List2 
				#model: #probeFormat 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #help) 
				#menu: #menuProbeFormat 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(Point 349 321) 
				#name: #Label3 
				#label: 'Record as:') #(GroupBoxSpec 
				#layout: #(Rectangle 337 277 582 460) 
				#name: #GroupBox1 
				#label: 'Output format') #(SequenceViewSpec 
				#layout: #(LayoutFrame 26 0 99 0 263 0 228 0) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #listInit 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #actionModifierInit) 
				#helpText: 'select an init method. Ctrl click for several selections') #(SequenceViewSpec 
				#layout: #(LayoutFrame 26 0 280 0 263 0 409 0) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #listControle 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #actionModifierControle) 
				#helpText: 'select a control method. Ctrl click for several selections') #(LabelSpec 
				#layout: #(Point 392 6) 
				#name: #Label7 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 2064 4120 0)) 
				#label: 'Number of repetitions:') #(InputFieldSpec 
				#layout: #(Rectangle 525 6 579 28) 
				#name: #InputField2 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 3167 6339 0)) 
				#model: #nbOfRepeat 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 350 439) 
				#name: #periodLabel 
				#flags: 16 
				#label: 'Averaged on period: ' 
				#style: #small) #(InputFieldSpec 
				#layout: #(Rectangle 469 437 574 457) 
				#name: #periodField 
				#flags: 24 
				#model: #periodField 
				#isReadOnly: true) #(LabelSpec 
				#layout: #(Point 3 6) 
				#name: #Label12 
				#label: 'This simple analysis is usefull for ') #(LabelSpec 
				#layout: #(Point 185 6) 
				#name: #Label13 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: 'stochastic models') #(LabelSpec 
				#layout: #(Point 25 78) 
				#label: 'Select an ' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 83 78) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: 'init' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 101 78) 
				#name: #Label1 
				#label: 'method' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 28 56) 
				#name: #Label8 
				#label: 'for initialization to:') #(LabelSpec 
				#layout: #(Point 27 260) 
				#name: #Label2 
				#label: 'Select a ' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 79 260) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: 'step' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 106 260) 
				#name: #Label5 
				#label: 'method' 
				#style: #systemDefault))))