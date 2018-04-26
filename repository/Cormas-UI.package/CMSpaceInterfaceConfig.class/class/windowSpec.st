interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Configure Habitus for view: ' 
			#min: #(Point 502 464) 
			#max: #(Point 502 464) 
			#bounds: #(Rectangle 800 406 1302 870) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 7757 7757 7757))) 
		#component: #(SpecCollection 
			#collection: #(#(TextEditorSpec 
				#layout: #(Rectangle 388 0 475 22) 
				#name: #TextEditor1 
				#flags: 4 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#tabable: false 
				#menu: #displayOptionsMenu 
				#tabRequiresControl: false 
				#isWrapped: false) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 6 0 30 23) 
				#name: #ActionButton4 
				#flags: 0 
				#model: #loadConfig 
				#helpText: 'Load existing configuration' 
				#label: #load 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(DividerSpec 
				#layout: #(Rectangle 35 0 39 23) 
				#name: #Divider1 
				#orientation: #vertical) #(DividerSpec 
				#layout: #(LayoutFrame 0 0 23 0 0 1.0 27 0) 
				#name: #Divider2) #(LabelSpec 
				#layout: #(LayoutFrame 44 0 2 0 116 0 24 0) 
				#name: #Label3 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue)) 
				#label: 'Habitus name') #(InputFieldSpec 
				#layout: #(LayoutFrame 118 0 1 0 218 0 22 0) 
				#name: #InputField1 
				#model: #configName 
				#helpText: 'Name it ''default'', to have this configuration loaded when a space window is open for the first time') #(LabelSpec 
				#layout: #(Rectangle 12 26 157 47) 
				#name: #Label5 
				#label: 'Entities that can be observed') #(LabelSpec 
				#layout: #(Rectangle 10 247 168 268) 
				#name: #Label4 
				#label: 'Entities that can be manipulated') #(SequenceViewSpec 
				#layout: #(Rectangle 10 269 165 434) 
				#name: #List6 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7167 7167 8191)) 
				#model: #manipEntitiesList 
				#tabable: false 
				#menu: #manipEntityMenu 
				#multipleSelections: false 
				#selectionType: #highlight 
				#autoSelect: false) #(LabelSpec 
				#layout: #(Rectangle 340 247 477 268) 
				#name: #Label1 
				#label: 'Entities that can be created') #(SequenceViewSpec 
				#layout: #(Rectangle 339 269 494 434) 
				#name: #List1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #createEntitiesList 
				#tabable: false 
				#menu: #createEntityMenu 
				#multipleSelections: false 
				#selectionType: #highlight 
				#autoSelect: false) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 34 437 59 460) 
				#name: #addManip 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7167 7167 8191)) 
				#model: #addManipEntities 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 61 437 86 460) 
				#name: #removeManip 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7167 7167 8191)) 
				#model: #removeManipEntity 
				#label: #minusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 367 437 392 460) 
				#name: #ActionButton2 
				#model: #addCreateEntities 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 394 437 419 460) 
				#name: #ActionButton3 
				#model: #removeCreateEntity 
				#label: #minusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(SequenceViewSpec 
				#layout: #(Rectangle 10 48 165 214) 
				#name: #List5 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7167 7167 8191)) 
				#model: #observedEntitiesList 
				#tabable: false 
				#menu: #observedEntityMenu 
				#multipleSelections: false 
				#selectionType: #highlight 
				#autoSelect: false) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 33 217 58 240) 
				#name: #ActionButton5 
				#model: #addObservedEntities 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 60 217 85 240) 
				#name: #ActionButton6 
				#model: #removeObservedEntity 
				#label: #minusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(SequenceViewSpec 
				#layout: #(Rectangle 170 320 333 434) 
				#name: #List2 
				#model: #manipMethodsList 
				#menu: #manipMethodsMenu 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #highlight) #(CheckBoxSpec 
				#layout: #(Point 179 272) 
				#name: #moveEntityCheckBox 
				#model: #moveEntityCheckBox 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#valueChangeSelector: #setMoveEntity 
					#requestFocusInSelector: #manipChekboxValidation) 
				#label: 'can be moved?') #(LabelSpec 
				#layout: #(Point 173 302) 
				#name: #Label2 
				#label: 'authorized methods') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 212 439 231 458) 
				#name: #ActionButton7 
				#model: #addManipMethods 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 233 439 251 458) 
				#name: #ActionButton8 
				#model: #removeManipMethod 
				#label: #minusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 171 30) 
				#name: #Label6 
				#label: 'authorized pov') #(LabelSpec 
				#layout: #(Point 171 130) 
				#name: #Label7 
				#label: 'authorized attributes') #(SequenceViewSpec 
				#layout: #(Rectangle 170 47 324 112) 
				#name: #List3 
				#model: #povMethodsList 
				#menu: #povMethodsMenu 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #highlight) #(SequenceViewSpec 
				#layout: #(Rectangle 170 147 324 214) 
				#name: #List4 
				#model: #attributesList 
				#menu: #attributesMenu 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #highlight) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 225 216 243 235) 
				#name: #ActionButton9 
				#model: #removeAttribute 
				#label: #minusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 204 216 223 235) 
				#name: #ActionButton10 
				#model: #addAttribute 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 225 114 243 133) 
				#name: #ActionButton11 
				#model: #removePovMethod 
				#label: #minusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 204 114 223 133) 
				#name: #ActionButton12 
				#model: #addPovMethods 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 330 30) 
				#name: #Label8 
				#label: 'authorized info') #(LabelSpec 
				#layout: #(Point 330 130) 
				#name: #Label9 
				#label: 'authorized probes') #(SequenceViewSpec 
				#layout: #(Rectangle 329 47 483 112) 
				#name: #List7 
				#model: #infoMethodsList 
				#menu: #infoMethodsMenu 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #highlight) #(SequenceViewSpec 
				#layout: #(Rectangle 329 147 483 214) 
				#name: #List8 
				#model: #probeMethodsList 
				#menu: #probeMethodsMenu 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #highlight) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 384 216 402 235) 
				#name: #ActionButton13 
				#model: #removeProbeMethod 
				#label: #minusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 363 216 382 235) 
				#name: #ActionButton14 
				#model: #addProbeMethods 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 384 114 402 133) 
				#name: #ActionButton15 
				#model: #removeInfoMethod 
				#label: #minusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 363 114 382 133) 
				#name: #ActionButton16 
				#model: #addInfoMethods 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 223 0 247 23) 
				#name: #ActionButton17 
				#flags: 0 
				#model: #saveConfig 
				#helpText: 'Save the Habitus with a specific name to reuse later' 
				#label: #save 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 258 0 282 23) 
				#name: #ActionButton1 
				#flags: 0 
				#model: #applyCurrentSettings 
				#helpText: 'Apply current Habitus settings to the associated space interface' 
				#label: #apply 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(DividerSpec 
				#layout: #(Rectangle 251 0 255 23) 
				#name: #Divider3 
				#orientation: #vertical) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 478 0 502 23) 
				#name: #ActionButton18 
				#flags: 0 
				#model: #explainHabitus 
				#helpText: 'What is Habitus' 
				#label: #question 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(CheckBoxSpec 
				#layout: #(Point 179 258) 
				#name: #manipWholePopCheckBox 
				#model: #manipWholePopCheckBox 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#valueChangeSelector: #setManipWholePop 
					#requestFocusInSelector: #manipChekboxValidation) 
				#label: 'can manipulate whole pop?') #(CheckBoxSpec 
				#layout: #(Point 179 286) 
				#name: #canChangeValuesCheckBox 
				#model: #canChangeValuesCheckBox 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#valueChangeSelector: #setChangeValues 
					#requestFocusInSelector: #manipChekboxValidation) 
				#label: 'can change values?') #(LabelSpec 
				#layout: #(Point 395 0) 
				#name: #Label11 
				#label: 'Display options'))))