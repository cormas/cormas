interface specs
runAnalysisWindow
	"Tools.UIPainter new openOnClass: self andSelector: #runAnalysisWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'OAT Sensitivity Analysis Control: Monte Carlo' 
			#min: #(Point 675 242) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 649 450 1440 732) 
			#flags: 8) 
		#component: #(SpecCollection 
			#collection: #(#(DataSetSpec 
				#properties: #(PropertyListDictionary #showVerticalLines true #allowColumnReordering true #showLineNumbers true #rowSize 30 #allowColumnResizing true #showHorizontalLines true) 
				#layout: #(LayoutFrame 5 0 168 0 0 1.0 0 1.00456) 
				#name: #Dataset1 
				#model: #classAttribValueAnalysis_List 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #allowSorting true #labelFromApplication false) 
					#label: 'N¬∞' 
					#labelIsImage: false 
					#width: 30 
					#rendererType: #rowSelector 
					#editorType: #rowSelector 
					#noScroll: false 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow classNameAsString' 
					#label: 'Class' 
					#labelIsImage: false 
					#width: 165 
					#rendererType: #Text 
					#editorType: #None 
					#noScroll: false 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow attributeAsString' 
					#label: 'Attribute' 
					#labelIsImage: false 
					#width: 165 
					#rendererType: #Text 
					#editorType: #None 
					#noScroll: false 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow currentValueAsString' 
					#label: 'Current value' 
					#labelIsImage: false 
					#width: 80 
					#rendererType: #Text 
					#editorType: #None 
					#type: #object 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow initValue' 
					#label: 'Min value' 
					#labelIsImage: false 
					#width: 80 
					#rendererType: #Text 
					#editorType: #None 
					#type: #object 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow finalValue' 
					#label: 'Max value' 
					#labelIsImage: false 
					#width: 80 
					#rendererType: #Text 
					#editorType: #None 
					#type: #object 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow randomType' 
					#label: 'Random type' 
					#labelIsImage: false 
					#width: 80 
					#rendererType: #Text 
					#editorType: #None 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow repetitions' 
					#label: 'Repetitions' 
					#labelIsImage: false 
					#width: 80 
					#rendererType: #Text 
					#editorType: #None 
					#type: #number 
					#noScroll: false 
					#formatString: '0')) 
				#labelsAsButtons: true) #(RegionSpec 
				#layout: #(Rectangle 654 112 724 151) 
				#name: #Region2 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 7167 6143 8191) 
					#setBackgroundColor: #(ColorValue 5119 2048 8191)) 
				#lineWidth: 1) #(LabelSpec 
				#layout: #(Point 43 25) 
				#name: #Label8 
				#label: 'Current simulation:') #(LabelSpec 
				#layout: #(Point 43 66) 
				#name: #Label3 
				#label: 'Overal analysis:') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 662 116 715 146) 
				#name: #runButton 
				#model: #runAnalysis 
				#label: #runIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 574 119) 
				#name: #Label4 
				#label: 'Run analysis') #(InputFieldSpec 
				#layout: #(Rectangle 641.25 65 732.75 89) 
				#name: #InputField3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #displaySimNumber 
				#isReadOnly: true) #(LabelSpec 
				#layout: #(Point 661 47) 
				#name: #Label1 
				#label: 'Simulation') #(ProgressWidgetSpec 
				#layout: #(Rectangle 155 28 611 43) 
				#name: #PercentDoneBar3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7167 8191 8191)) 
				#model: #simProgress 
				#direction: #horizontal 
				#position: #topLeft 
				#area: true 
				#reverse: false) #(ProgressWidgetSpec 
				#layout: #(Rectangle 155 69 611 84) 
				#name: #PercentDoneBar1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red) 
					#setBackgroundColor: #(ColorValue 8191 7167 7167)) 
				#model: #analysisProgress 
				#direction: #horizontal 
				#position: #topLeft 
				#area: true 
				#reverse: false) #(LabelSpec 
				#layout: #(Point 663 5) 
				#name: #Label5 
				#label: 'final step') #(InputFieldSpec 
				#layout: #(Rectangle 660.5 23 713.5 47) 
				#name: #InputField1 
				#model: #finalStep 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 45 116) 
				#name: #Label2 
				#label: 'Set the folder') #(LabelSpec 
				#layout: #(Point 45 131) 
				#name: #Label6 
				#label: 'for output files:') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 133 118 185 148) 
				#name: #ActionButton3 
				#model: #prepareFiles 
				#label: #directoryIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 16 -2 752 97) 
				#name: #GroupBox2 
				#label: 'Analysing'))))