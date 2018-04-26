interface specs
classesSettings
	"Tools.UIPainter new openOnClass: self andSelector: #classesSettings"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Classes setting' 
			#min: #(Point 268 250) 
			#max: #(Point 268 1000) 
			#bounds: #(Rectangle 1600 600 1868 1007)) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 12 5) 
				#name: #title 
				#label: 'Set new classes for:' 
				#style: #default) #(DataSetSpec 
				#properties: #(PropertyListDictionary #allowColumnReordering false #showLineNumbers false #allowColumnResizing true #showVerticalLines true #rowSize 20 #showHorizontalLines true #rowLabelsAsButtons false) 
				#layout: #(LayoutFrame 11 0 74 0 251 0 0 0.82) 
				#name: #classesDataSet 
				#flags: 13 
				#model: #classes 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #allowSorting true) 
					#labelIsImage: false 
					#width: 30 
					#rendererType: #rowSelector 
					#editorType: #rowSelector 
					#noScroll: false) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #allowSorting true) 
					#model: #'selectedClass x' 
					#label: 'Low value (included)' 
					#labelIsImage: false 
					#width: 110 
					#editorType: #InputField 
					#noScroll: false) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #allowSorting true) 
					#model: #'selectedClass y' 
					#label: 'High value (excluded)' 
					#labelIsImage: false 
					#width: 110 
					#editorType: #InputField 
					#noScroll: false)) 
				#multipleSelections: false 
				#labelsAsButtons: false) #(ActionButtonSpec 
				#layout: #(Rectangle 11 45 96 68) 
				#name: #addClass 
				#model: #addClass 
				#label: 'Add Class' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(LayoutSizedOrigin 29 0 0 0.89 70 30) 
				#name: #apply 
				#model: #setNewHistoClasses 
				#label: 'Apply' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(LayoutSizedOrigin 116 0 0 0.89 100 30) 
				#name: #applyAndClose 
				#model: #setNewHistoClassesAndClose 
				#label: 'Apply and Close' 
				#defaultable: true) #(DividerSpec 
				#layout: #(LayoutSizedOrigin 5 0 31 0 250 4) 
				#name: #Divider3) #(DividerSpec 
				#layout: #(LayoutSizedOrigin 6 0 3 0.85 250 4) 
				#name: #Divider2) #(InputFieldSpec 
				#layout: #(LayoutSizedOrigin 131 0 10 0 120 16) 
				#name: #nameOfHisto 
				#flags: 0 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue)) 
				#model: #selectedHisto 
				#tabable: false 
				#isReadOnly: true 
				#type: #string) #(ActionButtonSpec 
				#layout: #(Rectangle 121 45 241 69) 
				#name: #deleteClass 
				#model: #deleteClass 
				#label: 'Remove Selected Class' 
				#defaultable: true))))