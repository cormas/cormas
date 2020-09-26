"
SensitivitySetter allows to conduct sensitivity analysis by modifying parameters' values.

Instance Variables:
	analysisProgress	<ValueModel>	description of analysisProgress
	classAttribValueAnalysis_List	<SelectionInList>	description of classAttribValueAnalysis_List
	cormas	<Cormas>	description of cormas
	currentAnalysedAttribute	<ClassAttributeValueAnalysis>	description of currentAnalysedAttribute
	dataSaver	<DataSaver>	description of dataSaver
	displaySimNumber	<ValueModel>	description of displaySimNumber
	fileFormat	<ValueModel>	description of fileFormat
	finalStep	<ValueModel>	description of finalStep
	fixRandomSeed	<ValueModel>	description of fixRandomSeed
	initMethod	<ValueModel>	description of initMethod
	initMethodChoices	<ValueModel>	description of initMethodChoices
	listProbes	<MultiSelectionInList>	description of listProbes
	nbOfRepeat	<ValueModel>	description of nbOfRepeat
	parametersToAnalyse	<(SequenceableCollection of: ClassAttributeValueAnalysis)>	description of parametersToAnalyse
	probeFormat	<MultiSelectionInList>	description of probeFormat
	randomSeed	<ValueModel>	description of randomSeed
	simNumero	<ArithmeticValue>	description of simNumero
	simProgress	<ValueModel>	description of simProgress
	stepMethod	<ValueModel>	description of stepMethod
	stepMethodChoices	<ValueModel>	description of stepMethodChoices


"
Class {
	#name : #SensitivitySetter,
	#superclass : #SensitivityAnalysisAbstract,
	#instVars : [
		'stepMethod',
		'initMethod',
		'stepMethodChoices',
		'initMethodChoices',
		'parametersToAnalyse',
		'classAttribValueAnalysis_List',
		'currentAnalysedAttribute'
	],
	#category : #'Cormas-Core-Others'
}

