"
ParameterInterface allows to set and change the values of the parameters from an interface. Its main interface (a grid of 3 columns) is opened from Simulation menu of Cormas.
There are 2 types of default values of the parameters:
 - the InitialValues that are set at the initialisation of a simulation
 - the DefaultValues that are predefined in the model.
If the user changes the value of a parameter (xxx for instance) to test its impacts, the InitialValue (originaly equals to the defaultValue) is changed: the reader accessor (#xxx) of the attribute is compiled with the new value assigned by user. To return back to the defaultValue, the reader accessor is recompiled using the default value that is stored into #xxx_default method (in '- default value' protocol at the class level).
ParameterInterface can be customised by hidding attributes (menu Settings).

Instance Variables:
	hiddenParametersInterface	<DefaultAttributesSetter>	description of hiddenParametersInterface


"
Class {
	#name : #ParameterInterface,
	#superclass : #DefaultAttributesSetter,
	#category : 'Cormas-Core-Others'
}

{ #category : #'interface specs' }
ParameterInterface class >> hiddenParametersWindow [
	"Tools.UIPainter new openOnClass: self andSelector: #hideParameterWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Parameters' 
			#min: #(Point 508 295) 
			#max: #(Point 900 9000) 
			#bounds: #(Rectangle 720 450 1228 745) 
			#flags: 8 
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
					#model: #'selectedRow isHidden' 
					#label: 'hide' 
					#labelFont: #small 
					#labelIsImage: false 
					#width: 30 
					#rendererType: #CheckBox 
					#editorType: #CheckBox 
					#noScroll: true) #(DataSetColumnSpec 
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
				#layout: #(Rectangle 385 2 446 24) 
				#name: #Apply 
				#model: #hide 
				#label: 'Hide' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 23 3) 
				#name: #Label1 
				#label: 'Select the attributs to be hidden'))))
]

{ #category : #resources }
ParameterInterface class >> menuBar [
	"Tools.MenuEditor new openOnClass: self andSelector: #menuBar"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'File' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Export attributs values' 
			#value: #exportAttributsValues)) #(1) nil)) #(MenuItem 
		#rawLabel: 'Settings' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Hide parameters...' 
			#value: #hideParameters) #(MenuItem 
			#rawLabel: 'Show all parameters' 
			#value: #showAllParameters) #(MenuItem 
			#rawLabel: 'Save current settings' 
			#value: #saveCurrentSettings)) #(3) nil))) #(2) nil)
		decodeAsLiteralArray
]

{ #category : #'interface specs' }
ParameterInterface class >> windowSpec [
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
]

{ #category : #'interface specs' }
ParameterInterface class >> windowSpec2 [
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
]

{ #category : #'actions_menu' }
ParameterInterface >> compileHiddenAttributesMethod [
	"Compiles a new method (#hiddenAttributes) of CormasModel that returns a list of hidden attributes that won't be displayed by the parameter interface.

hiddenAttributes
''returns a list of hidden attributs that are not displayed by the parameter interface''
	| aList cav|
	aList := List new.
	cav := ClassAttributeValue newClass: Forager attribute: #energy value: nil.
	aList add: cav.
	cav := ClassAttributeValue newClass: Forager class attribute: #harvestRate value: nil.
	aList add: cav.
	^aList.
"
	
	| code |
	code := 'hiddenAttributes\"returns a list of hidden attributs that are not displayed by the parameter interface.\This method is automatically generated by the Parameters interface."\	| aList cav |\	aList := List new.\'
		withCRs.
	(self allAttributesList select: [:defaultAttrib | defaultAttrib isHidden])
		do:
			[:cav | 
			code := code , '	cav := ClassAttributeValue newClass: '
				, cav targetClass printString , ' attribute: '
				, cav targetAttribute printString , ' value: '
				, cav currentValueAsString
				,
					'.
	cav isHidden: true.
	aList add: cav.\' withCRs].
	code := code , '	^aList'.
	self cormasModel class compile: code classified: 'default values'
		notifying: nil
]

{ #category : #accessing }
ParameterInterface >> hiddenParametersInterface [
	
	^hiddenParametersInterface
]

{ #category : #accessing }
ParameterInterface >> hiddenParametersInterface: anObject [
	
	hiddenParametersInterface := anObject
]

{ #category : #'actions_menu' }
ParameterInterface >> hide [
	"Close the hideParameter interface and remove the parameters to be hidden from the main Parameter window"
	
	| theList |
	self closeAndUnschedule.
	self hiddenParametersInterface initFull.	"self hiddenParametersInterface classAttribValue_List list
		removeAllSuchThat: [:defaultAttrib | defaultAttrib isHidden].  optimisation pour ne pas que √ßa clignote : "
	theList := self hiddenParametersInterface classAttribValue_List list copy.
	self allAttributsList: theList copy.
	theList removeAllSuchThat: [:defaultAttrib | defaultAttrib isHidden].
	self hiddenParametersInterface classAttribValue_List list: theList.
	self saveCurrentSettings
]

{ #category : #'actions_menu' }
ParameterInterface >> hideParameters [
	"open a new interface that enables user to select the parameters to be hidden"
	
	hiddenParametersInterface := ParameterInterface new.
	hiddenParametersInterface cormasModel: self cormasModel.
	hiddenParametersInterface classAttribValue_List
		list: self allAttributesList copy.
	hiddenParametersInterface openInterface: #hiddenParametersWindow.
	hiddenParametersInterface hiddenParametersInterface: self
]

{ #category : #'actions_menu' }
ParameterInterface >> saveCurrentSettings [
	"Compiles a new method #hiddenAttributes of CormasModel that returns a list of hidden attributes that won't be displayed by the parameter interface"
	
	(Dialog
		confirm:
			'Do you want to save these settings ?
Thus, the hidden parameters will be saved in '
				, self cormasModel class name , '.')
		ifTrue: [self compileHiddenAttributesMethod]
]

{ #category : #actions }
ParameterInterface >> selectedRowIsHiddenLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x isHidden displayString <= y isHidden displayString].
	dscSortBlock := [:x :y | x isHidden displayString >= y isHidden displayString].
	sortBlock := self classAttribValue_List sortAspect == #selectedRowIsHidden
		ifTrue:
			[self classAttribValue_List sortDirection == #asc
				ifTrue:
					[self classAttribValue_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self classAttribValue_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self classAttribValue_List sortAspect: #selectedRowIsHidden.
			self classAttribValue_List sortDirection: #dsc.
			ascSortBlock].
	self classAttribValue_List
		refreshList:
			(SortedCollection
				withAll: self classAttribValue_List list
				sortBlock: sortBlock) asList
]

{ #category : #'actions_menu' }
ParameterInterface >> showAllParameters [
	"Display all the attributes (including hiddenAttributes) of the model on the parameter interface"
	
	self allAttributesList do: [:cav | cav isHidden: false].
	self initFull
]
