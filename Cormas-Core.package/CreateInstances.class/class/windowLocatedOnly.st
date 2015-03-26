interface specs
windowLocatedOnly
	"Tools.UIPainter new openOnClass: self andSelector: #windowLocatedOnly"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false) 
			#label: 'Create instances' 
			#min: #(Point 271 148) 
			#max: #(Point 800 148) 
			#bounds: #(Rectangle 720 450 991 598) 
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
				#layout: #(LayoutFrame 5 0 53 0 -2 1 145 0) 
				#name: #GroupBox1 
				#label: 'Create and initialize N instances') #(InputFieldSpec 
				#layout: #(Rectangle 106 25 133 42) 
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
				#layout: #(LayoutFrame 49 0 85.0 0 -60 1 104.0 0) 
				#name: #initMethodChoices 
				#model: #initMethod 
				#helpText: 'If necessary, select an #initialization method' 
				#comboList: #initMethodChoices) #(InputFieldSpec 
				#layout: #(Rectangle 8 85.0 46 104.0) 
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
				#layout: #(Point 6 65) 
				#name: #nbEntitiesToCreate 
				#label: 'Number') #(LabelSpec 
				#layout: #(Point 52 65) 
				#name: #textInitMethodChoices 
				#label: 'Initialization method') #(RadioButtonSpec 
				#layout: #(Point 63 107) 
				#name: #locateCreatedEntities_Random 
				#model: #locateCreatedEntities 
				#label: 'randomly' 
				#select: #random) #(LabelSpec 
				#layout: #(Point 5 105) 
				#name: #LabelLocate1 
				#label: 'Locate' 
				#style: #small) #(RadioButtonSpec 
				#layout: #(Point 63 123) 
				#name: #locateCreatedEntities_SpaceView 
				#model: #locateCreatedEntities 
				#label: 'manually' 
				#select: #manually) #(RadioButtonSpec 
				#layout: #(Point 135 107) 
				#name: #locateCreatedEntities_Constrained 
				#model: #locateCreatedEntities 
				#label: 'constrained' 
				#select: #constrained) #(LabelSpec 
				#layout: #(Point 5 120) 
				#name: #LabelLocate2 
				#label: 'instances' 
				#style: #small) #(LabelSpec 
				#layout: #(Point 7 23) 
				#name: #Label1 
				#label: '(number of entities') #(LabelSpec 
				#layout: #(Point 126 23) 
				#name: #Label2 
				#label: ' )') #(ArbitraryComponentSpec 
				#layout: #(LayoutSizedOrigin -66 1.0 2 0 62 57) 
				#name: #entityImage 
				#component: #entityImage) #(ActionButtonSpec 
				#layout: #(LayoutOrigin -58 1 82 0) 
				#name: #stopCreateManually 
				#flags: 56 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red) 
					#setBackgroundColor: #(ColorValue #yellow)) 
				#model: #stopLocateManually 
				#label: 'Stop' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(LayoutOrigin -58 1 82 0) 
				#name: #createNentity 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #createNentity 
				#helpText: 'Create one entity (if located, then click on the grid)' 
				#label: 'Create' 
				#defaultable: true))))