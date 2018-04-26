interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #UnlabeledCanvas 
				#defaultString: 'Unlabeled Canvas' 
				#catalogID: #labels) 
			#min: #(Point 208 100) 
			#max: #(Point 597 768) 
			#bounds: #(Rectangle 800 450 1112 675) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue #white))) 
		#component: #(SpecCollection 
			#collection: #(#(DataSetSpec 
				#properties: #(PropertyListDictionary #showHorizontalLines true #allowColumnResizing true #showVerticalLines true #allowColumnReordering false #rowSize 20) 
				#layout: #(LayoutFrame 0 0 20 0 0 1 -20 1) 
				#name: #Dataset1 
				#flags: 12 
				#model: #attribute_List 
				#tabable: false 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #disable true #labelFromApplication false #allowResizing true #allowSorting false) 
					#model: #'selectedRow name' 
					#label: 'Attribute' 
					#labelIsImage: false 
					#width: 130 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow value' 
					#label: 'Value' 
					#labelIsImage: false 
					#width: 60 
					#editorType: #InputField 
					#type: #object 
					#noScroll: false 
					#formatString: ''))) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 0 0 30 20) 
				#name: #previous 
				#model: #previous 
				#label: #arrowPrevious 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 80 0 110 20) 
				#name: #next 
				#model: #next 
				#label: #arrowNext 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(LayoutFrame 150 0 0 0 0 1 20 0) 
				#name: #option 
				#flags: 0 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #option 
				#tabable: false 
				#helpText: 'Right clic for options' 
				#menu: #optionMenu 
				#alignment: #center 
				#isReadOnly: true 
				#type: #string) #(InputFieldSpec 
				#layout: #(Rectangle 30 0 80 20) 
				#name: #entityIdField 
				#flags: 0 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #entityIdField 
				#tabable: false 
				#alignment: #center 
				#isReadOnly: true 
				#type: #number) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame -30 1 29 0 0 1 734 0) 
				#name: #iconView 
				#flags: 0 
				#component: #iconView) #(CompositeSpecCollection 
				#collection: #(#(InputFieldSpec 
					#layout: #(LayoutFrame 0 0 0 0 0 1 0 1) 
					#name: #performBar 
					#model: #performBar 
					#helpText: 'write in code to be executed by the instance, then press Enter' 
					#type: #text) #(InputFieldSpec 
					#layout: #(LayoutFrame -10 1 2 0 0 1 18 0) 
					#name: #activate 
					#flags: 0 
					#callbacksSpec: #(UIEventCallbackSubSpec 
						#requestFocusInSelector: #executePerformBar) 
					#tabable: true 
					#isReadOnly: false)) 
				#compositeSpec: #(CompositeSpec 
					#layout: #(LayoutFrame 0 0 -20 1 0 1 0 1) 
					#name: #Composite1)))))