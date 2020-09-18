"
DistributionListOAT allows to conduct OAT (""One-Factor-At-A-Time"") sensitivity analysis by modifying parameters' values. It means that the parameter sets are not crossed during analysis. 
Each studied parameter may be analysed by changing its initial value for each simulation run. Distribution List means that this parameter will change its value from a given List defined by user.


"
Class {
	#name : #DistributionListOAT,
	#superclass : #Object,
	#category : #'Cormas-Core-Others'
}

{ #category : #help }
DistributionListOAT class >> asText [
	
	^'Distribution List OAT Analysis' asText
]

{ #category : #'interface specs' }
DistributionListOAT class >> runAnalysisWindow [
	"Tools.UIPainter new openOnClass: self andSelector: #runAnalysisWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'OAT Sensitivity Analysis Control on Distribution list' 
			#min: #(Point 675 242) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 714 450 1440 737) 
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
					#model: #'selectedRow distributionListAsString' 
					#label: 'Distribution' 
					#labelIsImage: false 
					#width: 260 
					#rendererType: #Text 
					#editorType: #None 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true)) 
				#labelsAsButtons: true) #(RegionSpec 
				#layout: #(Rectangle 495 112 565 151) 
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
				#layout: #(Rectangle 503 116 556 146) 
				#name: #runButton 
				#model: #runAnalysis 
				#label: #runIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 415 119) 
				#name: #Label4 
				#label: 'Run analysis') #(InputFieldSpec 
				#layout: #(Rectangle 575.25 65 666.75 89) 
				#name: #InputField3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #displaySimNumber 
				#isReadOnly: true) #(LabelSpec 
				#layout: #(Point 595 47) 
				#name: #Label1 
				#label: 'Simulation') #(ProgressWidgetSpec 
				#layout: #(Rectangle 155 28 563 43) 
				#name: #PercentDoneBar3 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7167 8191 8191)) 
				#model: #simProgress 
				#direction: #horizontal 
				#position: #topLeft 
				#area: true 
				#reverse: false) #(ProgressWidgetSpec 
				#layout: #(Rectangle 155 69 563 84) 
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
				#layout: #(Point 597 5) 
				#name: #Label5 
				#label: 'final step') #(InputFieldSpec 
				#layout: #(Rectangle 594.5 23 647.5 47) 
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
				#layout: #(Rectangle 16 -2 680 97) 
				#name: #GroupBox2 
				#label: 'Analysing'))))
]

{ #category : #'interface specs' }
DistributionListOAT class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: '"One At a Time" analysis setter' 
			#min: #(Point 623 295) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 720 437 1433 900) 
			#flags: 12 
			#menu: #menuBar) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
				#layout: #(Rectangle 267 200 430 232) 
				#name: #Region1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 7167 6143 8191) 
					#setBackgroundColor: #(ColorValue 4096 0 8191)) 
				#lineWidth: 1) #(ActionButtonSpec 
				#layout: #(Rectangle 273 204 315 228) 
				#name: #Apply 
				#model: #apply 
				#label: 'Apply' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 323 204 368 228) 
				#name: #resetValues 
				#model: #resetValues 
				#helpText: 'Reset the parameters to their default value' 
				#label: 'Reset' 
				#defaultable: true) #(DataSetSpec 
				#properties: #(PropertyListDictionary #showVerticalLines true #allowColumnReordering true #showLineNumbers true #rowSize 30 #allowColumnResizing true #showHorizontalLines true) 
				#layout: #(LayoutFrame 9 0 232 0 0 1.182 0 1.00672) 
				#name: #Dataset1 
				#model: #classAttribValue_List 
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
					#model: #'selectedRow distributionListAsString' 
					#label: 'Distribution' 
					#labelIsImage: false 
					#width: 260 
					#editorType: #InputField 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true)) 
				#labelsAsButtons: true) #(CheckBoxSpec 
				#layout: #(Point 22 20) 
				#name: #CheckBox1 
				#model: #isRandomSeedFixed 
				#helpText: 'Select if you want to fix the random seed and start each simulation with same seed value' 
				#label: 'Fix the random seed to:') #(LabelSpec 
				#layout: #(Point 22 204) 
				#name: #Label2 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 0 4808 453)) 
				#label: 'Number of repetitions') #(InputFieldSpec 
				#layout: #(Rectangle 136 203 190 225) 
				#name: #nbOfRepeat 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 4329 6938 4329)) 
				#model: #nbOfRepeat 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(InputFieldSpec 
				#layout: #(Rectangle 87 41 209 62) 
				#name: #randomSeed 
				#flags: 40 
				#model: #randomSeed 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(SequenceViewSpec 
				#layout: #(Rectangle 446 19 707 212) 
				#name: #listProbes 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 6143 8191)) 
				#model: #listProbes 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyProbe) 
				#helpText: 'click on the probes (Ctrl for multi selection)' 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(Point 22 76) 
				#name: #Label3 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: 'init:') #(LabelSpec 
				#layout: #(Point 22 137) 
				#name: #Label4 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: 'step:') #(GroupBoxSpec 
				#layout: #(Rectangle 10 0 237 198) 
				#name: #GroupBox1 
				#label: 'Choose init and step methods') #(LabelSpec 
				#layout: #(Point 256 59) 
				#name: #Label6 
				#label: 'Record as:') #(SequenceViewSpec 
				#layout: #(Rectangle 256 78 426 166) 
				#name: #List1 
				#model: #probeFormat 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #help) 
				#menu: #menuProbeFormat 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(Point 257 16) 
				#name: #Label7 
				#label: 'Save as:') #(MenuButtonSpec 
				#layout: #(Rectangle 257 37 422 58) 
				#name: #MenuButton1 
				#model: #fileFormat 
				#menu: #fileFormatChooser) #(ComboBoxSpec 
				#layout: #(Rectangle 48 76 209 97) 
				#name: #ComboBox1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #initMethod 
				#comboList: #initMethodChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 48 137 209 159) 
				#name: #ComboBox2 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #stepMethod 
				#comboList: #stepMethodChoices) #(ActionButtonSpec 
				#layout: #(Rectangle 377 204 422 228) 
				#name: #ActionButton1 
				#model: #close 
				#helpText: 'Reset the parameters to their default value' 
				#label: 'Cancel' 
				#defaultable: true) #(CheckBoxSpec 
				#layout: #(Point 22 108) 
				#name: #releaseRandomSeed 
				#flags: 32 
				#model: #releaseRandomSeed 
				#helpText: 'Select if you want to release the initial random seed. Thus, each run may be different' 
				#label: 'Release random seed after initialization') #(GroupBoxSpec 
				#layout: #(Rectangle 437 -1 711 220) 
				#name: #GroupBox3 
				#label: 'Probes to record') #(LabelSpec 
				#layout: #(Point 22 170) 
				#name: #Label1 
				#label: 'final step:') #(InputFieldSpec 
				#layout: #(Rectangle 75 170 129 193) 
				#name: #InputField2 
				#model: #finalStep 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 258 171) 
				#name: #periodLabel 
				#flags: 16 
				#label: 'Average on period: ' 
				#style: #pixelDefault) #(GroupBoxSpec 
				#layout: #(Rectangle 247 0 431 198) 
				#name: #GroupBox2 
				#label: 'Output format') #(InputFieldSpec 
				#layout: #(Rectangle 342 172 425 191) 
				#name: #periodField 
				#flags: 24 
				#model: #periodField 
				#isReadOnly: true))))
]

{ #category : #setParameters }
DistributionListOAT >> getAllAttributesList [
	
	| aList defaultParameters cav |
	aList := List new.
	defaultParameters := self getDefaultParametersValues.
	defaultParameters := defaultParameters
		select: [:coll | coll first subclasses isEmpty].
	defaultParameters
		do:
			[:coll | 
			cav := CMClassAttributeValueAnalysisDistribution
				newClass: coll first
				attribute: (coll at: 2)
				value: (coll at: 3).
			aList add: cav].
	self purgeClassAttribValue: aList.
	^aList
]

{ #category : #help }
DistributionListOAT >> mainHelpText [
	
	| text |
	text := super mainHelpText.
	text := text
		,
			('Distribution List' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text ,
			' means that this parameter will change its value from a given List defined by the user.\'.
	text := text ,
			'Each parameter can be modified from a Distribution List made of numbers.\'.
	text := text ,
			'To set this list, just write the Numbers separated by blank space or '';'' \Example: \'.
	text := text
		, ('	1 2 3 3.2 3.4 3.5 6 9 20' withCRs asText emphasizeAllWith: #bold).
	text := text , '\	or:\ '.
	text := text
		,
			('	1; 2; 3; 3,2; 3,4; 3,5;6;9;20' withCRs asText emphasizeAllWith: #bold).
	text := text ,
			'.\For each set of parameters'' values, N simulations can be repeated.'.
	text := text ,
			'\The selected probes are stored as time series or/and the mean values (according to Record as:).\'.
	^text
]

{ #category : #save }
DistributionListOAT >> saveSettingsOnFile: aCSVfile [
	"Save the content of the 'Parameters windows' on aCSVfile.
exports the class name, the attributes names and default values, and the list of values into a CSV file"
	
	| stream |
	super saveSettingsOnFile: aCSVfile.
	stream := aCSVfile appendStream.
	stream nextPutAll: 'Class'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Attribute'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Default Value'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Distribution'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: '\' withCRs.
	self classAttribValueAnalysis_List list
		do:
			[:defAttrib | 
			stream nextPutAll: defAttrib targetClass name.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: defAttrib targetAttribute asString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: defAttrib currentValue printString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: defAttrib distributionListAsString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: '\' withCRs].
	stream close
]

{ #category : #save }
DistributionListOAT >> setCAVfrom: fileContent [
	
	| aCAV |
	self classAttribValue_List list
		do:
			[:cav | 
			cav distributionList: nil.
			cav hasBeenModified: false].
	fileContent
		do:
			[:line | 
			aCAV := self classAttribValue_List list
				detect:
					[:cav | 
					cav targetClass name asString = line first
						and: [cav targetAttribute asString = (line at: 2)]]
				ifNone: [nil].
			aCAV isNil
				ifFalse:
					[aCAV currentValueAsString: (line at: 3).
					aCAV distributionListAsString: (line at: 4)]]
]
