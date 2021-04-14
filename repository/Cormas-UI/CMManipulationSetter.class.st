"
CMManipulationSetter example.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CMManipulationSetter,
	#superclass : #CMSpecObject,
	#instVars : [
		'cormasModel',
		'classAttribValue_List',
		'selectedRow',
		'methodsForManip_List',
		'entity',
		'entityChoices',
		'applyToSubclasses'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #'interface specs' }
CMManipulationSetter class >> labelControl [
	
	^'Use for
control' asText asComposedText	"^('Employee
Number' asText emphasizeAllWith: (Array with: #bold with: #color->ColorValue red)) asComposedText"
]

{ #category : #'interface specs' }
CMManipulationSetter class >> labelInit [
	
	^'Use for
init' asText asComposedText	"^('Employee
Number' asText emphasizeAllWith: (Array with: #bold with: #color->ColorValue red)) asComposedText"
]

{ #category : #'interface specs' }
CMManipulationSetter class >> labelTesting [
	
	^'Use for
testing' asText asComposedText	"^('Employee
Number' asText emphasizeAllWith: (Array with: #bold with: #color->ColorValue red)) asComposedText"
]

{ #category : #'interface specs' }
CMManipulationSetter class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Manipulation Methods Setter' 
			#min: #(Point 427 371) 
			#max: #(Point 2200 2200) 
			#bounds: #(Rectangle 840 525 1267 896) 
			#flags: 8 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 6655 8191 5119))) 
		#component: #(SpecCollection 
			#collection: #(#(DataSetSpec 
				#properties: #(PropertyListDictionary #showVerticalLines true #allowColumnReordering true #showLineNumbers true #allowColumnResizing true #rowLabelsAsButtons false #showHorizontalLines true) 
				#layout: #(LayoutFrame 0 0 65 0 0 1.0 0 1.00563) 
				#name: #Dataset1 
				#model: #methodsForManip_List 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing false) 
					#label: ' N¬∞' 
					#labelIsImage: false 
					#width: 30 
					#rendererType: #rowSelector 
					#editorType: #rowSelector 
					#noScroll: false) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow methodAsString' 
					#label: 'Method' 
					#labelIsImage: false 
					#width: 160 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication true #allowSorting true #allowResizing true) 
					#model: #'selectedRow isInit' 
					#label: #labelInit 
					#labelIsImage: true 
					#width: 70 
					#rendererType: #CheckBox 
					#editorType: #CheckBox 
					#noScroll: false) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication true #allowSorting true #allowResizing true) 
					#model: #'selectedRow isControl' 
					#label: #labelControl 
					#labelIsImage: true 
					#width: 70 
					#rendererType: #CheckBox 
					#editorType: #CheckBox 
					#noScroll: false) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication true #allowSorting true #allowResizing true) 
					#model: #'selectedRow isTesting' 
					#label: #labelTesting 
					#labelIsImage: true 
					#width: 70 
					#rendererType: #CheckBox 
					#editorType: #CheckBox 
					#noScroll: false)) 
				#labelsAsButtons: true) #(ActionButtonSpec 
				#layout: #(Rectangle 309 35 384 58) 
				#name: #applyClose 
				#model: #finalize 
				#label: 'Apply - Close' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 241 35 296 58) 
				#name: #Apply 
				#model: #saveValues 
				#label: 'Apply' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 140 35 228 58) 
				#name: #SetDefaultValues 
				#model: #setDefaultValues 
				#label: 'Default settings' 
				#defaultable: true) #(ComboBoxSpec 
				#layout: #(Rectangle 246 5 384 27) 
				#name: #ComboBox1 
				#model: #entity 
				#comboList: #entityChoices) #(LabelSpec 
				#layout: #(Point 9 3) 
				#name: #Label1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7679 8191 7167)) 
				#label: 'Set manipulation methods of Entity' 
				#style: #systemDefault) #(CheckBoxSpec 
				#layout: #(Point 15 35) 
				#name: #applyToSubclasses 
				#flags: 16 
				#model: #applyToSubclasses) #(LabelSpec 
				#layout: #(Point 34 28) 
				#name: #labelapplyToSubclasses1 
				#flags: 16 
				#label: 'Apply to') #(LabelSpec 
				#layout: #(Point 34 41) 
				#name: #labelapplyToSubclasses2 
				#flags: 16 
				#label: 'subclasses'))))
]

{ #category : #aspects }
CMManipulationSetter >> applyToSubclasses [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^applyToSubclasses isNil
		ifTrue: [applyToSubclasses := false asValue]
		ifFalse: [applyToSubclasses]
]

{ #category : #'initialize-release' }
CMManipulationSetter >> changeEntity [
	
	| aList aMS |
	"collect all methods by using the setDefaultValues method, put them in the dataset, and then set back all the settings to false"
	self setDefaultValues.
	aList := self methodsForManip_List list copy.
	aList
		do:
			[:i | 
			i isInit: false.
			i isControl: false.
			i isTesting: false].	"read user defined preferences. If the preferences exists, set default value to fasle and then overwrite the preferences in the dataset"
	(self entityClass class selectors includes: #methodsForInit_UserDefined)
		ifTrue:
			[self entityClass methodsForInit_UserDefined
				do:
					[:m | 
					aMS := aList
						detect: [:i | i methodName = m asString]
						ifNone: [nil].
					aMS ifNotNil: [aMS isInit: true]]].
	(self entityClass class selectors includes: #methodsForControl_UserDefined)
		ifTrue:
			[self entityClass methodsForControl_UserDefined
				do:
					[:m | 
					aMS := aList
						detect: [:i | i methodName = m asString]
						ifNone: [nil].
					aMS ifNotNil: [aMS isControl: true]]].
	(self entityClass class selectors includes: #methodsForTesting_UserDefined)
		ifTrue:
			[self entityClass methodsForTesting_UserDefined
				do:
					[:m | 
					aMS := aList
						detect: [:i | i methodName = m asString]
						ifNone: [nil].
					aMS ifNotNil: [aMS isTesting: true]]].
	self methodsForManip_List list: aList.
	self entityClass subclasses isEmpty
		ifFalse:
			[self applyToSubclasses value: true.
			(self builder componentAt: #applyToSubclasses) isVisible: true.
			(self builder componentAt: #labelapplyToSubclasses1) isVisible: true.
			(self builder componentAt: #labelapplyToSubclasses2) isVisible: true]
		ifTrue:
			[self applyToSubclasses value: false.
			(self builder componentAt: #applyToSubclasses) isVisible: false.
			(self builder componentAt: #labelapplyToSubclasses1) isVisible: false.
			(self builder componentAt: #labelapplyToSubclasses2) isVisible: false]
]

{ #category : #accessing }
CMManipulationSetter >> cormasModel [
	
	^cormasModel
]

{ #category : #accessing }
CMManipulationSetter >> cormasModel: anObject [
	
	cormasModel := anObject
]

{ #category : #actions }
CMManipulationSetter >> defaultValuesForClass: aClass category: aSymbol [
	
	| aList i cat |
	aList := OrderedCollection new.
	cat := aSymbol asString.
	cat
		at: 1
		put: cat first asUppercase.
	(aClass perform: ('methodsFor' , cat) asSymbol)
		do: [ : m | i := CMClassManipulationMethod new.
			i
				targetClass: aClass;
				methodName: m;
				isInit: cat = 'Init';
				isControl: cat = 'Control';
				isTesting: cat = 'Testing'.
			aList add: i ].
	^ aList
]

{ #category : #aspects }
CMManipulationSetter >> entity [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^ entity isNil
		ifTrue: [ entity := String new asValueHolder ]
		ifFalse: [ entity ]
]

{ #category : #aspects }
CMManipulationSetter >> entityChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^ entityChoices isNil
		ifTrue: [ entityChoices := OrderedCollection new asValueHolder ]
		ifFalse: [ entityChoices]
]

{ #category : #accessing }
CMManipulationSetter >> entityClass [
	
	^ self entity value class
]

{ #category : #actions }
CMManipulationSetter >> finalize [
	
	self saveValues.
	self closeAndUnschedule
]

{ #category : #'initialize-release' }
CMManipulationSetter >> openOn: aModel [
	
	| win |
	cormasModel := aModel.
	self prepareTable.
	win := (self allButOpenInterface: #windowSpec) window.
	win open.
	entity value: entityChoices value first
]

{ #category : #'initialize-release' }
CMManipulationSetter >> prepareTable [
	
	| modelClasses |
	modelClasses := OrderedCollection new.
	modelClasses addAll: (cormasModel spatialClasses collect: #name).
	modelClasses addAll: (cormasModel socialClasses collect: #name).
	modelClasses addAll: (cormasModel passiveObjectClasses collect: #name).
	entityChoices := (OrderedCollection withAll: modelClasses) asValueHolder.
	self entity onChangeSend: #changeEntity to: self.	"self setDefaultValues."
	self initialize
]

{ #category : #actions }
CMManipulationSetter >> saveValues [
	
	| methodsName |
	"collect user define Init methods for a class"
	methodsName := (self methodsForManip_List list
		select: [:i | i isInit = true]) collect: [:i | i methodName].
	self
		write: methodsName
		inMethod: #methodsForInit_UserDefined
		inClass: self entityClass.
	self applyToSubclasses value
		ifTrue:
			[self entityClass subclasses
				do:
					[:c | self write: methodsName inMethod: #methodsForInit_UserDefined inClass: c]].	"collect user define Control methods for a self entityClasslass"
	methodsName := (self methodsForManip_List list
		select: [:i | i isControl = true]) collect: [:i | i methodName].
	self
		write: methodsName
		inMethod: #methodsForControl_UserDefined
		inClass: self entityClass.
	self applyToSubclasses value
		ifTrue:
			[self entityClass subclasses
				do:
					[:c | self write: methodsName inMethod: #methodsForControl_UserDefined inClass: c]].	"collect user define Testing methods for a self entityClasslass"
	methodsName := (self methodsForManip_List list
		select: [:i | i isTesting = true]) collect: [:i | i methodName].
	self
		write: methodsName
		inMethod: #methodsForTesting_UserDefined
		inClass: self entityClass.
	self applyToSubclasses value
		ifTrue:
			[self entityClass subclasses
				do:
					[:c | self write: methodsName inMethod: #methodsForTesting_UserDefined inClass: c]]
]

{ #category : #aspects }
CMManipulationSetter >> selectedRow [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^ selectedRow isNil
		ifTrue: [ selectedRow := nil asValueHolder ]
		ifFalse: [ selectedRow ]
]

{ #category : #actions }
CMManipulationSetter >> selectedRowClassNameAsStringLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x classNameAsString displayString <= y classNameAsString displayString].
	dscSortBlock := [:x :y | x classNameAsString displayString >= y classNameAsString displayString].
	sortBlock := self methodsForManip_List sortAspect ==
			#selectedRowClassNameAsString
		ifTrue:
			[self methodsForManip_List sortDirection == #asc
				ifTrue:
					[self methodsForManip_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self methodsForManip_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self methodsForManip_List sortAspect: #selectedRowClassNameAsString.
			self methodsForManip_List sortDirection: #dsc.
			ascSortBlock].
	self methodsForManip_List
		refreshList:
			(SortedCollection
				withAll: self methodsForManip_List list
				sortBlock: sortBlock) asList
]

{ #category : #actions }
CMManipulationSetter >> selectedRowIsControlLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x isControl displayString <= y isControl displayString].
	dscSortBlock := [:x :y | x isControl displayString >= y isControl displayString].
	sortBlock := self methodsForManip_List sortAspect == #selectedRowIsControl
		ifTrue:
			[self methodsForManip_List sortDirection == #asc
				ifTrue:
					[self methodsForManip_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self methodsForManip_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self methodsForManip_List sortAspect: #selectedRowIsControl.
			self methodsForManip_List sortDirection: #dsc.
			ascSortBlock].
	self methodsForManip_List
		refreshList:
			(SortedCollection
				withAll: self methodsForManip_List list
				sortBlock: sortBlock) asList
]

{ #category : #actions }
CMManipulationSetter >> selectedRowIsInitLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x isInit displayString <= y isInit displayString].
	dscSortBlock := [:x :y | x isInit displayString >= y isInit displayString].
	sortBlock := self methodsForManip_List sortAspect == #selectedRowIsInit
		ifTrue:
			[self methodsForManip_List sortDirection == #asc
				ifTrue:
					[self methodsForManip_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self methodsForManip_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self methodsForManip_List sortAspect: #selectedRowIsInit.
			self methodsForManip_List sortDirection: #dsc.
			ascSortBlock].
	self methodsForManip_List
		refreshList:
			(SortedCollection
				withAll: self methodsForManip_List list
				sortBlock: sortBlock) asList
]

{ #category : #actions }
CMManipulationSetter >> selectedRowIsTestingLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x isTesting displayString <= y isTesting displayString].
	dscSortBlock := [:x :y | x isTesting displayString >= y isTesting displayString].
	sortBlock := self methodsForManip_List sortAspect == #selectedRowIsTesting
		ifTrue:
			[self methodsForManip_List sortDirection == #asc
				ifTrue:
					[self methodsForManip_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self methodsForManip_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self methodsForManip_List sortAspect: #selectedRowIsTesting.
			self methodsForManip_List sortDirection: #dsc.
			ascSortBlock].
	self methodsForManip_List
		refreshList:
			(SortedCollection
				withAll: self methodsForManip_List list
				sortBlock: sortBlock) asList
]

{ #category : #actions }
CMManipulationSetter >> selectedRowMethodAsStringLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x methodAsString displayString <= y methodAsString displayString].
	dscSortBlock := [:x :y | x methodAsString displayString >= y methodAsString displayString].
	sortBlock := self methodsForManip_List sortAspect ==
			#selectedRowMethodAsString
		ifTrue:
			[self methodsForManip_List sortDirection == #asc
				ifTrue:
					[self methodsForManip_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self methodsForManip_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self methodsForManip_List sortAspect: #selectedRowMethodAsString.
			self methodsForManip_List sortDirection: #dsc.
			ascSortBlock].
	self methodsForManip_List
		refreshList:
			(SortedCollection
				withAll: self methodsForManip_List list
				sortBlock: sortBlock) asList
]

{ #category : #actions }
CMManipulationSetter >> setDefaultValues [
	
	| aList |
	aList := OrderedCollection new.
	aList
		addAll:
			(self
				defaultValuesForClass: self entityClass
				category: #init).
	aList
		addAll:
			(self
				defaultValuesForClass: self entityClass
				category: #control).
	aList
		addAll:
			(self
				defaultValuesForClass: self entityClass
				category: #testing).
	self methodsForManip_List list: aList
]

{ #category : #actions }
CMManipulationSetter >> setDefaultValuesAndApply [
	
	self setDefaultValues.
	self saveValues
]

{ #category : #'write in class' }
CMManipulationSetter >> write: stringArray inMethod: selector inClass: aClass [
	
	| class s |
	class := aClass class.
	s := WriteStream on: String new.
	s
		nextPutAll: selector;
		cr.
	s
		tab;
		crtab;
		nextPutAll: '^#('.
	stringArray do: [:mn | s 
		nextPut: $#;
		nextPutAll: mn;
		space ].
	s nextPutAll: ')'.
	class
		compile: s contents
		classified: #manipulation
]
