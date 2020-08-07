"
ClassifyParameter allows to conduct OAT (""One-Factor-At-A-Time"") sensitivity analysis by modifying parameters' values. It means that the parameter sets are not crossed during analysis. 
Each studied parameter may be analysed by changing its initial value (+/- 5, 10, 15 or 20 %). 
ClassifyParameter run 2 sessions of analysis: one with standard specifications of the parameters, then one with the new values of the parameters. Then it calculates the Sensitivity of each parameter in order to sort them as a sensitivity gradient.

Instance Variables:
	percent	<ValueModel>	description of percent
	plusMinus	<ValueModel>	description of plusMinus
	standardAnalysis	<SensitivityAnalysisAbstract>	description of standardAnalysis


"
Class {
	#name : #ClassifyParameter,
	#superclass : #OATsensitivity,
	#instVars : [
		'plusMinus',
		'percent',
		'standardAnalysis',
		'labelForProcess',
		'zeroError'
	],
	#category : #'Cormas-Core-Others'
}

{ #category : #help }
ClassifyParameter class >> asText [
	
	^'Parameters'' Classifier OAT Analysis' asText
]

{ #category : #resources }
ClassifyParameter class >> percentMenu [
	"Tools.MenuEditor new openOnClass: self andSelector: #percentMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: '5 %' 
		#value: 5) #(MenuItem 
		#rawLabel: '10 %' 
		#value: 10) #(MenuItem 
		#rawLabel: '15 %' 
		#value: 15) #(MenuItem 
		#rawLabel: '20 %' 
		#value: 20)) #(4) nil) decodeAsLiteralArray
]

{ #category : #resources }
ClassifyParameter class >> plusMinusMenu [
	"Tools.MenuEditor new openOnClass: self andSelector: #plusMinusMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: '-' 
		#value: #minus) #(MenuItem 
		#rawLabel: '+' 
		#value: #plus)) #(2) nil) decodeAsLiteralArray
]

{ #category : #'interface specs' }
ClassifyParameter class >> runAnalysisWindow [
	"Tools.UIPainter new openOnClass: self andSelector: #runAnalysisWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'OAT Classifier Analysis Control' 
			#min: #(Point 675 242) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 720 450 1320 737) 
			#flags: 8) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 18 131) 
				#name: #Label7 
				#label: 'standard output files:') #(LabelSpec 
				#layout: #(Point 199 131) 
				#name: #Label8 
				#label: 'analysis output files:') #(RegionSpec 
				#layout: #(Rectangle 466 112 536 151) 
				#name: #Region1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 7167 6143 8191) 
					#setBackgroundColor: #(ColorValue 5119 2048 8191)) 
				#lineWidth: 1) #(DataSetSpec 
				#properties: #(PropertyListDictionary #showVerticalLines true #allowColumnReordering true #showLineNumbers true #rowSize 30 #allowColumnResizing true #showHorizontalLines true) 
				#layout: #(LayoutFrame 5 0 168 0 0 0.976589 0 1.00351) 
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
					#width: 180 
					#rendererType: #Text 
					#editorType: #None 
					#noScroll: false 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow attributeAsString' 
					#label: 'Attribute' 
					#labelIsImage: false 
					#width: 180 
					#rendererType: #Text 
					#editorType: #None 
					#noScroll: false 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow currentValueAsString' 
					#label: 'Current value' 
					#labelIsImage: false 
					#width: 165 
					#rendererType: #Text 
					#editorType: #None 
					#type: #object 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true)) 
				#labelsAsButtons: true) #(LabelSpec 
				#layout: #(Point 43 39) 
				#name: #Label3 
				#label: 'Current simulation:') #(LabelSpec 
				#layout: #(Point 43 68) 
				#name: #Label4 
				#label: 'Overal analysis:') #(GroupBoxSpec 
				#layout: #(Rectangle 16 -2 586 95) 
				#name: #GroupBox1 
				#label: 'Analysing') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 474 116 527 146) 
				#name: #runButton 
				#model: #runAnalysis 
				#label: #runIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 386 119) 
				#name: #Label1 
				#label: 'Run analysis') #(InputFieldSpec 
				#layout: #(Rectangle 480.25 65 571.75 89) 
				#name: #InputField1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #displaySimNumber 
				#isReadOnly: true) #(LabelSpec 
				#layout: #(Point 500 47) 
				#name: #Label5 
				#label: 'Simulation') #(ProgressWidgetSpec 
				#layout: #(Rectangle 155 42 459 56) 
				#name: #PercentDoneBar1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7167 8191 8191)) 
				#model: #simProgress 
				#direction: #horizontal 
				#position: #topLeft 
				#area: true 
				#reverse: false) #(ProgressWidgetSpec 
				#layout: #(Rectangle 155 71 459 85) 
				#name: #PercentDoneBar2 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red) 
					#setBackgroundColor: #(ColorValue 8191 7167 7167)) 
				#model: #analysisProgress 
				#direction: #horizontal 
				#position: #topLeft 
				#area: true 
				#reverse: false) #(LabelSpec 
				#layout: #(Point 502 5) 
				#name: #Label2 
				#label: 'final step') #(InputFieldSpec 
				#layout: #(Rectangle 499.5 23 552.5 47) 
				#name: #InputField2 
				#model: #finalStep 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 18 116) 
				#name: #Label6 
				#label: 'Set the folder for the') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 127 118 179 148) 
				#name: #ActionButton1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #yellow)) 
				#model: #prepareStandardFiles 
				#label: #directoryIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 199 116) 
				#name: #Label9 
				#label: 'Set the folder for the') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 308 118 360 148) 
				#name: #ActionButton2 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 2048 8191 2048)) 
				#model: #prepareFiles 
				#label: #directoryIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 44 15) 
				#name: #Label10 
				#label: 'Session:') #(InputFieldSpec 
				#layout: #(Rectangle 93 13 495 36) 
				#name: #InputField3 
				#flags: 0 
				#model: #labelForProcess 
				#tabable: false 
				#isReadOnly: true) #(GroupBoxSpec 
				#layout: #(Rectangle 16 108 185 160) 
				#name: #GroupBox2) #(GroupBoxSpec 
				#layout: #(Rectangle 196 107 365 159) 
				#name: #GroupBox3))))
]

{ #category : #'interface specs' }
ClassifyParameter class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: '"One At a Time" analysis setter' 
			#min: #(Point 623 295) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 636 360 1360 823) 
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
				#layout: #(LayoutFrame 13 0 263 0 0 0.922976 0 0.995444) 
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
					#width: 200 
					#rendererType: #Text 
					#editorType: #None 
					#noScroll: false 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow attributeAsString' 
					#label: 'Attribute' 
					#labelIsImage: false 
					#width: 200 
					#rendererType: #Text 
					#editorType: #None 
					#noScroll: false 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow currentValueAsString' 
					#label: 'Current value' 
					#labelIsImage: false 
					#width: 100 
					#rendererType: #Text 
					#editorType: #None 
					#type: #object 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow finalValue' 
					#label: 'New Value' 
					#labelIsImage: false 
					#width: 100 
					#editorType: #InputField 
					#type: #object 
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
				#isReadOnly: true) #(MenuButtonSpec 
				#layout: #(Rectangle 455 239 505 258) 
				#name: #MenuButton2 
				#model: #plusMinus 
				#menu: #plusMinusMenu) #(MenuButtonSpec 
				#layout: #(Rectangle 516 236 587 258) 
				#name: #MenuButton3 
				#model: #percent 
				#menu: #percentMenu) #(ActionButtonSpec 
				#layout: #(Rectangle 596 236 658 258) 
				#name: #ActionButton2 
				#model: #setNewValues 
				#label: 'Set' 
				#defaultable: true))))
]

{ #category : #sensitivity }
ClassifyParameter >> calculateSensitivity [
	"formule: Sensib (prob.j) = ln(moy(prob_j.modif)) - ln (moy(prob_j.standard)) / ln (j.modif) - ln(J.stand).
dico : 'Dictionary (#vegetationBiomass->Dictionary (#Restrained_energy->0.171174 
												  #'Unrestrained class_harvestRate'->-0.0647275 
												  #''Restrained class_fertilityThreshold''->0.044081
												  #ECEC_unrestrainedInitialNumber->0.0131293 ... ) 
				#restrainedSize->Dictionary (#Restrained_energy->0.0 
											#''Unrestrained class_harvestRate''->0.0  ... ) 
				#unrestrainedSize->Dictionary (#Restrained_energy->0.0 
											   #''Unrestrained class_harvestRate''->0.0 ) )' "
	
	| dico |
	dico := Dictionary new.
	dataSaver probes keys
		do:
			[:key | 
			dico
				at: key
				put: (self sensitivityOfProbe: key)].
	self dataSaver saveSensitivityClassification: dico.
	^dico
]

{ #category : #'actions_buttons' }
ClassifyParameter >> checkSettings [
	"return self if ok"
	
	| notAnalysedParameters zeroParameters |
	notAnalysedParameters := self classAttribValue_List list
		select:
			[:defAttrib | 
			defAttrib currentValue = defAttrib finalValue
				or: [defAttrib finalValue isNil]].
	notAnalysedParameters isEmpty
		ifFalse: [(self confirmContinue: notAnalysedParameters) ifFalse: [^nil]].
	notAnalysedParameters do: [:defAttrib | defAttrib hasBeenModified: false].
	zeroParameters := self classAttribValue_List list
		select:
			[:defAttrib | defAttrib currentValue = 0 or: [defAttrib finalValue = 0]].
	zeroParameters removeAllSuchThat: [:e | notAnalysedParameters includes: e].
	zeroParameters isEmpty
		ifFalse: [(self confirmWithZero: zeroParameters) ifFalse: [^nil]].
	zeroParameters do: [:defAttrib | defAttrib hasBeenModified: false].
	self warnExplanations.
	labelForProcess := nil.
	^super checkSettings
]

{ #category : #'actions_buttons' }
ClassifyParameter >> confirmContinue: listCAVs [
	
	| text |
	text := 'Some parameters won''t be analysed! \OK to continue? \' withCRs
		asText emphasizeAllWith: #bold.
	listCAVs
		do:
			[:defAttrib | 
			text := text
				, (defAttrib targetClass name asText emphasizeAllWith: #(#italic)).
			text := text , ' - ' asText.
			text := text
				,
					(defAttrib targetAttribute asString asText emphasizeAllWith: #(#italic)).
			text := text , '    --> ' asText.
			text := text
				,
					(defAttrib currentValueAsString asText
						emphasizeAllWith: #color -> ColorValue red) asText.
			text := text , '\' withCRs asText].
	^Dialog confirm: text asText
]

{ #category : #'actions_buttons' }
ClassifyParameter >> confirmWithZero: listCAVs [
	
	| text |
	text := 'Some parameters = 0 and won''t be analysed! \OK to continue? \'
		withCRs asText emphasizeAllWith: #bold.
	listCAVs
		do:
			[:defAttrib | 
			text := text
				, (defAttrib targetClass name asText emphasizeAllWith: #(#italic)).
			text := text , ' - ' asText.
			text := text
				,
					(defAttrib targetAttribute asString asText emphasizeAllWith: #(#italic)).
			text := text , '    --> ' asText.
			text := text
				,
					(defAttrib currentValueAsString asText
						emphasizeAllWith: #color -> ColorValue red) asText.
			text := text , '\' withCRs asText].
	^Dialog confirm: text asText
]

{ #category : #accessing }
ClassifyParameter >> defaultDirectoryName [
	
	^'ClassifierOAT_'
]

{ #category : #'actions_buttons' }
ClassifyParameter >> endAnalysis [
	
	zeroError isNil ifFalse: [self warnZero].
	super endAnalysis
]

{ #category : #sensitivity }
ClassifyParameter >> getDataModifiedBy: aParameter ofProbe: aProbeName [
	
	| standardFile list data table |
	list := self dataSaver directory directoryContents asList.
	standardFile := list
		detect:
			[:f | 
			(f
				findString: aProbeName asString
				startingAt: 1) ~= 0].
	table := Cormas
		readCsv: (self dataSaver directory construct: standardFile).
	table removeFirst.
	data := OrderedCollection new.
	(table select: [:t | (t first findString: aParameter startingAt: 1) ~= 0])
		do: [:coll | data add: coll last].
	^data
]

{ #category : #sensitivity }
ClassifyParameter >> getExcelDataModifiedBy: aParameter ofProbe: aProbeName [
	
	| data table |
	table := self dataSaver getDataFromSheet: aProbeName asString.	"table removeFirst."
	data := OrderedCollection new.
	(table select: [:t | (t first findString: aParameter startingAt: 1) ~= 0])
		do: [:coll | data add: coll last].
	^data
]

{ #category : #sensitivity }
ClassifyParameter >> getStandardDataOfProbe: aProbeName [
	
	| standardFile list data table |
	list := standardAnalysis dataSaver directory directoryContents asList.
	standardFile := list
		detect:
			[:f | 
			(f
				findString: aProbeName asString
				startingAt: 1) ~= 0].
	table := Cormas
		readCsv: (standardAnalysis dataSaver directory construct: standardFile).
	table removeFirst.
	data := OrderedCollection new.
	table do: [:coll | data add: coll last].
	^data
]

{ #category : #'initialize-release' }
ClassifyParameter >> initProbeFormat [
	
	| initialList |
	initialList := List new.
	initialList
		add: 'last value';
		add: 'average per simulation';
		add: 'average on period...'.
	self probeFormat list: initialList.
	self probeFormat selectionIndexHolder value: (Set with: 1).
	probeFormat selectionIndexHolder onChangeSend: #changedProbeFormat to:
			self
]

{ #category : #aspects }
ClassifyParameter >> labelForProcess [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^labelForProcess isNil
		ifTrue: [labelForProcess := 'Waiting for starting...' asValue]
		ifFalse: [labelForProcess]
]

{ #category : #help }
ClassifyParameter >> mainHelp [
	"self new mainHelp"
	
	| text |
	"Classify Parameter Analysis allows to conduct OAT (One-Factor-At-A-Time) sensitivity analysis by modifying parameters' values. It means that the parameter sets are not crossed during analysis. 
Each studied parameter may be analysed by changing a little its initial value  (+/- 5, 10, 15 or 20 %). 
It runs 2 sessions of analysis: one with standard specifications of the parameters, then one with the new values of the parameters. Then it calculates the Sensitivity of each parameter in order to sort them as a sensitivity gradient."
	text := 'Purpose for Classify Parameter Analysis: \ \' withCRs asText
		emphasizeAllWith: #bold.
	text := text
		,
			'Classify Parameter Analysis allows to conduct OAT (One-Factor-At-A-Time) sensitivity analysis by modifying parameters'' values. 
It means that the parameter sets are not crossed during analysis. 
Each studied parameter may be analysed by changing a little its initial value  (+/- 5, 10, 15 or 20 %). 
It runs 2 sessions of analysis: one with standard specifications of the parameters, then one with the new values of the parameters. 
Then it calculates the Sensitivity of each parameter in order to sort them as a sensitivity gradient.'
				asText.	"	 "
	text := text
		,
			'
Each parameter can be modified from its default value by selecting +/- and a delta (5, 10, 15 or 20 %). 
By clicking on ''Set'' button,' asText.
	text := text
		,
			('New value' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text ,
			' are automatically set. But they can be modified manually.

Before running the Analysis, check if the new values are corrects.

At the end of the process, the Classifier calculates the Sensitivity of the probes according 
to each parameter from the following formula:
'.
	text := text
		,
			('	Sensib (prob.j) = ln(average(prob_j.modif)) - ln (average(prob_j.standard)) / ln (j.modif) - ln(J.stand).'
				asText emphasizeAllWith: #(#bold #italic #color #-> #ColorValue #red)).
	text := text ,
			'.\For each parameter'' value, N simulations can be repeated and the calculus uses the average of the probe.'.
	text := text ,
			'\Several files are stored. The main output file is called globalSensitivityOf_XX.csv.\'.
	Dialog warn: text withCRs asText
]

{ #category : #aspects }
ClassifyParameter >> percent [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^percent isNil
		ifTrue: [percent := 10 asValue]
		ifFalse: [percent]
]

{ #category : #aspects }
ClassifyParameter >> plusMinus [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^plusMinus isNil
		ifTrue: [plusMinus := #minus asValue]
		ifFalse: [plusMinus]
]

{ #category : #'initialize-release' }
ClassifyParameter >> prepareStandardFiles [
	
	standardAnalysis := SimpleStochasticAnalysis newOn: self cormasModel.
	standardAnalysis allAttributsList: self allAttributesList.
	standardAnalysis probeFormat: probeFormat.
	standardAnalysis listControle: listControle.
	standardAnalysis fixRandomSeed: fixRandomSeed.
	standardAnalysis listProbes: listProbes.
	standardAnalysis randomSeed: randomSeed.
	standardAnalysis nbOfRepeat: nbOfRepeat.
	standardAnalysis listInit: listInit.
	standardAnalysis fileFormat: #csv asValue.
	standardAnalysis finalStep: finalStep.
	standardAnalysis releaseRandomSeed: releaseRandomSeed.
	standardAnalysis prepareFiles
]

{ #category : #'actions_buttons' }
ClassifyParameter >> runAnalysis [
	
	zeroError := nil.
	dataSaver isNil
		ifTrue:
			[self labelForProcess value:
					'Please, create a folder for the output files...'.
			Dialog
				warn:
					'All the output files will be saved in a single folder.\Please, create this folder ...'
						withCRs.
			self prepareFiles ifNil: [^nil]].	"Running the Standard analysis"
	(standardAnalysis filesExist
		and:
			[Dialog confirm:
					'	The standard analysis has already been done. 
Do you want to use the output files of this previous analysis 
and ignore this session (in order to speed up the analysis) ?'])
		ifFalse:
			[standardAnalysis openInterface: #runAnalysisWindow.
			self labelForProcess value: '1) standardAnalysis is running...'.
			standardAnalysis runSilently: true.
			standardAnalysis runAnalysis.
			standardAnalysis closeAndUnschedule].	"Running the analysis for modified parameters"
	self labelForProcess value:
			'2) standardAnalysis ended. Now Classifier Analysis is running...'.
	(self filesExist
		and:
			[Dialog confirm:
					'	The modified analysis has already been done. 
Do you want to use the output files of this previous analysis 
and ignore this session (in order to speed up the analysis) ?'])
		ifFalse:
			[self runSilently: true.
			super runAnalysis.
			self backToDefaultValues].	"calculate and store the Sensitivity"
	self labelForProcess
		value: 'Outputs: ' , self dataSaver directory asString.
	(dataSaver isKindOf: DataSaver_Excel) ifTrue: [dataSaver save].
	self calculateSensitivity.
	self runSilently: false.
	self simNumero: self simNumero + 1.
	self endAnalysis
]

{ #category : #save }
ClassifyParameter >> saveSettingsOnFile: aCSVfile [
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
	stream nextPutAll: 'Initial Value'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Final Value'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Increment Value'.
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
			stream nextPutAll: defAttrib initValue printString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: defAttrib finalValue printString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: defAttrib step printString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: '\' withCRs].
	stream close
]

{ #category : #sensitivity }
ClassifyParameter >> sensitivityOfProbe: aProbeName [
	"Answer a dictionary:
Dictionary (#Restrained_energy->0.171174 
		    #'Unrestrained class_harvestRate'->-0.0647275 
		   #'Restrained class_fertilityThreshold'->0.044081 
		  #ECEC_unrestrainedInitialNumber->0.0131293 
		  #'VegetationUnit class_K'->0.234738 
		  #'Restrained class_harvestRate'->0.0552551 
		  #'Unrestrained class_fertilityThreshold'->0.11595 
		  #Unrestrained_energy->0.0469096 
 		  #ECEC_restrainedInitialNumber->0.0949597 
		  #'VegetationUnit class_r'->0.814946 )

formule: Sensib (prob.j) = ln(moy(prob_j.modif)) - ln (moy(prob_j.standard)) / ln (j.modif) - ln(J.stand).
aProbeName = <Symbol>"

	| moyStandard dico |
	dico := Dictionary new.
	moyStandard := Cormas
average: (self getStandardDataOfProbe: aProbeName).
	self classAttribValueAnalysis_List list
		do: [ :aCAV | 
			dico
				at: (aCAV classNameAsString , '_' , aCAV attributeAsString) asSymbol
				put:
					(self
						sensitivityOfProbe: aProbeName
						toParameter: aCAV
						standardAverage: moyStandard) ].
	^ dico
]

{ #category : #sensitivity }
ClassifyParameter >> sensitivityOfProbe: aProbeName toParameter: aCAV standardAverage: moyStandard [
	"formule: Sensib (prob.j) = ln(moy(prob_j.modif)) - ln (moy(prob_j.standard)) / ln (j.modif) - ln(J.stand).
aProbeName = <Symbol>"

	| moyModified sensitivity data |
	data := self fileFormat value = #excel
		ifFalse: [ self
				getDataModifiedBy: aCAV classNameAsString , '_' , aCAV attributeAsString
				ofProbe: aProbeName ]
		ifTrue: [ self
				getExcelDataModifiedBy: aCAV classNameAsString , '_' , aCAV attributeAsString
				ofProbe: aProbeName ].
	moyModified := Cormas average: data.	"store information for impossible calculus"
	aCAV finalValue = aCAV currentValue
		ifTrue: [ ^ 0 ].
	(moyModified * moyStandard * aCAV finalValue * aCAV currentValue <= 0
		or: [ (moyModified * moyStandard * aCAV finalValue * aCAV currentValue) ln
				= 0 ])
		ifTrue: [ | aList |
			aList := List with: aCAV targetClass with: aCAV targetAttribute.
			aList
				add: moyModified;
				add: moyStandard;
				add: aCAV finalValue;
				add: aCAV currentValue.
			self zeroError at: aProbeName put: aList.
			^ 0 ].	"Sensitivity calculus"
	sensitivity := (moyModified abs ln - moyStandard abs ln)
		/ (aCAV finalValue abs ln - aCAV currentValue abs ln).
	^ sensitivity abs
]

{ #category : #save }
ClassifyParameter >> setCAVfrom: fileContent [
	
	| aCAV |
	self classAttribValue_List list
		do:
			[:cav | 
			cav initValue: nil.
			cav finalValue: nil.
			cav step: nil.
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
					aCAV initValue: (line at: 4).
					aCAV finalValue: (line at: 5).
					aCAV step: (line at: 6)]]
]

{ #category : #'initialize-release' }
ClassifyParameter >> setNewValues [
	
	| factor |
	factor := self percent value / 100 asFloat.
	self plusMinus value = #minus ifTrue: [factor := -1 * factor].
	self classAttribValue_List list
		do:
			[:cav | 
			| v |
			v := cav currentValue * (1 + factor).
			(cav valueType includesBehavior: Integer)
				ifTrue: [v := v rounded asInteger].
			cav finalValue: v.
			cav initValue: v.
			cav finalValue: v.
			cav step: 1.
			cav hasBeenModified: true].	"refresh"
	self classAttribValue_List list: self classAttribValue_List list
]

{ #category : #accessing }
ClassifyParameter >> totalSimNumber [
	"return the number of simulations for the analysis, Without multiplying by the repeat number for each parameters set."
	
	^self parametersToAnalyse size
]

{ #category : #'actions_buttons' }
ClassifyParameter >> warnExplanations [
	
	| text |
	text := 'The analysis to classify the parameters of the model will be preformed in 2 sessions: \ \'
		withCRs asText emphasizeAllWith: #bold.
	text := text
		,
			('1) Standard simulations to store the probes'' outputs for the standard specifications of the attributes \'
				withCRs asText emphasizeAllWith: #(#italic)).
	text := text , '    then \ ' withCRs asText.
	text := text
		,
			('2) Several simulations to store the probes'' outputs for the new values of the attributes \'
				withCRs asText emphasizeAllWith: #(#italic)) withCRs asText.
	^Dialog warn: text asText
]

{ #category : #'actions_buttons' }
ClassifyParameter >> warnZero [
	"Warn parameters for impossible calculus"
	"zeroError = Dictionary with #probeName as key and an associated list: moyModified ; moyStandard ;  finalValue ;  currentValue "
	
	| text listInfo |
	listInfo := #('class' 'attribute' 'modifiedAverage' 'standardAverage' 'modified parameter value' 'standard parameter value').
	text := 'Some sensitivities to parameters have not been calculated because of LN(0) error ! \'
		withCRs asText emphasizeAllWith: #bold.
	self zeroError
		keysAndValuesDo:
			[:key :list | 
			text := text , 'Sensitivity of '.
			text := text , (key asString asText emphasizeAllWith: #(#italic)).
			text := text , ' for parameter '.
			text := text
				,
					(((list at: 1) name asString , '_' , (list at: 2) asString) asText
						emphasizeAllWith: #color -> ColorValue red) asText.
			text := text , ' is set to 0 because '.
			text := text
				,
					(((listInfo at: (list indexOf: 0)) asString asText emphasizeAllWith:
							#(#italic)) , ' is 0.') asText.
			text := text , '\' withCRs asText].
	^Dialog warn: text asText
]

{ #category : #accessing }
ClassifyParameter >> zeroError [
	"zeroError = Dictionary with #probeName as key and an associated list: moyModified ; moyStandard ;  finalValue ;  currentValue "
	
	^zeroError ifNil: [zeroError := Dictionary new]
]

{ #category : #accessing }
ClassifyParameter >> zeroError: anObject [
	
	zeroError := anObject
]
