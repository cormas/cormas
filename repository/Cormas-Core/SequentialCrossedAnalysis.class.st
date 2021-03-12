"
SequentialCrossedAnalysis allows to conduct Crossed sensitivity analysis by modifying parameters' values. The parameters' values are crossed during analysis. 
Each studied parameter may be analysed by changing its initial value for each simulation run. Sequential means that this parameter will change its value from an InitialValue to a FinalValue by Increment (or step).



"
Class {
	#name : #SequentialCrossedAnalysis,
	#superclass : #CrossedSensitivity,
	#category : #'Cormas-Core-Analysis'
}

{ #category : #help }
SequentialCrossedAnalysis class >> asText [
	
	^'Sequential Crossed Analysis' asText
]

{ #category : #'interface specs' }
SequentialCrossedAnalysis class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Crossed analysis setter' 
			#min: #(Point 623 295) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 479 313 1192 776) 
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
				#layout: #(LayoutFrame 7 0 254 0 0 1.00129 0 1.00911) 
				#name: #Dataset1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 8191 6143)) 
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
					#label: 'Start value' 
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
					#label: 'Increment' 
					#labelIsImage: false 
					#width: 80 
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
				#isReadOnly: true) #(LabelSpec 
				#layout: #(Point 16 233) 
				#name: #Label5 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 0 2638 8191)) 
				#label: 'Set the parameters'' values to be crossed and analysed:' 
				#style: #small))))
]

{ #category : #help }
SequentialCrossedAnalysis >> mainHelpText [
	
	| text |
	text := super mainHelpText.
	text := text , '\Each parameter can be modified from a '.
	text := text
		,
			('Start value' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text , ' to a '.
	text := text
		,
			('Final value' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text , '. For each simulation, its value is increased by '.
	text := text
		,
			('Increment' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text ,
			'.\Thus, for 2 parameters, let''s say 
		X (initValue: 1 ; finalValue: 3 ; increment: 1) and 
		Y (initValue: 0 ; finalValue: 1 ; increment: 0.1), 
then 30 simulations (3 x 10) will be runned.'.
	text := text ,
			'.\Of course, for each set of parameters'' values, N simulations can be repeated.'.
	text := text ,
			'\The selected probes are stored as time series or/and the mean values (according to Record as:).\'.
	^text
]

{ #category : #save }
SequentialCrossedAnalysis >> saveSettingsOnFile: aCSVfile [
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

{ #category : #save }
SequentialCrossedAnalysis >> setCAVfrom: fileContent [
	
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
