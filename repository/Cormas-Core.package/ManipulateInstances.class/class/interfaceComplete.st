obsolete
interfaceComplete
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false) 
			#label: 'Manipulate instances' 
			#min: #(Point 315 406) 
			#max: #(Point 315 406) 
			#bounds: #(Rectangle 640 364 955 770) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 7167 8191 6143)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(GroupBoxSpec 
				#layout: #(Rectangle 7 292 304 398) 
				#name: #GroupBox5 
				#label: #(UserMessage 
					#key: #povDefinition 
					#defaultString: 'Ask selected entities to')) #(RegionSpec 
				#layout: #(Rectangle 228 12 303 86) 
				#name: #Region1 
				#flags: 16 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue #white)) 
				#lineWidth: 1) #(GroupBoxSpec 
				#layout: #(Rectangle 7 91 305 182) 
				#name: #GroupBoxCreateInstances 
				#label: #(UserMessage 
					#key: #povDefinition 
					#defaultString: 'Create and initialize N instances')) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 9 106) 
				#name: #textNbInstancesToCreate 
				#label: 'Number of instances' 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 23 126 65 147) 
				#name: #nbEntitiesToCreate 
				#model: #nbEntitiesToCreate 
				#alignment: #right 
				#type: #number) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 108 106) 
				#name: #textInitMethodChoices 
				#label: 'Initialization method' 
				#style: #pixelDefault) #(ComboBoxSpec 
				#layout: #(Rectangle 96 126 213 147) 
				#name: #initMethodChoices 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #initMethod 
				#comboList: #initMethodChoices) #(ActionButtonSpec 
				#layout: #(Rectangle 226 124 291 148) 
				#name: #createNentity 
				#model: #createNentity 
				#label: 'Create' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 195 225 245 246) 
				#name: #InputField2 
				#model: #testValue 
				#alignment: #right 
				#type: #object) #(ActionButtonSpec 
				#layout: #(Rectangle 207 309 239 333) 
				#name: #ActionButton2 
				#model: #executeMethodOnEntities 
				#label: 'Do' 
				#defaultable: true) #(ArbitraryComponentSpec 
				#layout: #(Rectangle 228 10 306 88) 
				#name: #entityImage 
				#flags: 24 
				#component: #entityImage) #(GroupBoxSpec 
				#layout: #(Rectangle 6 27 198 84) 
				#name: #GroupBox2 
				#label: 'Number of entites') #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 28 39) 
				#name: #Label6 
				#label: 'All' 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 18 56 72 77) 
				#name: #InputField5 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #nbExistingEntities 
				#alignment: #right 
				#isReadOnly: true 
				#type: #number) #(GroupBoxSpec 
				#layout: #(Rectangle 7 192 304 292) 
				#name: #GroupBox7 
				#label: #(UserMessage 
					#key: #povDefinition 
					#defaultString: 'Select a subset of entities or')) #(ComboBoxSpec 
				#layout: #(Rectangle 141 225 186 246) 
				#name: #ComboBox4 
				#model: #operator 
				#comboList: #operatorChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 81 310.5 197 331.5) 
				#name: #ComboBox5 
				#model: #controlMethod 
				#comboList: #controlMethodChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 15 225 132 246) 
				#name: #ComboBox2 
				#model: #testElement 
				#comboList: #testElementChoices) #(LabelSpec 
				#layout: #(Point 17 207) 
				#name: #Label2 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: 'criteria to test') 
				#style: #pixelDefault) #(ActionButtonSpec 
				#layout: #(Rectangle 154 193 215 209.5) 
				#name: #ActionButton4 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 1024 1024 8191)) 
				#model: #selectAllEntities 
				#label: 'Select All' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 85 254.0 132 269.0) 
				#name: #ActionButton5 
				#model: #addToEntitiesSelection 
				#label: 'Add' 
				#style: #small 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 200 208) 
				#name: #Label7 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: 'threshold') 
				#style: #pixelDefault) #(ActionButtonSpec 
				#layout: #(Rectangle 96 367 164 391) 
				#name: #setColorOfEntities 
				#model: #setColorOfEntities 
				#label: 'Change color' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 39 367 90 391) 
				#name: #ActionButton3 
				#model: #inspectSelectedEntities 
				#label: 'Inspect' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 253 250 285 269) 
				#name: #InputField3 
				#model: #nbEntitiesSelected 
				#alignment: #right 
				#type: #object) #(LabelSpec 
				#layout: #(Point 196 251) 
				#name: #Label4 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: 'Nb selected') 
				#style: #pixelDefault) #(LabelSpec 
				#layout: #(Point 198 267) 
				#name: #LabelNb_situated 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: 'Nb situated') 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 253 268 285 287) 
				#name: #nbEntitiesSelectedSituated 
				#model: #nbEntitiesSelectedSituated 
				#alignment: #right 
				#type: #object) #(LabelSpec 
				#layout: #(Point 65 257) 
				#name: #Label10 
				#label: 'or') #(LabelSpec 
				#layout: #(Point 176 259) 
				#name: #Label11 
				#label: '->') #(ComboBoxSpec 
				#layout: #(Rectangle 81 338 197 359) 
				#name: #ComboBox3 
				#model: #attributeToChange 
				#comboList: #attributeToChangeChoices) #(ActionButtonSpec 
				#layout: #(Rectangle 264 336.5 296 360.5) 
				#name: #ActionButton7 
				#model: #setAttributeValue 
				#label: 'Do' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 207 338 257 359) 
				#name: #InputField6 
				#model: #valueForAttribute 
				#type: #object) #(LabelSpec 
				#layout: #(Point 16 -1) 
				#name: #Label3 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 2048 2048 8191)) 
				#label: 'Entity' 
				#style: #large) #(RadioButtonSpec 
				#layout: #(Point 102 151) 
				#name: #locateCreatedEntities_Rand 
				#model: #locateCreatedEntities 
				#label: 'Locate randomly' 
				#select: #locateCreatedEntities_Rand) #(RadioButtonSpec 
				#layout: #(Point 21 150) 
				#name: #locateCreatedEntities_No 
				#model: #locateCreatedEntities 
				#label: 'Not located' 
				#style: #small 
				#select: #locateCreatedEntities_No) #(ComboBoxSpec 
				#layout: #(Rectangle 88 6 188 29) 
				#name: #ComboBox6 
				#model: #entity 
				#comboList: #entityChoices) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 87 39) 
				#name: #LabelSituated 
				#flags: 32 
				#label: 'Situated' 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 81 56 135 77) 
				#name: #nbExistingEntitiesSituated 
				#flags: 40 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #nbExistingEntitiesSituated 
				#alignment: #right 
				#isReadOnly: true 
				#type: #number) #(ActionButtonSpec 
				#layout: #(Rectangle 170 367 258 391) 
				#name: #moveToRandomCell 
				#model: #moveToRandomCell 
				#label: 'Locate randomly' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 12 310) 
				#name: #Label5 
				#label: 'Execute ->' 
				#style: #small) #(LabelSpec 
				#layout: #(Point 12 338) 
				#name: #Label8 
				#label: 'Set value ->' 
				#style: #small) #(RadioButtonSpec 
				#layout: #(Point 204 151) 
				#name: #locateCreatedEntities_SpaceView 
				#model: #locateCreatedEntities 
				#label: 'Locate manually' 
				#select: #locateCreatedEntities_SpaceView) #(ActionButtonSpec 
				#layout: #(Rectangle 15 255.5 62 279.5) 
				#name: #ActionButton6 
				#model: #selectEntities 
				#label: 'Select' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 85 271.0 133 286.0) 
				#name: #ActionButton8 
				#model: #removeFromEntitiesSelection 
				#label: 'Remove' 
				#style: #small 
				#defaultable: true))))