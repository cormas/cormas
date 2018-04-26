interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false) 
			#label: 'Create instances' 
			#min: #(Point 265 152) 
			#max: #(Point 800 152) 
			#bounds: #(Rectangle 800 450 1065 602) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 7798 7798 7798)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
				#layout: #(LayoutSizedOrigin -65 1.0 3 0 59 53) 
				#name: #Region1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue #white)) 
				#lineWidth: 1) #(GroupBoxSpec 
				#layout: #(LayoutFrame 3 0 54 0 -4 1 146 0) 
				#name: #GroupBox1 
				#label: 'Create and initialize N instances') #(InputFieldSpec 
				#layout: #(Rectangle 107 25 134 42) 
				#name: #InputField5 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #nbExistingEntities 
				#tabable: false 
				#helpText: 'Number of entities already created' 
				#alignment: #right 
				#isReadOnly: true 
				#type: #number) #(ComboBoxSpec 
				#layout: #(LayoutFrame 49 0 87 0 -60 1 106 0) 
				#name: #initMethodChoices 
				#model: #initMethod 
				#helpText: 'If necessary, select an #initialization method' 
				#comboList: #initMethodChoices) #(InputFieldSpec 
				#layout: #(Rectangle 8 87.0 46 106.0) 
				#name: #nbEntitiesToCreate 
				#model: #nbEntitiesToCreate 
				#helpText: #(UserMessage 
					#key: #writeNumberEntities 
					#defaultString: 'write the number of Entities to create  or a letter for undetermine number') 
				#alignment: #right 
				#type: #text) #(LabelSpec 
				#layout: #(Point 3 3) 
				#name: #Label3 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 2048 2048 8191)) 
				#label: 'Entity' 
				#style: #systemDefault) #(ComboBoxSpec 
				#layout: #(LayoutFrame 43 0 6 0 -68 1 25 0) 
				#name: #entityChoices 
				#model: #entity 
				#tabable: true 
				#helpText: 'Select a Class to be instanciated' 
				#comboList: #entityChoices) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 56 36) 
				#name: #LabelSituated 
				#flags: 32 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4915 4915 4915)) 
				#label: '(situated' 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 105.5 42 133.5 52) 
				#name: #nbExistingEntitiesSituated 
				#flags: 32 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4915 4915 4915) 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #nbExistingEntitiesSituated 
				#tabable: false 
				#alignment: #right 
				#isReadOnly: true 
				#type: #number) #(LabelSpec 
				#layout: #(Point 6 67) 
				#name: #nbEntitiesToCreate 
				#label: 'Number') #(LabelSpec 
				#layout: #(Point 52 67) 
				#name: #textInitMethodChoices 
				#label: 'Initialization method') #(RadioButtonSpec 
				#layout: #(Point 62 125) 
				#name: #locateCreatedEntities_No 
				#model: #locateCreatedEntities 
				#label: 'no' 
				#select: #no) #(RadioButtonSpec 
				#layout: #(Point 62 109) 
				#name: #locateCreatedEntities_Random 
				#model: #locateCreatedEntities 
				#label: 'randomly' 
				#select: #random) #(LabelSpec 
				#layout: #(Point 5 107) 
				#name: #LabelLocate1 
				#label: 'Locate' 
				#style: #small) #(RadioButtonSpec 
				#layout: #(Point 134 125) 
				#name: #locateCreatedEntities_SpaceView 
				#model: #locateCreatedEntities 
				#label: 'manually' 
				#select: #manually) #(RadioButtonSpec 
				#layout: #(Point 134 109) 
				#name: #locateCreatedEntities_Constrained 
				#model: #locateCreatedEntities 
				#label: 'constrained' 
				#select: #constrained) #(LabelSpec 
				#layout: #(Point 5 122) 
				#name: #LabelLocate2 
				#label: 'instances' 
				#style: #small) #(LabelSpec 
				#layout: #(Point 8 23) 
				#name: #Label1 
				#label: '(number of entities') #(LabelSpec 
				#layout: #(Point 127 23) 
				#name: #Label2 
				#label: ' )') #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 127 35) 
				#name: #Label4 
				#flags: 32 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4915 4915 4915)) 
				#label: ' )' 
				#style: #pixelDefault) #(ArbitraryComponentSpec 
				#layout: #(LayoutSizedOrigin -66 1.0 2 0 62 57) 
				#name: #entityImage 
				#component: #entityImage) #(ActionButtonSpec 
				#layout: #(LayoutOrigin -58 1 82 0) 
				#name: #stopCreateManually 
				#flags: 56 
				#model: #stopLocateManually 
				#label: 'Stop' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(LayoutOrigin -58 1 84 0) 
				#name: #createNentity 
				#model: #createNentity 
				#helpText: 'Create one entity (if located, then click on the grid)' 
				#label: 'Create' 
				#defaultable: true))))