interface specs
changeStepInterface
	"Tools.UIPainter new openOnClass: self andSelector: #changeStepInterface"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeAutoSave false #openType #advanced #sizeType #lastSavedSize #positionType #lastSavedPosition #labelFromApplication false #positionAutoSave true) 
			#label: '#step method choice' 
			#min: #(Point 265 305) 
			#max: #(Point 265 305) 
			#bounds: #(Rectangle 960 540 1225 845) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(LayoutSizedOrigin 12 0 27 0 236 154) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #listControle 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #actionModifierControle) 
				#helpText: 'select a control method. Ctrl click for several selections') #(ActionButtonSpec 
				#layout: #(Rectangle 146 266 209 298) 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #accept 
				#label: 'Apply' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 51 266 113 298) 
				#name: #cancel 
				#model: #cancel 
				#label: 'Cancel' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 12 6) 
				#label: 'Select a method of' 
				#style: #systemDefault 
				#mnemonic: #'22') #(LabelSpec 
				#layout: #(Point 127 6) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: 'control' 
				#style: #systemDefault) #(CheckBoxSpec 
				#layout: #(Point 13 215) 
				#name: #releaseRandomSeed 
				#model: #releaseRandomSeed 
				#label: 'Initialize  randomness') #(CheckBoxSpec 
				#layout: #(Point 13 238) 
				#name: #CheckBox2 
				#model: #enableBackwardValue 
				#helpText: 'Backward option will store each step of the model' 
				#label: 'Enable stepping back') #(LabelSpec 
				#layout: #(Point 12 190) 
				#name: #Label1 
				#label: 'Final step:') #(InputFieldSpec 
				#layout: #(Rectangle 74 189 145 211) 
				#name: #InputField1 
				#model: #finalStep 
				#type: #number 
				#formatString: '0'))))