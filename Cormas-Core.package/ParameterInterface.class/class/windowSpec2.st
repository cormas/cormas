interface specs
windowSpec2
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Parameters' 
			#min: #(Point 476 295) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 720 450 1196 745) 
			#flags: 12 
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
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 315 2 428 25) 
				#name: #SetDefaultValues 
				#model: #setDefaultValuesAndApply 
				#label: 'Back to Default Values' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 164 2.5 283 25.5) 
				#name: #ActionButton1 
				#model: #saveAsDefaultValues 
				#label: 'Save as default values' 
				#defaultable: true))))