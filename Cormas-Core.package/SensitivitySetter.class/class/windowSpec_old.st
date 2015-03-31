interface specs
windowSpec_old
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Parameters' 
			#min: #(Point 623 295) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 720 437 1431 900) 
			#flags: 12 
			#menu: #menuBar) 
		#component: #(SpecCollection 
			#collection: #(#(GroupBoxSpec 
				#layout: #(Rectangle 289 2 469 213) 
				#name: #GroupBox2 
				#label: 'Output format') #(RegionSpec 
				#layout: #(Rectangle 548 193 655 225) 
				#name: #Region1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 7167 6143 8191) 
					#setBackgroundColor: #(ColorValue 5119 2048 8191)) 
				#lineWidth: 1) #(ActionButtonSpec 
				#layout: #(Rectangle 554 197 596 221) 
				#name: #Apply 
				#model: #apply 
				#label: 'Apply' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 604 197 649 221) 
				#name: #resetValues 
				#model: #resetValues 
				#helpText: 'Reset the parameters to their default value' 
				#label: 'Reset' 
				#defaultable: true) #(DataSetSpec 
				#properties: #(PropertyListDictionary #showVerticalLines true #allowColumnReordering true #showLineNumbers true #rowSize 30 #allowColumnResizing true #showHorizontalLines true) 
				#layout: #(LayoutFrame 11 0 235 0 0 1.00563 0 1.00924) 
				#name: #Dataset1 
				#model: #classAttribValue_List 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #allowSorting true #labelFromApplication false) 
					#label: 'N¬∞' 
					#labelIsImage: false 
					#width: 30 
					#rendererType: #rowSelector 
					#editorType: #rowSelector 
					#noScroll: false 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow classNameAsString' 
					#label: 'Class' 
					#labelIsImage: false 
					#width: 165 
					#rendererType: #Text 
					#editorType: #None 
					#noScroll: false 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow attributeAsString' 
					#label: 'Attribute' 
					#labelIsImage: false 
					#width: 165 
					#rendererType: #Text 
					#editorType: #None 
					#noScroll: false 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow currentValueAsString' 
					#label: 'Current value' 
					#labelIsImage: false 
					#width: 80 
					#rendererType: #Text 
					#editorType: #None 
					#type: #object 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow initValue' 
					#label: 'Initial value' 
					#labelIsImage: false 
					#width: 80 
					#editorType: #InputField 
					#type: #object 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow finalValue' 
					#label: 'Final value' 
					#labelIsImage: false 
					#width: 80 
					#editorType: #InputField 
					#type: #object 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow step' 
					#label: 'Step' 
					#labelIsImage: false 
					#width: 80 
					#editorType: #InputField 
					#type: #object 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true)) 
				#labelsAsButtons: true) #(RadioButtonSpec 
				#layout: #(Point 274 210) 
				#name: #RadioButton1 
				#helpText: 'Each parameter is analysed sequentialy' 
				#label: 'Sequential') #(RadioButtonSpec 
				#layout: #(Point 351 210) 
				#name: #RadioButton2 
				#helpText: 'All parameters will be analysed by crossing the values' 
				#label: 'Crossed') #(LabelSpec 
				#layout: #(Point 199 209) 
				#name: #Label1 
				#label: 'Analysis type:') #(CheckBoxSpec 
				#layout: #(Point 511 106) 
				#name: #CheckBox1 
				#model: #fixRandomSeed 
				#helpText: 'Select if you want to fix the random seed and start each simulation with same seed value' 
				#label: 'Fix the random seed to:') #(LabelSpec 
				#layout: #(Point 510 161) 
				#name: #Label2 
				#label: 'Number of repetitions') #(InputFieldSpec 
				#layout: #(Rectangle 622 160 669 182) 
				#name: #nbOfRepeat 
				#model: #nbOfRepeat 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(InputFieldSpec 
				#layout: #(Rectangle 511 130 668 154) 
				#name: #randomSeed 
				#flags: 40 
				#model: #randomSeed 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(SequenceViewSpec 
				#layout: #(Rectangle 12 23 286 212) 
				#name: #listProbes 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 6143 8191)) 
				#model: #listProbes 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyProbe) 
				#helpText: 'click on the probes (Ctrl for multi selection)' 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(Point 486 25) 
				#name: #Label3 
				#label: 'init:') #(LabelSpec 
				#layout: #(Point 481 52) 
				#name: #Label4 
				#label: 'step:') #(GroupBoxSpec 
				#layout: #(Rectangle 478 2 677 81) 
				#name: #GroupBox1 
				#label: 'Choose init and step methods') #(LabelSpec 
				#layout: #(Point 13 -1) 
				#name: #Label5 
				#label: 'Select probes to record') #(LabelSpec 
				#layout: #(Point 294 72) 
				#name: #Label6 
				#label: 'Record as:') #(SequenceViewSpec 
				#layout: #(Rectangle 294 93 459 203) 
				#name: #List1 
				#model: #probeFormat 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(Point 295 24) 
				#name: #Label7 
				#label: 'Save as:') #(MenuButtonSpec 
				#layout: #(Rectangle 295 45 460 66) 
				#name: #MenuButton1 
				#model: #fileFormat 
				#menu: #fileFormatChooser) #(GroupBoxSpec 
				#layout: #(Rectangle 477 91 675 188) 
				#name: #GroupBox3 
				#label: 'Randomness') #(ComboBoxSpec 
				#layout: #(Rectangle 508 25 669 46) 
				#name: #ComboBox1 
				#model: #initMethod 
				#comboList: #initMethodChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 509 52 670 74) 
				#name: #ComboBox2 
				#model: #stepMethod 
				#comboList: #stepMethodChoices))))