{ #category : #'interface specs' }
SensitivitySetter class >> runAnalysisWindow [
	"Tools.UIPainter new openOnClass: self andSelector: #runAnalysisWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'OAT Sensitivity Analysis Control' 
			#min: #(Point 675 242) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 720 450 1431 737) 
			#flags: 8) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
				#layout: #(Rectangle 495 112 565 151) 
				#name: #Region1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 7167 6143 8191) 
					#setBackgroundColor: #(ColorValue 5119 2048 8191)) 
				#lineWidth: 1) #(DataSetSpec 
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
					#label: 'Start value' 
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
					#label: 'Final value' 
					#labelIsImage: false 
					#width: 80 
					#rendererType: #Text 
					#editorType: #None 
					#type: #object 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow step' 
					#label: 'Increment' 
					#labelIsImage: false 
					#width: 80 
					#rendererType: #Text 
					#editorType: #None 
					#type: #object 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true)) 
				#labelsAsButtons: true) #(LabelSpec 
				#layout: #(Point 43 25) 
				#name: #Label3 
				#label: 'Current simulation:') #(LabelSpec 
				#layout: #(Point 43 66) 
				#name: #Label4 
				#label: 'Overal analysis:') #(GroupBoxSpec 
				#layout: #(Rectangle 16 -2 680 97) 
				#name: #GroupBox1 
				#label: 'Analysing') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 503 116 556 146) 
				#name: #runButton 
				#model: #runAnalysis 
				#label: #runIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 415 119) 
				#name: #Label1 
				#label: 'Run analysis') #(InputFieldSpec 
				#layout: #(Rectangle 575.25 65 666.75 89) 
				#name: #InputField1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #displaySimNumber 
				#isReadOnly: true) #(LabelSpec 
				#layout: #(Point 595 47) 
				#name: #Label5 
				#label: 'Simulation') #(ProgressWidgetSpec 
				#layout: #(Rectangle 155 28 563 43) 
				#name: #PercentDoneBar1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7167 8191 8191)) 
				#model: #simProgress 
				#direction: #horizontal 
				#position: #topLeft 
				#area: true 
				#reverse: false) #(ProgressWidgetSpec 
				#layout: #(Rectangle 155 69 563 84) 
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
				#layout: #(Point 597 5) 
				#name: #Label2 
				#label: 'final step') #(InputFieldSpec 
				#layout: #(Rectangle 594.5 23 647.5 47) 
				#name: #InputField2 
				#model: #finalStep 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 45 116) 
				#name: #Label6 
				#label: 'Set the folder') #(LabelSpec 
				#layout: #(Point 45 131) 
				#name: #Label7 
				#label: 'for output files:') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 133 118 185 148) 
				#name: #ActionButton1 
				#model: #prepareFiles 
				#label: #directoryIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true))))
]

{ #category : #'interface specs' }
SensitivitySetter class >> windowSpec_old [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Parameters' 
			#min: #(Point 623 295) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 720 437 1431 900) 
			#flags: 12 
			#menu: #menuBar) 
		#component: #(SpecCollection 
			#collection: #(#(GroupBoxSpec 
				#layout: #(Rectangle 289 2 469 213) 
				#name: #GroupBox2 
				#label: 'Output format') #(RegionSpec 
				#layout: #(Rectangle 548 193 655 225) 
				#name: #Region1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 7167 6143 8191) 
					#setBackgroundColor: #(ColorValue 5119 2048 8191)) 
				#lineWidth: 1) #(ActionButtonSpec 
				#layout: #(Rectangle 554 197 596 221) 
				#name: #Apply 
				#model: #apply 
				#label: 'Apply' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 604 197 649 221) 
				#name: #resetValues 
				#model: #resetValues 
				#helpText: 'Reset the parameters to their default value' 
				#label: 'Reset' 
				#defaultable: true) #(DataSetSpec 
				#properties: #(PropertyListDictionary #showVerticalLines true #allowColumnReordering true #showLineNumbers true #rowSize 30 #allowColumnResizing true #showHorizontalLines true) 
				#layout: #(LayoutFrame 11 0 235 0 0 1.00563 0 1.00924) 
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
					#model: #'selectedRow initValue' 
					#label: 'Initial value' 
					#labelIsImage: false 
					#width: 80 
					#editorType: #InputField 
					#type: #object 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow finalValue' 
					#label: 'Final value' 
					#labelIsImage: false 
					#width: 80 
					#editorType: #InputField 
					#type: #object 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow step' 
					#label: 'Step' 
					#labelIsImage: false 
					#width: 80 
					#editorType: #InputField 
					#type: #object 
					#noScroll: false 
					#formatString: '' 
					#labelsAsButtons: true)) 
				#labelsAsButtons: true) #(RadioButtonSpec 
				#layout: #(Point 274 210) 
				#name: #RadioButton1 
				#helpText: 'Each parameter is analysed sequentialy' 
				#label: 'Sequential') #(RadioButtonSpec 
				#layout: #(Point 351 210) 
				#name: #RadioButton2 
				#helpText: 'All parameters will be analysed by crossing the values' 
				#label: 'Crossed') #(LabelSpec 
				#layout: #(Point 199 209) 
				#name: #Label1 
				#label: 'Analysis type:') #(CheckBoxSpec 
				#layout: #(Point 511 106) 
				#name: #CheckBox1 
				#model: #isRandomSeedFixed 
				#helpText: 'Select if you want to fix the random seed and start each simulation with same seed value' 
				#label: 'Fix the random seed to:') #(LabelSpec 
				#layout: #(Point 510 161) 
				#name: #Label2 
				#label: 'Number of repetitions') #(InputFieldSpec 
				#layout: #(Rectangle 622 160 669 182) 
				#name: #nbOfRepeat 
				#model: #nbOfRepeat 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(InputFieldSpec 
				#layout: #(Rectangle 511 130 668 154) 
				#name: #randomSeed 
				#flags: 40 
				#model: #randomSeed 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(SequenceViewSpec 
				#layout: #(Rectangle 12 23 286 212) 
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
				#layout: #(Point 486 25) 
				#name: #Label3 
				#label: 'init:') #(LabelSpec 
				#layout: #(Point 481 52) 
				#name: #Label4 
				#label: 'step:') #(GroupBoxSpec 
				#layout: #(Rectangle 478 2 677 81) 
				#name: #GroupBox1 
				#label: 'Choose init and step methods') #(LabelSpec 
				#layout: #(Point 13 -1) 
				#name: #Label5 
				#label: 'Select probes to record') #(LabelSpec 
				#layout: #(Point 294 72) 
				#name: #Label6 
				#label: 'Record as:') #(SequenceViewSpec 
				#layout: #(Rectangle 294 93 459 203) 
				#name: #List1 
				#model: #probeFormat 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #checkMark) #(LabelSpec 
				#layout: #(Point 295 24) 
				#name: #Label7 
				#label: 'Save as:') #(MenuButtonSpec 
				#layout: #(Rectangle 295 45 460 66) 
				#name: #MenuButton1 
				#model: #fileFormat 
				#menu: #fileFormatChooser) #(GroupBoxSpec 
				#layout: #(Rectangle 477 91 675 188) 
				#name: #GroupBox3 
				#label: 'Randomness') #(ComboBoxSpec 
				#layout: #(Rectangle 508 25 669 46) 
				#name: #ComboBox1 
				#model: #initMethod 
				#comboList: #initMethodChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 509 52 670 74) 
				#name: #ComboBox2 
				#model: #stepMethod 
				#comboList: #stepMethodChoices))))
]

{ #category : #'actions_buttons' }
SensitivitySetter >> checkSettings [
	"return self if ok"
	
	self finalStep value > 0
		ifFalse:
			[^self cormas warn:
					'Please, enter a final step to set the duration of each simulation'].
	self listProbes selections isEmpty
		ifTrue: [^self cormas warn: 'Please, select one probe, at least'].
	self fileFormat value isEmpty
		ifTrue: [^self cormas warn: 'Please, choose the file output format'].
	self initMethod value isEmpty
		ifTrue: [^self cormas warn: 'Please, select an init method'].
	self stepMethod value isEmpty
		ifTrue: [^self cormas warn: 'Please, select a step method'].
	self probeFormat selections isEmpty
		ifTrue: [^self cormas warn: 'Please, select one probe format, at least'].
	self
		parametersToAnalyse:
			(self classAttribValue_List list
				select: [:defAttrib | defAttrib hasBeenModified]).
	self parametersToAnalyse isEmpty
		ifTrue:
			[(self cormas confirm:
					'There is no attribute to analyse.
OK to continue?') ifFalse: [^false]].
	self classAttribValueAnalysis_List list: self parametersToAnalyse
]

{ #category : #aspects }
SensitivitySetter >> classAttribValueAnalysis_List [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^classAttribValueAnalysis_List isNil
		ifTrue:
			[classAttribValueAnalysis_List := SelectionInListSortAware new.
			classAttribValueAnalysis_List selectionIndexHolder
				compute:
					[:v | self selectedRow value: classAttribValueAnalysis_List selection].
			classAttribValueAnalysis_List]
		ifFalse: [classAttribValueAnalysis_List]
]

{ #category : #actions }
SensitivitySetter >> confirmBackToDefaultValues [
	
	| text |
	text := 'Some attributes have been changed. OK to set the default values? \ \'
		withCRs asText emphasizeAllWith: #bold.
	(self classAttribValue_List list
		select: [:defAttrib | defAttrib hasBeenModified])
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
	^self cormas confirm: text asText
]

{ #category : #setParameters }
SensitivitySetter >> currentAnalysedAttribute [
	"Get the current analysed attribute from parametersToAnalyse"
	
	currentAnalysedAttribute
		ifNil:
			[self parametersToAnalyse isEmpty ifTrue: [^nil].
			currentAnalysedAttribute := self parametersToAnalyse first.
			currentAnalysedAttribute currentValue: nil].
	^currentAnalysedAttribute
]

{ #category : #setParameters }
SensitivitySetter >> currentAnalysedAttribute: aCAV [
	"Set the current analysed attribute from parametersToAnalyse"
	
	currentAnalysedAttribute := aCAV
]

{ #category : #'actions_buttons' }
SensitivitySetter >> endAnalysis [
	
	super endAnalysis.
	self classAttribValue_List list: self classAttribValue_List list
]

{ #category : #setParameters }
SensitivitySetter >> getAllAttributesList [
	
	| aList defaultParameters cav |
	aList := List new.
	defaultParameters := self getDefaultParametersValues.
	defaultParameters := defaultParameters
		select: [:coll | coll first subclasses isEmpty].
	defaultParameters
		do:
			[:coll | 
			cav := CMClassAttributeValueAnalysis
				newClass: coll first
				attribute: (coll at: 2)
				value: (coll at: 3).
			cav testIfModified.
			aList add: cav].
	self purgeClassAttribValue: aList.
	^aList
]

{ #category : #setParameters }
SensitivitySetter >> getDefaultParametersValues [
	"get the defaultParameters, just selecting attributes of number type..
	defaultParameters is an OrderedCollection containing OrderedCollections as following : 
	( index-i : Class ; attributName asSymbol ; defaultValue ) 
	( index-i : Class ; attributName asSymbol ; defaultValue ) ..."
	
	^super getDefaultParametersValues
		select: [:aTriColl | aTriColl last respondsToArithmetic]
]

{ #category : #setParameters }
SensitivitySetter >> getNextAnalysedAttribute [
	"Get the next analysed attribute from parametersToAnalyse"
	
	| i newCAV |
	self currentAnalysedAttribute isAnalysisDone
		ifTrue:
			[self setDefaultValue: self currentAnalysedAttribute.
			i := self parametersToAnalyse indexOf: self currentAnalysedAttribute.
			i = self parametersToAnalyse size ifTrue: [^nil].
			newCAV := self parametersToAnalyse at: i + 1.
			newCAV currentValue: nil.
			^newCAV].
	^self currentAnalysedAttribute
]

{ #category : #'initialize-release' }
SensitivitySetter >> init [
	
	super init.
	self stepMethodChoices
		value: (self cormasModelClass organization listAtCategoryNamed: #control).
	self cormasModel activeControl notNil
		ifTrue: [self stepMethod value: self cormasModel activeControl].
	self initMethodChoices
		value: (self cormasModelClass organization listAtCategoryNamed: #init).
	self cormasModel activeInit notNil
		ifTrue: [self initMethod value: self cormasModel activeInit].
	self initMethod.
	initMethod onChangeSend: #changedInitMethod to: self.
	self stepMethod.
	stepMethod onChangeSend: #changedStepMethod to: self
]

{ #category : #aspects }
SensitivitySetter >> initMethod [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^initMethod isNil
		ifTrue: [initMethod := String new asValue]
		ifFalse: [initMethod]
]

{ #category : #aspects }
SensitivitySetter >> initMethodChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^initMethodChoices isNil
		ifTrue: [initMethodChoices := List new asValue]
		ifFalse: [initMethodChoices]
]

{ #category : #simulation }
SensitivitySetter >> initNextSimulation [
	"Incrementes simNumero by 1.
	If not in a Repeat loop, it updates the values of the attributs of 
	the model (CormasModel) and initialize the model. Then updates 
	the 	values of the attributs of the entities"
	
	self simNumero: self simNumero + 1.
	(self simNumero = 1 or: [self isRepeating not])
		ifTrue:
			[self classAttribValueAnalysis_List list isEmpty
				ifTrue: [self simNumero > self totalSimNumberWithRepeat ifTrue: [^nil]]
				ifFalse: [self setNextAttributeValue ifNil: [^nil]]].
	self simNumero > self totalSimNumberWithRepeat ifTrue: [^nil].
	self initRandomSeed.
	self initSimulation
]

{ #category : #'initialize-release' }
SensitivitySetter >> initRunWindow [
	
	self currentAnalysedAttribute: nil.
	self classAttribValueAnalysis_List list: self parametersToAnalyse.
	self finalStep value > 0
		ifFalse:
			[self cormas cycle value > 0
				ifTrue: [self finalStep value: self cormas cycle value]].
	super initRunWindow
]

{ #category : #testing }
SensitivitySetter >> isCrossedAnalysis [
	
	self subclassResponsibility
]

{ #category : #actions }
SensitivitySetter >> openRunAnalysisWindow [
	
	self initRunWindow.
	self openInterface: #runAnalysisWindow
]

{ #category : #accessing }
SensitivitySetter >> parametersToAnalyse [
	
	^parametersToAnalyse ifNil: [parametersToAnalyse := List new]
]

{ #category : #accessing }
SensitivitySetter >> parametersToAnalyse: anObject [
	
	parametersToAnalyse := anObject
]

{ #category : #'initialize-release' }
SensitivitySetter >> reinitDefaultValues [
	"reset the current values of the parameters to their default values"
	
	(self classAttribValue_List list
		select: [:defAttrib | defAttrib hasBeenModified]) isEmpty
		ifFalse:
			[self confirmBackToDefaultValues ifTrue: [self backToDefaultValues]].
	self classAttribValueAnalysis_List list
		do: [:defAttrib | defAttrib hasBeenModified: true]
]

{ #category : #actions }
SensitivitySetter >> resetUncompleteAttributes [
	
	| listAttributes unmodifiedAttributes |
	listAttributes := self classAttribValue_List list
		select: [:defAttrib | defAttrib hasBeenModified].
	unmodifiedAttributes := listAttributes
		select:
			[:defAttrib | defAttrib initValue isNil or: [defAttrib finalValue isNil]].
	unmodifiedAttributes do: [:defAttrib | defAttrib hasBeenModified: false].
	(self classAttribValue_List list
		select: [:defAttrib | defAttrib hasBeenModified not])
		do:
			[:defAttrib | 
			defAttrib
				initValue: nil;
				finalValue: nil;
				step: nil].
	self classAttribValue_List refreshList: self classAttribValue_List list
]

{ #category : #actions }
SensitivitySetter >> resetValues [
	
	(self classAttribValue_List list
		select: [:defAttrib | defAttrib hasBeenModified]) do: [:cav | cav reset].
	parametersToAnalyse := nil.
	self classAttribValue_List list: self classAttribValue_List list
]

{ #category : #actions }
SensitivitySetter >> selectedRowAttributeAsStringLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x attributeAsString displayString <= y attributeAsString displayString].
	dscSortBlock := [:x :y | x attributeAsString displayString >= y attributeAsString displayString].
	sortBlock := self classAttribValue_List sortAspect ==
			#selectedRowAttributeAsString
		ifTrue:
			[self classAttribValue_List sortDirection == #asc
				ifTrue:
					[self classAttribValue_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self classAttribValue_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self classAttribValue_List sortAspect: #selectedRowAttributeAsString.
			self classAttribValue_List sortDirection: #dsc.
			ascSortBlock].
	self classAttribValue_List
		refreshList:
			(SortedCollection
				withAll: self classAttribValue_List list
				sortBlock: sortBlock) asList
]

{ #category : #actions }
SensitivitySetter >> selectedRowClassNameAsStringLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x classNameAsString displayString <= y classNameAsString displayString].
	dscSortBlock := [:x :y | x classNameAsString displayString >= y classNameAsString displayString].
	sortBlock := self classAttribValue_List sortAspect ==
			#selectedRowClassNameAsString
		ifTrue:
			[self classAttribValue_List sortDirection == #asc
				ifTrue:
					[self classAttribValue_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self classAttribValue_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self classAttribValue_List sortAspect: #selectedRowClassNameAsString.
			self classAttribValue_List sortDirection: #dsc.
			ascSortBlock].
	self classAttribValue_List
		refreshList:
			(SortedCollection
				withAll: self classAttribValue_List list
				sortBlock: sortBlock) asList
]

{ #category : #actions }
SensitivitySetter >> selectedRowCurrentValueLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x currentValue displayString <= y currentValue displayString].
	dscSortBlock := [:x :y | x currentValue displayString >= y currentValue displayString].
	sortBlock := self classAttribValue_List sortAspect ==
			#selectedRowCurrentValue
		ifTrue:
			[self classAttribValue_List sortDirection == #asc
				ifTrue:
					[self classAttribValue_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self classAttribValue_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self classAttribValue_List sortAspect: #selectedRowCurrentValue.
			self classAttribValue_List sortDirection: #dsc.
			ascSortBlock].
	self classAttribValue_List
		refreshList:
			(SortedCollection
				withAll: self classAttribValue_List list
				sortBlock: sortBlock) asList
]

{ #category : #save }
SensitivitySetter >> setCAVfrom: fileContent [
	
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

{ #category : #save }
SensitivitySetter >> setDataSaverCurrentParameter [
	
	self dataSaver currentParameter: self currentAnalysedAttribute
]

{ #category : #setParameters }
SensitivitySetter >> setNextAttributeValue [
	"Set the next value of the analysed attributes."
	
	self subclassResponsibility
]

{ #category : #aspects }
SensitivitySetter >> stepMethod [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^stepMethod isNil
		ifTrue: [stepMethod := String new asValue]
		ifFalse: [stepMethod]
]

{ #category : #aspects }
SensitivitySetter >> stepMethodChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^stepMethodChoices isNil
		ifTrue: [stepMethodChoices := List new asValue]
		ifFalse: [stepMethodChoices]
]
