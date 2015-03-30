interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false) 
			#label: 'Manipulate instances' 
			#min: #(Point 314 208) 
			#max: #(Point 314 257) 
			#bounds: #(Rectangle 720 450 1034 658) 
			#colors: #(LookPreferences) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(GroupBoxSpec 
				#layout: #(Rectangle 4 119 257 206) 
				#name: #GroupBox2 
				#label: #(UserMessage 
					#key: #povDefinition 
					#defaultString: 'Apply')) #(GroupBoxSpec 
				#layout: #(Rectangle 3 32 256 121) 
				#name: #GroupBox1 
				#label: #(UserMessage 
					#key: #povDefinition 
					#defaultString: 'Action to be performed')) #(ArbitraryComponentSpec 
				#layout: #(Rectangle 258 6 309 58) 
				#name: #ViewHolder1 
				#flags: 24 
				#component: #entityImage) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 165 2) 
				#name: #Label6 
				#label: 'Total number' 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 220 2.5 262 21.5) 
				#name: #InputField5 
				#flags: 0 
				#model: #nbExistingEntities 
				#tabable: false 
				#style: #pixelDefault 
				#isReadOnly: true 
				#type: #number) #(ComboBoxSpec 
				#layout: #(Rectangle 77 52.0 246 71.0) 
				#name: #controlMethodChoices 
				#model: #controlMethod 
				#helpText: 'Select a method to be executed' 
				#comboList: #controlMethodChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 77 75.0 193 94.0) 
				#name: #attributeToChangeChoices 
				#model: #attributeToChange 
				#helpText: 'Select an attribute to be modified' 
				#comboList: #attributeToChangeChoices) #(InputFieldSpec 
				#layout: #(Rectangle 196 75 246 94) 
				#name: #valueForAttribute 
				#model: #valueForAttribute 
				#helpText: 'Enter the new value for the attribute' 
				#type: #object) #(LabelSpec 
				#layout: #(Point 8 5) 
				#name: #Label3 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 2048 2048 8191)) 
				#label: 'Entity' 
				#style: #systemDefault) #(ComboBoxSpec 
				#layout: #(Rectangle 48 8 165 28) 
				#name: #entityChoices 
				#model: #entity 
				#tabable: true 
				#comboList: #entityChoices) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 165 15) 
				#name: #LabelSituated 
				#flags: 32 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4915 4915 4915)) 
				#label: 'Situated' 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 220 15.5 262 34.5) 
				#name: #nbExistingEntitiesSituated 
				#flags: 32 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4915 4915 4915)) 
				#model: #nbExistingEntitiesSituated 
				#tabable: false 
				#style: #pixelDefault 
				#isReadOnly: true 
				#type: #number) #(RadioButtonSpec 
				#layout: #(Point 8 137) 
				#name: #RadioAllEntities 
				#model: #targetEntities 
				#helpText: 'All the instances of the selected Entity class will perform the action' 
				#label: 'to all entities' 
				#select: #allEntities) #(RadioButtonSpec 
				#layout: #(Point 8 159) 
				#name: #RadioByClicking 
				#model: #targetEntities 
				#helpText: 'The actions with be performed when user click (or drag) with the mouse' 
				#label: 'by clicking on entities' 
				#select: #byClicking) #(RadioButtonSpec 
				#layout: #(Point 8 181) 
				#name: #RadioSubset 
				#model: #targetEntities 
				#helpText: 'The actions will be performed on a subset of entities' 
				#label: 'to a subset of entities:' 
				#select: #subsetEntities) #(RadioButtonSpec 
				#layout: #(Point 8 52) 
				#name: #RadioExecute 
				#model: #toBePerformed 
				#helpText: 'The entities will execute a method' 
				#label: 'Execute' 
				#select: #execute) #(RadioButtonSpec 
				#layout: #(Point 8 75) 
				#name: #RadioSetValue 
				#model: #toBePerformed 
				#helpText: 'Changing the value of an attribute' 
				#label: 'Set value' 
				#select: #setValue) #(RadioButtonSpec 
				#layout: #(Point 8 98) 
				#name: #RadioInspect 
				#model: #toBePerformed 
				#helpText: 'The entities will be inspected' 
				#label: 'Inspect' 
				#select: #inspect) #(RadioButtonSpec 
				#layout: #(Point 88 98) 
				#name: #RadioChangeColor 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 6125 0 0)) 
				#model: #toBePerformed 
				#helpText: 'Changing the color of the entities' 
				#label: 'Change color' 
				#select: #changeColor) #(RadioButtonSpec 
				#layout: #(Point 174 98) 
				#name: #RadioResetColor 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 6125 0 0)) 
				#model: #toBePerformed 
				#helpText: 'Reset the color of the entities' 
				#label: 'Reset color' 
				#select: #resetColor) #(ActionButtonSpec 
				#layout: #(Rectangle 259 108.0 309 139.0) 
				#name: #stopPainting 
				#flags: 56 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red) 
					#setBackgroundColor: #(ColorValue #yellow)) 
				#model: #stopPainting 
				#label: 'Stop' 
				#style: #large 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 259 108 309 139) 
				#name: #mainApplyButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #mainApply 
				#label: 'Apply' 
				#style: #systemDefault 
				#defaultable: true) #(CompositeSpecCollection 
				#collection: #(#(CompositeSpecCollection 
					#collection: #(#(GroupBoxSpec 
						#layout: #(Rectangle 0 0 260 56) 
						#name: #GroupBox7 
						#colors: #(LookPreferences 
							#setForegroundColor: #(ColorValue 7700 7700 7700) 
							#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
						#label: #(UserMessage 
							#key: #povDefinition 
							#defaultString: '')) #(RegionSpec 
						#layout: #(Rectangle 2 2 258 54) 
						#name: #Region1 
						#colors: #(LookPreferences 
							#setForegroundColor: #(ColorValue #yellow) 
							#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
						#lineWidth: 1)) 
					#compositeSpec: #(CompositeSpec 
						#layout: #(Rectangle -2 16 258 72) 
						#name: #Composite1)) #(CompositeSpecCollection 
					#collection: #(#(ComboBoxSpec 
						#layout: #(Rectangle 0 0 116 19) 
						#name: #testElementChoices 
						#model: #testElement 
						#comboList: #testElementChoices) #(ComboBoxSpec 
						#layout: #(Rectangle 117 0 157 19) 
						#name: #operatorChoices 
						#model: #operator 
						#comboList: #operatorChoices) #(InputFieldSpec 
						#layout: #(Rectangle 158 0 208 19) 
						#name: #testValue 
						#model: #testValue 
						#tabable: true 
						#alignment: #right 
						#isReadOnly: false 
						#type: #object)) 
					#compositeSpec: #(CompositeSpec 
						#layout: #(Rectangle 4 19 212 38) 
						#name: #Composite2)) #(ActionButtonSpec 
					#layout: #(Rectangle 215 20.5 253 36.5) 
					#name: #selectEntities 
					#model: #selectEntities 
					#label: 'Select' 
					#defaultable: true) #(ActionButtonSpec 
					#layout: #(Rectangle 215 39.5 253 55.5) 
					#name: #resetSelection 
					#colors: #(LookPreferences 
						#setForegroundColor: #(ColorValue 0 0 6766)) 
					#model: #resetSelection 
					#label: 'Reset' 
					#defaultable: true) #(ActionButtonSpec 
					#layout: #(Rectangle 162 53.0 195 68.0) 
					#name: #removeFromEntitiesSelection 
					#isOpaque: true 
					#colors: #(LookPreferences 
						#setForegroundColor: #(ColorValue 2048 2048 8191) 
						#setBackgroundColor: #(ColorValue #white)) 
					#model: #removeFromEntitiesSelection 
					#label: 'Remove' 
					#style: #pixelSmall 
					#defaultable: true) #(ActionButtonSpec 
					#layout: #(Rectangle 126 53.0 159 68.0) 
					#name: #addToEntitiesSelection 
					#isOpaque: true 
					#colors: #(LookPreferences 
						#setForegroundColor: #(ColorValue 2048 2048 8191) 
						#setBackgroundColor: #(ColorValue #white)) 
					#model: #addToEntitiesSelection 
					#label: 'Add' 
					#style: #pixelSmall 
					#defaultable: true) #(CompositeSpecCollection 
					#collection: #(#(InputFieldSpec 
						#layout: #(Rectangle 20 17 50 34) 
						#name: #InputField3 
						#model: #nbEntitiesSelected 
						#tabable: false 
						#alignment: #right 
						#style: #pixelDefault 
						#isReadOnly: true 
						#type: #object) #(InputFieldSpec 
						#layout: #(Rectangle 78 17 110 34) 
						#name: #nbEntitiesSelectedSituated 
						#colors: #(LookPreferences 
							#setForegroundColor: #(ColorValue 4915 4915 4915)) 
						#model: #nbEntitiesSelectedSituated 
						#tabable: false 
						#alignment: #right 
						#style: #pixelDefault 
						#isReadOnly: true 
						#type: #object) #(LabelSpec 
						#layout: #(Point 3 13) 
						#name: #Label11 
						#label: '->') #(LabelSpec 
						#layout: #(Point 0 0) 
						#name: #Label4 
						#label: #(UserMessage 
							#key: #methodesreturningSymbol 
							#defaultString: 'Selected number') 
						#style: #pixelDefault) #(LabelSpec 
						#layout: #(Point 77 0) 
						#name: #LabelNb_situated 
						#colors: #(LookPreferences 
							#setForegroundColor: #(ColorValue 4915 4915 4915)) 
						#label: #(UserMessage 
							#key: #methodesreturningSymbol 
							#defaultString: 'situated') 
						#style: #pixelDefault)) 
					#compositeSpec: #(CompositeSpec 
						#layout: #(Rectangle 2 35 116 69) 
						#name: #Composite3)) #(LabelSpec 
					#layout: #(Point 117 0) 
					#name: #Label2 
					#label: #(UserMessage 
						#key: #methodesreturningSymbol 
						#defaultString: ' set criteria for the subset') 
					#style: #pixelDefault)) 
				#compositeSpec: #(CompositeSpec 
					#layout: #(Rectangle 21 181 281 253) 
					#name: #subsetCriteria)))))