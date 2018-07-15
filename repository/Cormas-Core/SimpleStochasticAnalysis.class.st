"
SimpleStochasticAnalysis is usefull for stochastic model.
Starting from identical initial conditions and from identical parameters' values, N simulations are repeated.
The selected probes are stored as time series, and the mean values of the probes are saved at each time step.



"
Class {
	#name : #SimpleStochasticAnalysis,
	#superclass : #SensitivityAnalysisAbstract,
	#category : 'Cormas-Core-Others'
}

{ #category : #resources }
SimpleStochasticAnalysis class >> fileFormatChooser [
	"Tools.MenuEditor new openOnClass: self andSelector: #fileFormatChooser"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #asciiFile 
			#defaultString: 'CSV file') 
		#value: #csv) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #excelFile 
			#defaultString: 'Excel file') 
		#value: #excel) #(MenuItem 
		#rawLabel: 'MSAccess' 
		#value: #access)) #(3) nil) decodeAsLiteralArray
]

{ #category : #'interface specs' }
SimpleStochasticAnalysis class >> runAnalysisWindow [
	"Tools.UIPainter new openOnClass: self andSelector: #runAnalysisWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Stochastic Sensitivity Analysis Control' 
			#min: #(Point 551 165) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 720 450 1418 615) 
			#flags: 8) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
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
SimpleStochasticAnalysis class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Stochastic analysis setter' 
			#min: #(Point 590 486) 
			#max: #(Point 590 627) 
			#bounds: #(Rectangle 719 321 1309 807) 
			#flags: 4 
			#menu: #menuBar 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
				#layout: #(Rectangle 144 424 266 459) 
				#name: #Region1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 6655 5119 8191) 
					#setBackgroundColor: #(ColorValue 4096 0 8191)) 
				#lineWidth: 1) #(SequenceViewSpec 
				#layout: #(Rectangle 338 80 581 265) 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 6143 8191)) 
				#model: #listProbes 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyProbe) 
				#helpText: 'select the probes (indicators). Ctrl click for several probes' 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(Point 340 56) 
				#label: 'Select global probes to record' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 349 297) 
				#name: #Label4 
				#label: 'Save as:') #(CheckBoxSpec 
				#layout: #(Point 9 42) 
				#name: #CheckBox1 
				#model: #isRandomSeedFixed 
				#helpText: 'Select if you want to fix the random seed and start each simulation with same seed value. Thus, each initial state will be identical' 
				#label: 'Fix the random seed') #(ActionButtonSpec 
				#layout: #(Rectangle 150 429 198 454) 
				#model: #apply 
				#label: 'Apply' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 213 429 260 454) 
				#name: #cancel 
				#model: #close 
				#label: 'Cancel' 
				#defaultable: true) #(CheckBoxSpec 
				#layout: #(Point 11 237) 
				#name: #releaseRandomSeed 
				#flags: 32 
				#model: #releaseRandomSeed 
				#helpText: 'Select if you want to release the initial random seed. Thus, each run may be different' 
				#label: 'Release random seed after initialization') #(LabelSpec 
				#layout: #(Point 24 425) 
				#name: #Label6 
				#label: 'final step:') #(InputFieldSpec 
				#layout: #(Rectangle 80 425 122 447) 
				#name: #InputField1 
				#model: #finalStep 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(DividerSpec 
				#layout: #(Rectangle -4 35 589 39) 
				#name: #Divider1) #(InputFieldSpec 
				#layout: #(Rectangle 152 47 262 71) 
				#name: #randomSeed 
				#flags: 40 
				#model: #randomSeed 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(MenuButtonSpec 
				#layout: #(Rectangle 432 297 572 320) 
				#name: #MenuButton1 
				#model: #fileFormat 
				#menu: #fileFormatChooser) #(SequenceViewSpec 
				#layout: #(Rectangle 378 340 573 434) 
				#name: #List2 
				#model: #probeFormat 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #help) 
				#menu: #menuProbeFormat 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(Point 349 321) 
				#name: #Label3 
				#label: 'Record as:') #(GroupBoxSpec 
				#layout: #(Rectangle 337 277 582 460) 
				#name: #GroupBox1 
				#label: 'Output format') #(SequenceViewSpec 
				#layout: #(LayoutFrame 26 0 99 0 263 0 228 0) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #listInit 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #actionModifierInit) 
				#helpText: 'select an init method. Ctrl click for several selections') #(SequenceViewSpec 
				#layout: #(LayoutFrame 26 0 280 0 263 0 409 0) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #listControle 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #actionModifierControle) 
				#helpText: 'select a control method. Ctrl click for several selections') #(LabelSpec 
				#layout: #(Point 392 6) 
				#name: #Label7 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 2064 4120 0)) 
				#label: 'Number of repetitions:') #(InputFieldSpec 
				#layout: #(Rectangle 525 6 579 28) 
				#name: #InputField2 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 3167 6339 0)) 
				#model: #nbOfRepeat 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 350 439) 
				#name: #periodLabel 
				#flags: 16 
				#label: 'Averaged on period: ' 
				#style: #small) #(InputFieldSpec 
				#layout: #(Rectangle 469 437 574 457) 
				#name: #periodField 
				#flags: 24 
				#model: #periodField 
				#isReadOnly: true) #(LabelSpec 
				#layout: #(Point 3 6) 
				#name: #Label12 
				#label: 'This simple analysis is usefull for ') #(LabelSpec 
				#layout: #(Point 185 6) 
				#name: #Label13 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: 'stochastic models') #(LabelSpec 
				#layout: #(Point 25 78) 
				#label: 'Select an ' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 83 78) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: 'init' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 101 78) 
				#name: #Label1 
				#label: 'method' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 28 56) 
				#name: #Label8 
				#label: 'for initialization to:') #(LabelSpec 
				#layout: #(Point 27 260) 
				#name: #Label2 
				#label: 'Select a ' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 79 260) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: 'step' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 106 260) 
				#name: #Label5 
				#label: 'method' 
				#style: #systemDefault))))
]

{ #category : #aspects }
SimpleStochasticAnalysis >> changedInitMethod [
	
	self listInit selection ifNil: [^nil].
	self cormasModel activeInit: self listInit selection asSymbol
]

{ #category : #aspects }
SimpleStochasticAnalysis >> changedStepMethod [
	
	self listControle selection ifNil: [^nil].
	self cormasModel activeControl: self listControle selection asSymbol
]

{ #category : #'actions_buttons' }
SimpleStochasticAnalysis >> checkSettings [
	"return self if ok"
	
	self nbOfRepeat value < 1
		ifTrue: [^self cormas warn: 'Please, enter the number of repetitions'].
	self finalStep value > 0
		ifFalse:
			[^self cormas warn:
					'Please, enter a final step to set the duration of each simulation'].
	self listProbes selections isEmpty
		ifTrue: [^self cormas warn: 'Please, select one probe, at least'].
	self fileFormat value isEmpty
		ifTrue: [^self cormas warn: 'Please, choose the file output format'].
	self listInit selection isEmpty
		ifTrue: [^self cormas warn: 'Please, select an init method'].
	self listControle selection isEmpty
		ifTrue: [^self cormas warn: 'Please, select a step method'].
	self probeFormat selections isEmpty
		ifTrue: [^self cormas warn: 'Please, select one probe format, at least']
]

{ #category : #accessing }
SimpleStochasticAnalysis >> defaultDirectoryName [
	
	^'SimpleSensitivity_'
]

{ #category : #'initialize-release' }
SimpleStochasticAnalysis >> init [
	
	super init.	"self finalStep value > 0
		ifFalse:
			[self cormas cycle value > 0
				ifTrue: [self finalStep value: self cormas cycle value]]."
	self listControle
		list: (self cormasModelClass organization listAtCategoryNamed: #control).
	self cormasModel activeControl notNil
		ifTrue: [self listControle selection: self cormasModel activeControl].
	self listInit
		list: (self cormasModelClass organization listAtCategoryNamed: #init).
	self cormasModel activeInit notNil
		ifTrue: [self listInit selection: self cormasModel activeInit].
	listInit selectionIndexHolder onChangeSend: #changedInitMethod to: self.
	listControle selectionIndexHolder onChangeSend: #changedStepMethod to:
			self
]

{ #category : #aspects }
SimpleStochasticAnalysis >> initMethod [
	
	^self listInit selection
]

{ #category : #simulation }
SimpleStochasticAnalysis >> initNextSimulation [
	"Incrementes simNumero by 1.
	If in a Repeat loop, initialize the model otherwise return Nil"
	
	self simNumero: self simNumero + 1.
	(self nbOfRepeat value = 0 and: [self simNumero > 1]) ifTrue: [^nil].
	self nbOfRepeat value = 0
		ifFalse:
			[self simNumero > self nbOfRepeat value ifTrue: [^nil].
			self simNumero > self totalSimNumberWithRepeat ifTrue: [self halt]].
	self initRandomSeed.
	self initSimulation
]

{ #category : #testing }
SimpleStochasticAnalysis >> isCrossedAnalysis [
	
	^false
]

{ #category : #testing }
SimpleStochasticAnalysis >> isRepeating [
	"answer if the current simulation is into a repeat loop"
	
	^self simNumero < self nbOfRepeat value
]

{ #category : #save }
SimpleStochasticAnalysis >> loadAnalysisSettings [
	
	| fileName fileContent aLine |
	fileName := Dialog
		requestFileName: 'Select a CSV file'
		default:
			((Cormas dataPath: self cormasModel class name) construct:
					'analysisSettings.csv').
	fileName = '' ifTrue: [^nil].
	fileName := fileName asFilename.
	fileContent := Cormas
		readMatrix: fileName
		sep: DataSaver_Asci separator.
	fileContent removeFirst.
	fileContent removeAllSuchThat: [:line | line isEmpty].
	aLine := fileContent
		detect: [:line | line first = 'Repetitions']
		ifNone: [nil].
	aLine isNil
		ifFalse:
			[self nbOfRepeat value: aLine last.
			fileContent remove: aLine].
	aLine := fileContent detect: [:line | line first = #isRandomSeedFixed].
	aLine last = 'no'
		ifTrue: [self isRandomSeedFixed value: false]
		ifFalse:
			[self isRandomSeedFixed value: true.
			self randomSeed value: aLine last].
	fileContent remove: aLine.
	aLine := fileContent detect: [:line | line first = 'releaseRandomSeed'].
	self releaseRandomSeed value: aLine last.
	fileContent remove: aLine.
	aLine := fileContent detect: [:line | line first = 'initMethod'].
	self listInit selection: aLine last asSymbol.
	fileContent remove: aLine.
	aLine := fileContent detect: [:line | line first = 'stepMethod'].
	self listControle selection: aLine last asSymbol.
	fileContent remove: aLine.
	aLine := fileContent detect: [:line | line first = 'finalStep'].
	self finalStep value: aLine last.
	fileContent remove: aLine.
	self backToDefaultValues.	"set the values of attributes"
	self setCAVfrom: fileContent.	"refresh"
	self classAttribValue_List list: self classAttribValue_List list
]

{ #category : #help }
SimpleStochasticAnalysis >> mainHelp [
	
	| text |
	text := 'Purpose for Simple Stochastic Analysis: \ \' withCRs asText
		emphasizeAllWith: #bold.
	text := text , 'This analysis is usefull for ' asText.
	text := text
		,
			('stochastic model' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text ,
			'.\Starting from identical initial conditions and from identical parameters'' values, N simulations are repeated.'.
	text := text ,
			'\The selected probes are stored as time series, and the mean values of the probes are saved at each time step.\'.
	self cormas warn: text withCRs asText
]

{ #category : #save }
SimpleStochasticAnalysis >> setCAVfrom: fileContent [
	
	
]

{ #category : #save }
SimpleStochasticAnalysis >> setDataSaverCurrentParameter [
	
	self dataSaver currentParameter: nil
]

{ #category : #aspects }
SimpleStochasticAnalysis >> stepMethod [
	
	^self listControle selection
]

{ #category : #accessing }
SimpleStochasticAnalysis >> totalSimNumberWithRepeat [
	"return the repeat number."
	
	^self nbOfRepeat value
]
