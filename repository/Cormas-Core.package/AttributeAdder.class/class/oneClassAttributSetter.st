interface specs
oneClassAttributSetter
	"Tools.UIPainter new openOnClass: self andSelector: #oneClassAttributSetter"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false #sizeType #specifiedSize #openType #advanced #positionType #positionSystemDefault) 
			#label: 'Attributes' 
			#min: #(Point 476 295) 
			#max: #(Point 600 800) 
			#bounds: #(Rectangle 730 236 1216 765) 
			#flags: 8 
			#toolBar: #toolBar) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutFrame -383 1 -66 1 -350 1 -42.0 1) 
				#name: #plusButton 
				#model: #addAttribut 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 6 6) 
				#name: #Label4 
				#label: 'Attributes and class Variables of the super classes:') #(ResizingSplitterSpec 
				#layout: #(LayoutFrame 0 0.00206612 0 0.326855 0 0.995868 0 0.337456) 
				#name: #ResizingSplitter1 
				#flags: 8 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#horizontal: true 
				#minAboveSize: 3 
				#minBelowSize: 32 
				#aboveWidgets: 'Dataset1' 
				#belowWidgets: 'Dataset2 Label3 LabelClassName') #(DataSetSpec 
				#properties: #(PropertyListDictionary #showVerticalLines true #allowColumnReordering true #showLineNumbers true #allowColumnResizing true #rowLabelsAsButtons false #showHorizontalLines true) 
				#layout: #(LayoutFrame 0 0.00413223 0 0.0581162 477 0.00619835 119 0.0833333) 
				#name: #Dataset1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 3522 3522 3522) 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #superClassAttribValue_List 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#label: 'N¬∞' 
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
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow currentValue' 
					#label: 'Value' 
					#labelIsImage: false 
					#width: 148 
					#editorType: #InputField 
					#type: #object 
					#noScroll: false 
					#formatString: '')) 
				#multipleSelections: false 
				#labelsAsButtons: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutFrame -160 1 -66 1 -127 1 -42 1) 
				#name: #ActionButton1 
				#model: #addClassVariable 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(LayoutFrame -438 1 -64 1 -383 1 -40 1) 
				#name: #Label1 
				#label: 'Attribute:') #(LabelSpec 
				#layout: #(LayoutFrame -240 1 -63.5 1 -161 1 -40.5 1) 
				#name: #Label2 
				#label: 'Class variable:') #(DataSetSpec 
				#properties: #(PropertyListDictionary #showVerticalLines true #allowColumnReordering true #showLineNumbers true #allowColumnResizing true #rowLabelsAsButtons false #showHorizontalLines true) 
				#layout: #(LayoutFrame -3 0 100 0.25 0 1 -70 1) 
				#name: #Dataset2 
				#model: #classAttribValue_List 
				#menu: #menuTable 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #allowSorting true #labelFromApplication false) 
					#label: ' N¬∞' 
					#labelIsImage: false 
					#width: 30 
					#rendererType: #rowSelector 
					#editorType: #rowSelector 
					#noScroll: false) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication true #allowSorting true #allowResizing true) 
					#model: #'selectedRow classNameAsString' 
					#label: #classTitle 
					#labelIsImage: true 
					#width: 111 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication true #allowSorting true #allowResizing true) 
					#model: #'selectedRow attributeAsString' 
					#label: #attributeTitle 
					#labelIsImage: true 
					#width: 152 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication true #allowSorting true #allowResizing true) 
					#model: #'selectedRow currentValueAsString' 
					#label: #valueTitle 
					#labelIsImage: true 
					#width: 148 
					#editorType: #InputField 
					#menu: #newValueMenu 
					#type: #object 
					#noScroll: false 
					#formatString: '')) 
				#labelsAsButtons: true) #(LabelSpec 
				#layout: #(LayoutSizedOrigin -478 1 194 0 234 21) 
				#name: #Label3 
				#label: 'Attributes and class Variables of the target class:') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutFrame -347 1 -66 1 -314 1 -42.0 1) 
				#name: #ActionButton2 
				#model: #choseAndRemoveAttribute 
				#label: #minusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutFrame -122 1 -66 1 -89 1 -42.0 1) 
				#name: #ActionButton3 
				#model: #choseAndRemoveClassVar 
				#label: #minusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 248 189) 
				#name: #LabelClassName 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 8191 2064 0)) 
				#label: 'className' 
				#style: #large) #(ActionButtonSpec 
				#layout: #(LayoutSizedOrigin -320 1.0 -29 1 54 23) 
				#name: #SetDefaultValues 
				#model: #backToDefaultValues 
				#label: 'Reset' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(LayoutSizedOrigin -220 1.0 -29 1.0 54 23) 
				#name: #saveButton 
				#model: #saveAsDefaultValues 
				#label: 'Apply' 
				#defaultable: true) #(DividerSpec 
				#layout: #(LayoutSizedOrigin 1 0 -35 1.0 678 1) 
				#name: #Divider1))))