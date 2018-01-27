interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Manipulation Methods Setter' 
			#min: #(Point 427 371) 
			#max: #(Point 2200 2200) 
			#bounds: #(Rectangle 840 525 1267 896) 
			#flags: 8 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 6655 8191 5119))) 
		#component: #(SpecCollection 
			#collection: #(#(DataSetSpec 
				#properties: #(PropertyListDictionary #showVerticalLines true #allowColumnReordering true #showLineNumbers true #allowColumnResizing true #rowLabelsAsButtons false #showHorizontalLines true) 
				#layout: #(LayoutFrame 0 0 65 0 0 1.0 0 1.00563) 
				#name: #Dataset1 
				#model: #methodsForManip_List 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing false) 
					#label: ' N¬∞' 
					#labelIsImage: false 
					#width: 30 
					#rendererType: #rowSelector 
					#editorType: #rowSelector 
					#noScroll: false) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow methodAsString' 
					#label: 'Method' 
					#labelIsImage: false 
					#width: 160 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication true #allowSorting true #allowResizing true) 
					#model: #'selectedRow isInit' 
					#label: #labelInit 
					#labelIsImage: true 
					#width: 70 
					#rendererType: #CheckBox 
					#editorType: #CheckBox 
					#noScroll: false) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication true #allowSorting true #allowResizing true) 
					#model: #'selectedRow isControl' 
					#label: #labelControl 
					#labelIsImage: true 
					#width: 70 
					#rendererType: #CheckBox 
					#editorType: #CheckBox 
					#noScroll: false) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication true #allowSorting true #allowResizing true) 
					#model: #'selectedRow isTesting' 
					#label: #labelTesting 
					#labelIsImage: true 
					#width: 70 
					#rendererType: #CheckBox 
					#editorType: #CheckBox 
					#noScroll: false)) 
				#labelsAsButtons: true) #(ActionButtonSpec 
				#layout: #(Rectangle 309 35 384 58) 
				#name: #applyClose 
				#model: #finalize 
				#label: 'Apply - Close' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 241 35 296 58) 
				#name: #Apply 
				#model: #saveValues 
				#label: 'Apply' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 140 35 228 58) 
				#name: #SetDefaultValues 
				#model: #setDefaultValues 
				#label: 'Default settings' 
				#defaultable: true) #(ComboBoxSpec 
				#layout: #(Rectangle 246 5 384 27) 
				#name: #ComboBox1 
				#model: #entity 
				#comboList: #entityChoices) #(LabelSpec 
				#layout: #(Point 9 3) 
				#name: #Label1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7679 8191 7167)) 
				#label: 'Set manipulation methods of Entity' 
				#style: #systemDefault) #(CheckBoxSpec 
				#layout: #(Point 15 35) 
				#name: #applyToSubclasses 
				#flags: 16 
				#model: #applyToSubclasses) #(LabelSpec 
				#layout: #(Point 34 28) 
				#name: #labelapplyToSubclasses1 
				#flags: 16 
				#label: 'Apply to') #(LabelSpec 
				#layout: #(Point 34 41) 
				#name: #labelapplyToSubclasses2 
				#flags: 16 
				#label: 'subclasses'))))