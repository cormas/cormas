interface specs
scenarioBuilderInterface
	"Tools.UIPainter new openOnClass: self andSelector: #scenarioBuilderInterface"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeAutoSave false #labelFromApplication false #openType #advanced #sizeType #lastSavedSize #positionType #screenCenter) 
			#label: 'Confirmation before launching' 
			#min: #(Point 400 200) 
			#max: #(Point 1200 900) 
			#bounds: #(Rectangle 960 540 1615 980) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 268 31) 
				#label: 'Select probes to record' 
				#style: #systemDefault) #(SequenceViewSpec 
				#layout: #(LayoutSizedOrigin 12 0 237 0 236 154) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #listControle 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #actionModifierControle) 
				#helpText: 'select a control method. Ctrl click for several selections') #(SequenceViewSpec 
				#layout: #(LayoutFrame 12 0 53 0 248 0 190 0) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #listInit 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #actionModifierInit) 
				#helpText: 'select an init method. Ctrl click for several selections') #(CheckBoxSpec 
				#layout: #(Point 13 6) 
				#name: #CheckBox1 
				#model: #fixRandomSeed 
				#label: 'Fix the random seed to' 
				#style: #small) #(ActionButtonSpec 
				#layout: #(LayoutFrame 458 0 -40 1 521 0 -8 1) 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #accept 
				#label: 'Apply' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 12 31) 
				#label: 'Select a method of ' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 128 31) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: 'initialization' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 12 216) 
				#label: 'Select a method of' 
				#style: #systemDefault 
				#mnemonic: #'22') #(LabelSpec 
				#layout: #(Point 127 216) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: 'control' 
				#style: #systemDefault) #(CheckBoxSpec 
				#layout: #(Point 12 196) 
				#name: #releaseRandomSeed 
				#flags: 32 
				#model: #releaseRandomSeed 
				#label: 'Release random seed after initialization' 
				#style: #small) #(InputFieldSpec 
				#layout: #(Rectangle 147 5 265 29) 
				#name: #randomSeed 
				#flags: 40 
				#model: #randomSeed 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 12 407) 
				#name: #Label1 
				#label: 'Final step:') #(InputFieldSpec 
				#layout: #(Rectangle 74 406 145 428) 
				#name: #InputField1 
				#model: #finalStep 
				#type: #number 
				#formatString: '0') #(SequenceViewSpec 
				#layout: #(LayoutFrame 269 0 53 0 -15 1 -75 1) 
				#flags: 15 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 6143 8191)) 
				#model: #listProbes 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyProbe) 
				#helpText: 'select the probes (indicators). Ctrl click for several probes' 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(ActionButtonSpec 
				#layout: #(LayoutFrame 388.5 0 -40 1 450.5 0 -8 1) 
				#name: #cancel 
				#model: #cancel 
				#label: 'Cancel' 
				#defaultable: true) #(CheckBoxSpec 
				#layout: #(LayoutSizedOrigin 269 0 -67 1.0 122 19) 
				#name: #CheckBox2 
				#model: #enableBackwardValue 
				#helpText: 'Backward option will store each step of the model' 
				#label: 'Enable stepping back'))))