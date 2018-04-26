interface specs
hiddenParametersWindow
	"Tools.UIPainter new openOnClass: self andSelector: #hideParameterWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Parameters' 
			#min: #(Point 508 295) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 720 450 1228 745) 
			#flags: 8 
			#menu: #menuBar) 
		#component: #(SpecCollection 
			#collection: #(#(DataSetSpec 
				#properties: #(PropertyListDictionary #showVerticalLines true #allowColumnReordering false #showLineNumbers true #allowColumnResizing true #rowLabelsAsButtons false #showHorizontalLines true) 
				#layout: #(LayoutFrame 2 0 27 0 0 1.00543 0 0.958057) 
				#name: #Dataset1 
				#model: #classAttribValue_List 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #allowSorting true #labelFromApplication false) 
					#label: ' N¬∞' 
					#labelIsImage: false 
					#width: 30 
					#rendererType: #rowSelector 
					#editorType: #rowSelector 
					#noScroll: false) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow isHidden' 
					#label: 'hide' 
					#labelFont: #small 
					#labelIsImage: false 
					#width: 30 
					#rendererType: #CheckBox 
					#editorType: #CheckBox 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow classNameAsString' 
					#label: 'Class' 
					#labelIsImage: false 
					#width: 111 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow attributeAsString' 
					#label: 'Attribute' 
					#labelIsImage: false 
					#width: 152 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow currentValueAsString' 
					#label: 'Value' 
					#labelIsImage: false 
					#width: 148 
					#editorType: #InputField 
					#type: #object 
					#noScroll: false 
					#formatString: '')) 
				#verticalPolicy: #noWrap 
				#multipleSelections: false 
				#labelsAsButtons: true) #(ActionButtonSpec 
				#layout: #(Rectangle 385 2 446 24) 
				#name: #Apply 
				#model: #hide 
				#label: 'Hide' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 23 3) 
				#name: #Label1 
				#label: 'Select the attributs to be hidden'))))