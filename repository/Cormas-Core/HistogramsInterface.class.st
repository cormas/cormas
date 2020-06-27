"
This class provides an interface that links to a Cormas model  (http://cormas.cirad.fr) to allow ploting histograms which bars' heights correspond to the number of occurrence in each class (classes being for example people from age 10 to 20, then from age 20 to 30 etc‚Ä¶).

To use this HistogramsInterface Class proceed as so:
- in the init method of your Cormas model write the following line ‚ÄúHistogramsInterface newWith: self‚Äù  (the line can be placed anywhere in your init method)
    *** from now on, a new interface, the ‚Äúhistograms interface‚Äù will open each time you init your model ***
- in your Cormas model class, create a new protocol named ‚Äúhistograms‚Äù
    ***in this protocol you can now add as many histograms definition you want***
- the syntax of a method defining a new histogram is as so:
     - it should return an Array instance composed of 2 OrderedCollection (or one OrderedCollection and one Array)
     - the first value of this Array is the collection of quantitative values you want to plot in the histograms (e.g. a collection of age of an agents population)
     - the second value of this Array is the classes to which you want to plot your data (e.g. to define the 3 following classes 0 to 30; 30 to 60 and 60 to 90, the value to be sent is #(0 30 90 100).  )
    ***note that 2 additional classes will be created: one for all values less than your lowest class; and a second for all values higher than your highest class****

_______________________________
creation date: 14-03-06
by: Nicolas Becu
email: becu@uni-hohenheim.de
"
Class {
	#name : #HistogramsInterface,
	#superclass : #UIApplicationModel,
	#instVars : [
		'data',
		'cormasModel',
		'histoList',
		'nbClasses',
		'selectedHisto',
		'classes',
		'selectedClass',
		'yUnit',
		'isHistoOnEntityAttribute',
		'activeEntity',
		'histoName',
		'activeAttribute',
		'attributeType',
		'chartsView',
		'refreshEachStep',
		'menuHolder'
	],
	#category : #'Cormas-Core-Interface'
}

{ #category : #'initialize-release' }
HistogramsInterface class >> additionalWindow [
	
	| a aModel |
	aModel := HistogramsInterface allInstances last cormasModel.
	a := self new.
	a cormasModel: aModel.
	a init.
	a open
]

{ #category : #'interface specs' }
HistogramsInterface class >> classesSettings [
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
]

{ #category : #resources }
HistogramsInterface class >> menu [
	"Tools.MenuEditor new openOnClass: self andSelector: #menu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'Menu' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'open new window' 
			#value: #openNew)) #(1) nil)) #(MenuItem 
		#rawLabel: 'Options' 
		#nameKey: #options 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Change classes' 
			#value: #openClassesSettingWindow) #(MenuItem 
			#rawLabel: 'Y unit' 
			#nameKey: #yunit 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'occurence' 
				#nameKey: #yunitOccurence 
				#value: #beYunitOccurence 
				#indicationSelector: #yUnit) #(MenuItem 
				#rawLabel: 'percentage' 
				#nameKey: #yunitPerc 
				#value: #beYunitPerc 
				#indicationSelector: #yUnit)) #(2) nil))) #(2) nil))) #(2) nil)
		decodeAsLiteralArray
]

{ #category : #resources }
HistogramsInterface class >> menuForOneAttribute [
	"Tools.MenuEditor new openOnClass: self andSelector: #menuForOneAttribute"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'Options' 
		#nameKey: #options 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Change classes' 
			#value: #openClassesSettingWindow) #(MenuItem 
			#rawLabel: 'Y unit' 
			#nameKey: #yunit 
			#submenu: #(Menu #(#(MenuItem 
				#rawLabel: 'occurence' 
				#nameKey: #yunitOccurence 
				#value: #beYunitOccurence 
				#indicationSelector: #yUnit) #(MenuItem 
				#rawLabel: 'percentage' 
				#nameKey: #yunitPerc 
				#value: #beYunitPerc 
				#indicationSelector: #yUnit)) #(2) nil)) #(MenuItem 
			#rawLabel: 'refresh each step' 
			#nameKey: #refreshEachStep 
			#value: #refreshEachStepOption)) #(3) nil))) #(1) nil)
		decodeAsLiteralArray
]

{ #category : #'initialize-release' }
HistogramsInterface class >> newWith: aModel [
	
	| a |
	HistogramsInterface allInstances isEmpty
		ifTrue:
			[a := self new.
			a cormasModel: aModel.
			a init.
			a open]
]

{ #category : #'initialize-release' }
HistogramsInterface class >> openOnEntity: aE attribute: att model: aModel [
	
	| a |
	a := self new.
	a cormasModel: aModel.
	a initForEntity: aE attribute: att
]

{ #category : #'initialize-release' }
HistogramsInterface class >> openOnEntity: aE nonNumericAttribute: att model: aModel [
	
	| a |
	a := self new.
	a cormasModel: aModel.
	a attributeType: #NotNumeric.
	a initForEntity: aE attribute: att
]

{ #category : #'interface specs' }
HistogramsInterface class >> windowForOneAttribute [
	"Tools.UIPainter new openOnClass: self andSelector: #windowForOneAttribute"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Histogram' 
			#min: #(Point 300 200) 
			#max: #(Point 1000 800) 
			#bounds: #(Rectangle 800 450 1300 763) 
			#flags: 4 
			#menu: #menuHolder 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue #white))) 
		#component: #(SpecCollection 
			#collection: #(#(ChartViewSpec 
				#layout: #(LayoutFrame 17 0 25 0 0 0.952941 0 0.992674) 
				#name: #Chart1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #data 
				#dataSeries: #(ChartDataSpec 
					#series: #(#(ChartDataSetSpec 
						#name: 'data1') #(ChartDataSetSpec 
						#isData: false 
						#name: 'labels'))) 
				#xAxis: #(ChartingAxisSpec 
					#scale: #(ChartingScaleSpec 
						#invert: false 
						#restrictions: #(#auto #zero #div #log)) 
					#unit: '' 
					#tickPosition: #tickOutside 
					#sectionMarkAt: #none) 
				#yAxis: #(ChartingValueAxisSpec 
					#scale: #(ChartingScaleSpec 
						#invert: true))) #(InputFieldSpec 
				#layout: #(LayoutFrame 0 0 3 0 0 1 31 0) 
				#name: #InputField1 
				#flags: 0 
				#model: #histoName 
				#tabable: false 
				#alignment: #center 
				#style: #large 
				#isReadOnly: true))))
]

{ #category : #'interface specs' }
HistogramsInterface class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Histograms' 
			#min: #(Point 20 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 1325 600 1920 895) 
			#flags: 4 
			#menu: #menu) 
		#component: #(SpecCollection 
			#collection: #(#(ChartViewSpec 
				#layout: #(LayoutFrame 152 0 18 0 0 0.952941 0 0.992537) 
				#name: #Chart1 
				#model: #data 
				#dataSeries: #(ChartDataSpec 
					#series: #(#(ChartDataSetSpec 
						#name: 'data1') #(ChartDataSetSpec 
						#isData: false 
						#name: 'labels'))) 
				#xAxis: #(ChartingAxisSpec 
					#scale: #(ChartingScaleSpec 
						#invert: false 
						#restrictions: #(#auto #zero #div #log)) 
					#unit: '' 
					#tickPosition: #tickOutside 
					#sectionMarkAt: #none) 
				#yAxis: #(ChartingValueAxisSpec 
					#scale: #(ChartingScaleSpec 
						#invert: true))) #(LabelSpec 
				#layout: #(Point 12 52) 
				#name: #Label1 
				#label: 'Histogram list') #(SequenceViewSpec 
				#layout: #(Rectangle 10 75 142 255) 
				#name: #List1 
				#model: #histoList 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#valueChangeSelector: #setNewHistoData) 
				#useModifierKeys: true 
				#selectionType: #highlight))))
]

{ #category : #accessing }
HistogramsInterface >> activeAttribute [
	
	^activeAttribute
]

{ #category : #accessing }
HistogramsInterface >> activeAttribute: anObject [
	
	activeAttribute := anObject
]

{ #category : #accessing }
HistogramsInterface >> activeEntity [
	
	^activeEntity
]

{ #category : #accessing }
HistogramsInterface >> activeEntity: anObject [
	
	activeEntity := anObject
]

{ #category : #actions }
HistogramsInterface >> addClass [
	
	| diff |
	classes list size = 1
		ifTrue: [diff := 1]
		ifFalse:
			[diff := classes list last y asNumber
				- (classes list at: classes list size - 1) y asNumber].
	classes list
		add:
			(Point
				x: classes list last y
				y: (classes list last y asNumber + diff) printString)
]

{ #category : #accessing }
HistogramsInterface >> attributeType [
	
	^attributeType
]

{ #category : #accessing }
HistogramsInterface >> attributeType: anObject [
	
	attributeType := anObject
]

{ #category : #procedures }
HistogramsInterface >> autoClassesFor: dataCollec [
	
	| col int builtClasses |
	col := dataCollec asSet asOrderedCollection sort.
	col size = 1
		ifTrue:
			[self nbClasses: 1.
			^OrderedCollection with: col first].	"set interval for a maximum  of 10 classes"
	int := (col last - col first) / ((10 min: col size) - 1).
	builtClasses := OrderedCollection new.
	builtClasses add: col first.
	1
		to: (10 min: col size) - 1
		do: [:x | builtClasses add: col first + (x * int)].
	self nbClasses: builtClasses size.
	^builtClasses
]

{ #category : #actions }
HistogramsInterface >> beYunitOccurence [
	
	| refreshView |
	refreshView := self yUnit value ~= #yunitOccurence.
	self yUnit value: #yunitOccurence.
	refreshView ifTrue: [self setNewHistoData]
]

{ #category : #actions }
HistogramsInterface >> beYunitPerc [
	
	| refreshView |
	refreshView := self yUnit value ~= #yunitPerc.
	self yUnit value: #yunitPerc.
	refreshView ifTrue: [self setNewHistoData]
]

{ #category : #aspects }
HistogramsInterface >> classes [
	
	^classes isNil
		ifTrue:
			[classes := SelectionInList new.
			classes selectionIndexHolder
				compute: [:v | self selectedClass value: classes selection].
			classes]
		ifFalse: [classes]
]

{ #category : #accessing }
HistogramsInterface >> cormasModel [
	
	^cormasModel
]

{ #category : #accessing }
HistogramsInterface >> cormasModel: aModel [
	cormasModel == aModel
		ifTrue: [ ^ self ].
	cormasModel ifNotNil: [ cormasModel removeDependent: self ].
	(cormasModel := aModel) ifNotNil: [ cormasModel addDependent: self ].
	cormasModel whenTimeStepChangedDo: [ self refreshAfterStep ]
]

{ #category : #aspects }
HistogramsInterface >> data [
	
	^data isNil
		ifTrue: [data := List new asValue]
		ifFalse: [data]
]

{ #category : #aspects }
HistogramsInterface >> histoList [
	
	^histoList isNil
		ifTrue: [histoList := SelectionInList new]
		ifFalse: [histoList]
]

{ #category : #aspects }
HistogramsInterface >> histoName [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^histoName isNil
		ifTrue: [histoName := String new asValue]
		ifFalse: [histoName]
]

{ #category : #procedures }
HistogramsInterface >> histogramInPercOf: indiData withClasses: classesSet [
	
	| dataSet dataSetInPerc tot |
	dataSet := self histogramOf: indiData withClasses: classesSet.
	dataSetInPerc := OrderedCollection new.
	tot := dataSet
		inject: 0
		into: [:subTotal :next | subTotal + next first].
	dataSet
		do:
			[:i | 
			dataSetInPerc
				add:
					(Array
						with: i first / tot * 100
						with: i last)].
	^dataSetInPerc
]

{ #category : #procedures }
HistogramsInterface >> histogramInPercOf: indiData withTextClasses: classesSet [
	
	| dataSet dataSetInPerc tot |
	dataSet := self histogramOf: indiData withTextClasses: classesSet.
	dataSetInPerc := OrderedCollection new.
	tot := dataSet
		inject: 0
		into: [:subTotal :next | subTotal + next first].
	dataSet
		do:
			[:i | 
			dataSetInPerc
				add:
					(Array
						with: i first / tot * 100
						with: i last)].
	^dataSetInPerc
]

{ #category : #procedures }
HistogramsInterface >> histogramOf: indiData withClasses: classesSet [
	
	| dataSet temp classIndex int nbDigits |
	dataSet := OrderedCollection new.
	int := (classesSet last - classesSet first) / classesSet size.
	int >= 1
		ifTrue: [nbDigits := 0]
		ifFalse:
			[int >= 0.1
				ifTrue: [nbDigits := 1]
				ifFalse: [nbDigits := 2]].
	classIndex := 1.
	classesSet
		do:
			[:v | 
			temp := indiData select: [:i | i < v].
			classIndex = 1
				ifFalse:
					[dataSet
						add:
							(Array
								with: temp size
								with:
									'['
										,
											((Cormas
												round: (classesSet at: classIndex - 1)
												toNdigits: nbDigits) printString , ';'
												, (Cormas round: v toNdigits: nbDigits) printString , '['))].
			indiData removeAll: temp.
			classIndex := classIndex + 1].
	classesSet size = 1
		ifFalse:
			[dataSet
				add:
					(Array
						with: indiData size
						with: '>=' , classesSet last printString)]
		ifTrue:
			[dataSet
				add:
					(Array
						with: indiData size
						with: '=' , classesSet last printString)].
	^dataSet
]

{ #category : #procedures }
HistogramsInterface >> histogramOf: indiData withTextClasses: classesSet [
	
	| dataSet |
	dataSet := OrderedCollection new.
	classesSet
		do:
			[:v | 
			dataSet
				add:
					(Array
						with: (indiData select: [:i | i = v]) size
						with: v)].
	^dataSet
]

{ #category : #'initialize-release' }
HistogramsInterface >> init [
	
	self histoList
		list:
			(cormasModel class organization listAtCategoryNamed: #histograms)
				asSortedCollection asList
]

{ #category : #'initialize-release' }
HistogramsInterface >> initForEntity: aE attribute: att [
	
	| win |
	self isHistoOnEntityAttribute: true.
	self menuHolder: self class menuForOneAttribute asValue.
	self activeEntity: aE.
	self activeAttribute: att.
	win := (self allButOpenInterface: #windowForOneAttribute) window.
	self setNewHistoData.
	win
		openWithExtent:
			(win minimumSize x + (((self nbClasses min: 12) - 1.8) * 50))
				@ win minimumSize y.
	self refreshEachStepOption	"activate one time the option, so that it is true by default"
]

{ #category : #accessing }
HistogramsInterface >> isHistoOnEntityAttribute [
	
	^isHistoOnEntityAttribute ifNil: [isHistoOnEntityAttribute := false]
]

{ #category : #accessing }
HistogramsInterface >> isHistoOnEntityAttribute: anObject [
	
	isHistoOnEntityAttribute := anObject
]

{ #category : #accessing }
HistogramsInterface >> menuHolder [
	
	^menuHolder
]

{ #category : #accessing }
HistogramsInterface >> menuHolder: anObject [
	
	menuHolder := anObject
]

{ #category : #accessing }
HistogramsInterface >> nbClasses [
	
	^nbClasses
]

{ #category : #accessing }
HistogramsInterface >> nbClasses: anObject [
	
	nbClasses := anObject
]

{ #category : #actions }
HistogramsInterface >> openClassesSettingWindow [
	
	| aList |
	self histoList selection isNil
		ifTrue:
			[Cormas current warn: 'You need to select an histogram in the list first']
		ifFalse:
			[aList := List new.
			aList add: (Point x: '0' y: '0').
			self classes list: aList.
			self openInterface: #classesSettings]
]

{ #category : #actions }
HistogramsInterface >> openNew [
	
	HistogramsInterface additionalWindow
]

{ #category : #'initialize-release' }
HistogramsInterface >> populateHistoListOfEntity [
	
	self histoList
		list:
			(List
				withAll:
					(DefaultAttributesSetter attributsFromClass: self activeEntity) sorted)
]

{ #category : #procedures }
HistogramsInterface >> refreshAfterStep [
	
	self builder window isOpen
		and: [self refreshEachStep ifTrue: [self setNewHistoData]]
]

{ #category : #actions }
HistogramsInterface >> refreshEachStep [
	
	^refreshEachStep ifNil: [refreshEachStep := false]
]

{ #category : #actions }
HistogramsInterface >> refreshEachStep: aBool [
	
	refreshEachStep := aBool.
	aBool
		ifTrue: [(self menuHolder value atNameKey: #refreshEachStep) beOn]
		ifFalse: [(self menuHolder value atNameKey: #refreshEachStep) beOff]
]

{ #category : #actions }
HistogramsInterface >> refreshEachStepOption [
	
	self refreshEachStep: self refreshEachStep not
]

{ #category : #aspects }
HistogramsInterface >> selectedClass [
	
	^selectedClass isNil
		ifTrue: [selectedClass := nil asValue]
		ifFalse: [selectedClass]
]

{ #category : #aspects }
HistogramsInterface >> selectedHisto [
	
	^selectedHisto isNil
		ifTrue: [selectedHisto := self histoList selection asText asValue]
		ifFalse: [selectedHisto]
]

{ #category : #procedures }
HistogramsInterface >> setHistoDataForAttribute: aSymbol for: aClass [
	
	| dataCollec |
	self histoName
		value:
			self activeEntity name asString , ' : ' , self activeAttribute asString ,
					'	-	timestep ' , self cormasModel timeStep printString.
	dataCollec := (cormasModel allTheEntities: aClass) asOrderedCollection
		collect: [:i | i perform: aSymbol].
	self attributeType = #NotNumeric
		ifFalse:
			[self yUnit value = #yunitOccurence
				ifTrue:
					[self data
						value:
							(self
								histogramOf: dataCollec
								withClasses: (self autoClassesFor: dataCollec) asList)]
				ifFalse:
					[self yUnit value = #yunitPerc
						ifTrue:
							[self data
								value:
									(self
										histogramInPercOf: dataCollec
										withClasses: (self autoClassesFor: dataCollec) asList)]
						ifFalse: [self halt]]]
		ifTrue:
			[self nbClasses: dataCollec asSet size.
			self yUnit value = #yunitOccurence
				ifTrue:
					[self data
						value:
							(self
								histogramOf: dataCollec
								withTextClasses: dataCollec asSet asList)]
				ifFalse:
					[self yUnit value = #yunitPerc
						ifTrue:
							[self data
								value:
									(self
										histogramInPercOf: dataCollec
										withTextClasses: dataCollec asSet asList asList)]
						ifFalse: [self halt]]]
]

{ #category : #procedures }
HistogramsInterface >> setHistoDataWithClasses: definedCasses [
	
	self yUnit value = #yunitOccurence
		ifTrue:
			[self data
				value:
					(self
						histogramOf: (cormasModel perform: self histoList selection) first
						withClasses: definedCasses asList)]
		ifFalse:
			[self yUnit value = #yunitPerc
				ifTrue:
					[self data
						value:
							(self
								histogramInPercOf:
									(cormasModel perform: self histoList selection) first
								withClasses: definedCasses asList)]
				ifFalse: [self halt]]
]

{ #category : #actions }
HistogramsInterface >> setNewHistoClasses [
	
	| builtClasses |
	1
		to: self classes list size - 1
		do:
			[:i | 
			(self classes list at: i) y ~= (self classes list at: i + 1) x
				ifTrue:
					[^Cormas current warn:
							'High value of class ''n'', must be equal to the low value of class ''n+1'' ']].
	builtClasses := OrderedCollection new.
	builtClasses add: classes list first x asNumber.
	classes list do: [:c | builtClasses add: c y asNumber].
	self setHistoDataWithClasses: builtClasses
]

{ #category : #actions }
HistogramsInterface >> setNewHistoClassesAndClose [
	
	self setNewHistoClasses.
	self closeAndUnschedule
]

{ #category : #actions }
HistogramsInterface >> setNewHistoData [
	
	self isHistoOnEntityAttribute
		ifFalse:
			[self histoList selection isNil
				ifTrue: [self data value: List new]
				ifFalse:
					[self
						setHistoDataWithClasses:
							(cormasModel perform: self histoList selection) last]]
		ifTrue:
			[self
				setHistoDataForAttribute: self activeAttribute asSymbol
				for: self activeEntity]
]

{ #category : #accessing }
HistogramsInterface >> yUnit [
	
	^yUnit isNil
		ifTrue: [yUnit := #yunitOccurence asValue]
		ifFalse: [yUnit]
]
