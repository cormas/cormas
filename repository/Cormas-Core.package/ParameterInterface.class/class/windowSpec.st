interface specs
windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Parameters' 
			#min: #(Point 476 295) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 720 449 1196 744) 
			#flags: 12 
			#menu: #menuBar) 
		#component: #(SpecCollection 
			#collection: #(#(DataSetSpec 
				#properties: #(PropertyListDictionary #showVerticalLines true #allowColumnReordering false #showLineNumbers true #allowColumnResizing true #rowLabelsAsButtons true #showHorizontalLines true) 
				#layout: #(LayoutFrame 2 0 27 0 -10 1 -10 1) 
				#name: #Dataset1 
				#model: #classAttribValue_List 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #allowSorting true) 
					#labelIsImage: false 
					#width: 30 
					#rendererType: #rowSelector 
					#editorType: #rowSelector 
					#noScroll: false) #(DataSetColumnSpec 
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
				#layout: #(Rectangle 27 2 126 25) 
				#name: #Apply 
				#model: #applyNewValues 
				#label: 'Apply new values' 
				#style: #small 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 162 2 275 25) 
				#name: #SetDefaultValues 
				#model: #backToDefaultValues 
				#label: 'Back to Default Values' 
				#style: #small 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 311 2.0 430 25.0) 
				#name: #ActionButton1 
				#model: #saveAsDefaultValues 
				#label: 'Save as default values' 
				#style: #small 
				#defaultable: true))))