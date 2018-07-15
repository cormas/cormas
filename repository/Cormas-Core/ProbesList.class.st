Class {
	#name : #ProbesList,
	#superclass : #UIApplicationModel,
	#instVars : [
		'cormasModel',
		'listEntities',
		'listProbes',
		'menuHolder'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #resources }
ProbesList class >> menuListProbes [
	"Tools.MenuEditor new openOnClass: self andSelector: #menuListProbes"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #addx 
			#defaultString: 'Add...') 
		#nameKey: #addx 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #specificProbe 
				#defaultString: 'a specific probe') 
			#nameKey: #specificProbe 
			#value: #addProbe) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #probeOnAttributex 
				#defaultString: 'a probe on attribute...') 
			#nameKey: #probeOnAttributex) #(MenuItem 
			#rawLabel: 'a probe on population metrics' 
			#nameKey: #probeOnPopMetrics)) #(3) nil)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #modify 
			#defaultString: 'Modify') 
		#nameKey: #modify 
		#value: #modifyProbe) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #delete 
			#defaultString: 'Delete') 
		#nameKey: #delete 
		#value: #deleteProbe)) #(3) nil) decodeAsLiteralArray
]

{ #category : #'interface specs' }
ProbesList class >> windowSpec [
	"UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #probes 
				#defaultString: 'Probes') 
			#min: #(Point 367 194) 
			#max: #(Point 567 530) 
			#bounds: #(Rectangle 700 525 1067 719) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.0163488 0 0.149485 0 0.47139 0 0.984536) 
				#model: #listEntities 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyProbe) 
				#multipleSelections: false 
				#selectionType: #highlight) #(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.512262 0 0.149485 0 0.989101 0 0.969072) 
				#model: #listProbes 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyProbe) 
				#menu: #menuHolder 
				#multipleSelections: false 
				#selectionType: #highlight) #(LabelSpec 
				#layout: #(LayoutOrigin 0 0.0326975 0 0.0154639) 
				#label: #(UserMessage 
					#key: #levels 
					#defaultString: 'Levels')) #(LabelSpec 
				#layout: #(LayoutOrigin 0 0.509537 0 0.0154639) 
				#label: #(UserMessage 
					#key: #probes 
					#defaultString: 'Probes')))))
]

{ #category : #menus }
ProbesList >> addAsProbeAttribute: attributeName [
	
	(Cormas current confirm: self attributeIsNumber)
		ifTrue: [self moveFromAccessToProbes: attributeName]
		ifFalse: [self modifyProbeFromAttribute: attributeName]
]

{ #category : #action }
ProbesList >> addPopMetric: metric ofAttribute: att forClass: aClass [
	
	| probeName choice |
	probeName := metric , (Cormas upperCaseFirstChar: att asString) , 'Of'
		, aClass name , 's'.
	choice := Dialog
		choose:
			'The probe ' , probeName ,
					' will be added.
(' , att , ' has to be a number)'
		labels: (Array with: 'Confirm' with: 'Cancel' with: 'Edit probe name')
		values: #(#confim #cancel #changeName)
		default: #confirm
		for: Dialog defaultParentWindow.
	choice = #cancel ifTrue: [^nil].
	choice = #changeName
		ifTrue: [probeName := self requestProbeNameInitialAnswer: probeName].
	self cormasModel
		compile:
			(probeName asString , '\ "return the ' , metric , ' value of '
				, aClass name , ' ' , att , ' to be recorded" \^self ' , metric ,
					'OfAttribute: #' , att , ' of: ' , aClass name) withCRs
		classified: 'probes'
		notifying: nil.
	self listEntitiesChanged
]

{ #category : #action }
ProbesList >> addPopSizeProbeForClass: aClass [
	
	| probeName choice |
	probeName := 'numberOf' , aClass name , 's'.
	choice := Dialog
		choose: 'The probe ' , probeName , ' will be added.'
		labels: (Array with: 'Confirm' with: 'Cancel' with: 'Edit probe name')
		values: #(#confim #cancel #changeName)
		default: #confirm
		for: Dialog defaultParentWindow.
	choice = #cancel ifTrue: [^nil].
	choice = #changeName
		ifTrue: [probeName := self requestProbeNameInitialAnswer: probeName].
	self cormasModel
		compile:
			(probeName asString , '\ "return the populmation size of ' , aClass name ,
					'" \^self the' , aClass name , 's size') withCRs
		classified: 'probes'
		notifying: nil.
	self listEntitiesChanged
]

{ #category : #action }
ProbesList >> addProbe [
	
	| aName class |
	self listEntities selection notNil
		ifTrue:
			[class := self listEntities selection = 'Global'
				ifTrue: [self cormasModel]
				ifFalse:
					[self cormasModel environment at: self listEntities selection asSymbol].
			aName := Dialog
				request: self chartName
				initialAnswer: ''
				onCancel: [^self].
			(class allInstVarNames includes: aName)
				ifTrue:
					[Cormas current warn: self checkProbeName.
					^self addProbe].
			self modifyProbe: aName asSymbol.
			self listEntitiesChanged]
]

{ #category : #'user messages' }
ProbesList >> alert_ChartAlreadyDefined [
	
	^Cormas current
		warn:
			(UserMessage defaultString: 'Already defined ! ' key: #chartDefined)
]

{ #category : #'user messages' }
ProbesList >> attributeIsNumber [
	
	^UserMessage defaultString: 'Are you sure this attribute is a number ?'
		key: #attributeIsNumber
]

{ #category : #'user messages' }
ProbesList >> chartName [
	
	^UserMessage defaultString: ' Probe name : ' key: #probeName
]

{ #category : #'user messages' }
ProbesList >> checkProbeName [
	"^'This is already an instance variable name !\Enter another name please !'
		withCRs"
	
	^UserMessage
		defaultString:
			'This is already an instance variable name !\Enter another name please !'
				withCRs
		key: #checkProbeName
]

{ #category : #accessing }
ProbesList >> cormasModel [
	
	^cormasModel
]

{ #category : #accessing }
ProbesList >> cormasModel: x [
	
	cormasModel := x
]

{ #category : #util }
ProbesList >> createAccessors: aName [
	
	| class |
	self listEntities selection notNil
		ifTrue:
			[class := self listEntities selection = 'Global'
				ifTrue: [self cormasModel]
				ifFalse:
					[self cormasModel environment at: self listEntities selection asSymbol].	"class addInstVarName: aName."
			class
				compile: (aName , '\^' , aName) withCRs
				classified: 'accessing'
				notifying: nil.
			class
				compile: (aName , ': x\' , aName , ' := x') withCRs
				classified: 'accessing'
				notifying: nil]
]

{ #category : #action }
ProbesList >> deleteProbe [
	
	| class attributeName source |
	(self listProbes selection notNil
		and: [self listEntities selection notNil])
		ifTrue:
			[class := self listEntities selection = 'Global'
				ifTrue: [self cormasModel]
				ifFalse:
					[self cormasModel environment at: self listEntities selection asSymbol].
			attributeName := self listProbes selection.
			(Cormas current
				confirm:
					(UserMessage defaultString: 'Remove this probe ?' key: #confirmRemoveProbe))
				ifTrue:
					[(class instVarNames includes: attributeName asString)
						ifFalse: [class removeSelector: attributeName]
						ifTrue:
							[source := (class compiledMethodAt: attributeName) getSource.
							class removeSelector: attributeName.
							class compile: source classified: 'accessing' notifying: nil]].
			self listEntitiesChanged]
]

{ #category : #action }
ProbesList >> editMethod: aSelector fromClass: aClass [
	
	| browser |
	browser := RefactoringBrowser open.
	browser navigator selectClass: aClass.
	browser navigator beHierarchy.
	browser navigator setSelector: aSelector
]

{ #category : #menus }
ProbesList >> initMenuAttributs [
	
	| menuAttributs menuDyn lesAttributs activeClass popGetters menuDyn2 menuPopMetrics |
	lesAttributs := OrderedCollection new.
	listEntities selection = 'Global'
		ifTrue:
			[popGetters := cormasModel allEntityClasses
				collect: [:c | cormasModel getterForEntityClass: c].
			lesAttributs
				addAll:
					(self cormasModel instVarNames
						select: [:var | (popGetters includes: var asSymbol) not])]
		ifFalse:
			[activeClass := self cormasModel environment
				at: listEntities selection asSymbol.
			['CormasKernel*' match: activeClass category asString]
				whileFalse:
					[lesAttributs addAll: activeClass instVarNames.
					activeClass := activeClass superclass]].
	menuDyn := (self menuHolder value atNameKey: #addx) submenu atNameKey:
			#probeOnAttributex.
	menuAttributs := RTMenu new.
	1
		to: lesAttributs size
		do:
			[:i | 
			| attribut |
			attribut := lesAttributs at: i.
			menuAttributs
				addItemLabel: attribut
				value: [self addAsProbeAttribute: attribut]].
	menuDyn submenu: menuAttributs.
	menuDyn2 := (self menuHolder value atNameKey: #addx) submenu atNameKey:
			#probeOnPopMetrics.
	listEntities selection = 'Global'
		ifTrue:
			["add menu for population metrics"
			(self menuHolder value atNameKey: #addx) submenu unhideItem: menuDyn2.
			menuPopMetrics := RTMenuBuilder new.
			self cormasModel allEntityClasses
				do:
					[:class | 
					| popAttributs |
					menuPopMetrics beginSubMenuLabeled: class name.
					menuPopMetrics
						addLabel: 'population size'
						value: [self addPopSizeProbeForClass: class].
					popAttributs := OrderedCollection new.
					activeClass := class.
					['CormasKernel*' match: activeClass category asString]
						whileFalse:
							[popAttributs addAll: activeClass instVarNames.
							activeClass := activeClass superclass].
					#(#sum #average #stDev #min #max #median #variance #lowerQuartile #interquartile #upperQuartile)
						do:
							[:metric | 
							menuPopMetrics beginSubMenuLabeled: metric , ' of'.
							popAttributs
								do:
									[:att | 
									menuPopMetrics
										addLabel: att
										value:
											[self
												addPopMetric: metric
												ofAttribute: att asSymbol
												forClass: class]].
							menuPopMetrics endSubMenu].
					menuPopMetrics endSubMenu].
			menuDyn2 submenu: menuPopMetrics menu]
		ifFalse:
			[(self menuHolder value atNameKey: #addx) submenu hideItem: menuDyn2]
]

{ #category : #aspects }
ProbesList >> listEntities [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^listEntities isNil
		ifTrue: [listEntities := SelectionInList new]
		ifFalse: [listEntities]
]

{ #category : #changed }
ProbesList >> listEntitiesChanged [
	
	| selectedClass |
	(listEntities selection = nil or: [listEntities selection = '---'])
		ifTrue:
			[(self menuHolder value atNameKey: #addx) disable.
			^listProbes list: List new].
	(self menuHolder value atNameKey: #addx) enable.
	selectedClass := listEntities selection = 'Global'
		ifTrue: [self cormasModel]
		ifFalse:
			[self cormasModel environment at: listEntities selection asSymbol].
	self listProbes list: selectedClass probes.
	self initMenuAttributs
]

{ #category : #aspects }
ProbesList >> listProbes [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^listProbes isNil
		ifTrue: [listProbes := SelectionInList new]
		ifFalse: [listProbes]
]

{ #category : #changed }
ProbesList >> listProbesChanged [
	
	listProbes selection = nil
		ifTrue:
			[(self menuHolder value atNameKey: #modify) disable.
			(self menuHolder value atNameKey: #delete) disable]
		ifFalse:
			[(self menuHolder value atNameKey: #modify) enable.
			(self menuHolder value atNameKey: #delete) enable]
]

{ #category : #accessing }
ProbesList >> menuHolder [
	
	^menuHolder
]

{ #category : #accessing }
ProbesList >> menuHolder: anObject [
	
	menuHolder := anObject
]

{ #category : #action }
ProbesList >> modifyProbe [
	
	| aClass |
	(self listProbes selection notNil
		and: [self listEntities selection notNil])
		ifTrue:
			[aClass := self listEntities selection = 'Global'
				ifTrue: [self cormasModel]
				ifFalse:
					[self cormasModel environment at: self listEntities selection asSymbol].
			self
				editMethod: self listProbes selection
				fromClass: aClass]
]

{ #category : #action }
ProbesList >> modifyProbe: probeName [
	
	| aClass comment |
	self listEntities selection notNil
		ifTrue:
			[aClass := self listEntities selection = 'Global'
				ifTrue: [self cormasModel]
				ifFalse:
					[self cormasModel environment at: self listEntities selection asSymbol].
			comment := '"return the data (a number) to be recorded"'.
			aClass
				compile: (probeName asString , '\' , comment , '\^x') withCRs
				classified: 'probes'
				notifying: nil.
			self editMethod: probeName fromClass: aClass]
]

{ #category : #action }
ProbesList >> modifyProbeFromAttribute: attributeName [
	
	| aClass selector |
	self listEntities selection notNil
		ifTrue:
			[aClass := self listEntities selection = 'Global'
				ifTrue: [self cormasModel]
				ifFalse:
					[self cormasModel environment at: self listEntities selection asSymbol].
			selector := Dialog
				request: self probeNameFromAttribute
				initialAnswer: attributeName asString , 'X'
				onCancel: [^self].
			aClass
				compile:
					(selector ,
							'\"modify this instruction to calculate the number to be recorded"\^self '
						, attributeName asString , ' messageX') withCRs
				classified: 'probes'
				notifying: nil.
			self
				editMethod: selector asSymbol
				fromClass: aClass.
			self listEntitiesChanged]
]

{ #category : #action }
ProbesList >> moveFromAccessToProbes: attributeName [
	
	| class source |
	self listEntities selection notNil
		ifTrue:
			[class := self listEntities selection = 'Global'
				ifTrue: [self cormasModel]
				ifFalse:
					[self cormasModel environment at: self listEntities selection asSymbol].
			((class allInstVarNames includes: attributeName)
				and: [(class includesSelector: attributeName asSymbol) not])
				ifTrue: [self createAccessors: attributeName].
			source := (class compiledMethodAt: attributeName asSymbol) getSource.
			class removeSelector: attributeName asSymbol.
			class compile: source classified: 'probes' notifying: nil.
			self listEntitiesChanged]
]

{ #category : #action }
ProbesList >> openOn: aCormasModel [
	
	| win initialList |
	self cormasModel: aCormasModel.
	initialList := OrderedCollection new.
	initialList addFirst: 'Global'.
	initialList add: '---'.
	initialList
		addAll:
			(self cormasModel allEntityClasses collect: [:c | c name asString])
				asSortedCollection.
	self listEntities list: initialList.
	self listEntities selectionIndexHolder onChangeSend: #listEntitiesChanged
		to: self.
	self listProbes selectionIndexHolder onChangeSend: #listProbesChanged to:
			self.
	self menuHolder: self class menuListProbes asValue.
	win := (self allButOpenInterface: #windowSpec) window.
	win openIn: (10 @ 20 extent: win minimumSize)
]

{ #category : #'user messages' }
ProbesList >> probeNameFromAttribute [
	
	^UserMessage defaultString: 'Then you should add a specific probe named'
		key: #specificProbeName
]

{ #category : #util }
ProbesList >> requestProbeNameInitialAnswer: defName [
	
	| name |
	name := ''.
	[name isEmpty
		or:
			[(name contains: [:char | char canBePartOfSelector not])
				or: [name first canStartKeyword not]]]
		whileTrue:
			[name := Dialog request:
					'           Enter a name for that probe.
(space and symbol characters are not allowed)' initialAnswer: defName].
	^name
]
