interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Add-Ons Manager' 
			#min: #(Point 467 423) 
			#max: #(Point 1500 850) 
			#bounds: #(Rectangle 702 279 1169 702) 
			#flags: 11 
			#toolBar: #toolBar 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 7679 8191 7167))) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#layout: #(Rectangle 97 32 174 54) 
				#name: #selectNone 
				#model: #selectNone 
				#label: 'Select none' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 266 20 322 46) 
				#name: #loadAddOns 
				#model: #loadAddOns 
				#label: 'Load' 
				#style: #systemDefault 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 9 3) 
				#name: #Label1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7679 8191 7167)) 
				#label: 'Select add-ons you want to load' 
				#style: #systemDefault) #(ActionButtonSpec 
				#layout: #(Rectangle 16 32 85 54) 
				#name: #selectAll 
				#model: #selectAll 
				#label: 'Select all' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 333 20 421 46) 
				#name: #ActionButton1 
				#model: #loadAddOnsAndClose 
				#label: 'Load - Close' 
				#style: #systemDefault 
				#defaultable: true) #(DataSetSpec 
				#properties: #(PropertyListDictionary #showVerticalLines true #allowColumnReordering true #showLineNumbers true #allowColumnResizing true #rowLabelsAsButtons false #showHorizontalLines true) 
				#layout: #(LayoutSizedOrigin 0 0 62 0 1400 800) 
				#name: #Dataset1 
				#flags: 13 
				#model: #addOns_List 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing false) 
					#label: ' N¬∞' 
					#labelIsImage: false 
					#width: 25 
					#rendererType: #rowSelector 
					#editorType: #rowSelector 
					#noScroll: false) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #disable true #labelFromApplication false #allowResizing true #allowSorting true) 
					#model: #'selectedRow nameAsString' 
					#label: 'Name' 
					#labelIsImage: false 
					#width: 130 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow versionAsString' 
					#label: 'Version' 
					#labelIsImage: false 
					#width: 45 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow categoryAsString' 
					#label: 'Category' 
					#labelIsImage: false 
					#width: 130 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing false) 
					#model: #'selectedRow shouldLoad' 
					#label: 'Load' 
					#labelIsImage: false 
					#width: 30 
					#rendererType: #CheckBox 
					#editorType: #CheckBox 
					#noScroll: false) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow typeAsString' 
					#label: 'Type' 
					#labelIsImage: false 
					#width: 30 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow authorAsString' 
					#label: 'Author' 
					#labelIsImage: false 
					#width: 120 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow fileAsString' 
					#label: 'File' 
					#labelIsImage: false 
					#width: 120 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow dateAsString' 
					#label: 'Creation date' 
					#labelIsImage: false 
					#width: 110 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow addOnDescription' 
					#label: 'Description' 
					#labelIsImage: false 
					#width: 400 
					#rendererType: #Text 
					#editorType: #InputField 
					#noScroll: true)) 
				#labelsAsButtons: true))))