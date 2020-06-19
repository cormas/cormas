"
BrowserCodeTool is the CodeTool that modifies methods.

Instance Variables:
	initialLookPrefs	<LookPreferences | nil>	the look preferences of the text widget before we set the text to be red
	modified	<Boolean>	has the been changed since we initially displayed it?
"
Class {
	#name : #BrowserCodeTool,
	#superclass : #Object,
	#instVars : [
		'modified',
		'initialLookPrefs'
	],
	#classVars : [
		'BrowseAutoFormat',
		'SaveAutoFormat'
	],
	#category : #'Cormas-Core-Others'
}

{ #category : #autoformat }
BrowserCodeTool class >> browseAutoFormat [
	
	^BrowseAutoFormat
]

{ #category : #autoformat }
BrowserCodeTool class >> browseAutoFormat: aBoolean [
	
	BrowseAutoFormat := aBoolean
]

{ #category : #resources }
BrowserCodeTool class >> mainMenu [
	"Tools.MenuEditor new openOnClass: self andSelector: #mainMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_Accept 
			#defaultString: '&Accept' 
			#catalogID: #browser) 
		#nameKey: #Accept 
		#value: #action: 
		#shortcutKeyCharacter: $S 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #F_ormat 
			#defaultString: 'F&ormat' 
			#catalogID: #browser) 
		#nameKey: #'Format Code' 
		#value: #action: 
		#shortcutKeyCharacter: $O 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #GoToClass 
			#defaultString: 'Go to Class' 
			#catalogID: #browser) 
		#nameKey: #'Navigate to Class' 
		#value: #action: 
		#enablementSelector: #hasClassSelected) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #BrowseClassInNewWindow 
			#defaultString: 'Browse Class in New Window' 
			#catalogID: #browser) 
		#nameKey: #'Open Browser on Class' 
		#value: #action: 
		#enablementSelector: #hasClassSelected 
		#shortcutKeyCharacter: #F12 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #BrowseReferencesToClass 
			#defaultString: 'Browse References to Class' 
			#catalogID: #browser) 
		#nameKey: #'Browse References to Class' 
		#value: #action: 
		#enablementSelector: #hasClassSelected 
		#shortcutKeyCharacter: #F11 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #BrowseVariableRe_ferencesDots 
			#defaultString: 'Browse Variable Re&ferences...' 
			#catalogID: #browser) 
		#nameKey: #'Selected Global Instance Variable References' 
		#value: #action: 
		#enablementSelector: #hasInstanceVariableSelected 
		#shortcutKeyCharacter: #F11 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #BrowseVariableRea_dersDots 
			#defaultString: 'Browse Variable Rea&ders...' 
			#catalogID: #browser) 
		#nameKey: #'Selected Global Instance Variable Readers' 
		#value: #action: 
		#enablementSelector: #hasInstanceVariableSelected) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #BrowseVariable_WritersDots 
			#defaultString: 'Browse Variable &Writers...' 
			#catalogID: #browser) 
		#nameKey: #'Selected Global Instance Variable Writers' 
		#value: #action: 
		#enablementSelector: #hasInstanceVariableSelected) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Browse_SendersOfSelector 
			#defaultString: 'Browse &Senders of Selector' 
			#catalogID: #browser) 
		#nameKey: #'Selected Message References' 
		#value: #action: 
		#enablementSelector: #hasMessageNodeSelected 
		#shortcutKeyCharacter: #F11 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Browse_ImplementorsOfSelector 
			#defaultString: 'Browse &Implementors of Selector' 
			#catalogID: #browser) 
		#nameKey: #'Selected Message Implementors' 
		#value: #action: 
		#enablementSelector: #hasMessageNodeSelected 
		#shortcutKeyCharacter: #F12 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Refactor 
			#defaultString: 'Refactor' 
			#catalogID: #browser) 
		#nameKey: #refactorMenu 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #_ExtractValueToTemporary 
				#defaultString: '&Extract Value to Temporary' 
				#catalogID: #browser) 
			#nameKey: #'Extract to Temporary' 
			#value: #action: 
			#enablementSelector: #hasValueNodeSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #Re_nameVariableAsDots 
				#defaultString: 'Re&name Variable As...' 
				#catalogID: #browser) 
			#nameKey: #'Rename Selected Temporary Variable' 
			#value: #action: 
			#enablementSelector: #hasTemporaryVariableSelected 
			#shortcutKeyCharacter: $N 
			#shortcutModifiers: 3) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #MoveToInner_Scope 
				#defaultString: 'Move to Inner &Scope' 
				#catalogID: #browser) 
			#nameKey: #'Move Selected Temporary to Innermost Scope' 
			#value: #action: 
			#enablementSelector: #hasTemporaryVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #Con_vertToInstanceVariable 
				#defaultString: 'Con&vert to Instance Variable' 
				#catalogID: #browser) 
			#nameKey: #'Convert Temporary Variable to Instance Variable' 
			#value: #action: 
			#enablementSelector: #hasTemporaryVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #_RemoveParameter 
				#defaultString: '&Remove Parameter' 
				#catalogID: #browser) 
			#nameKey: #'Remove Selected Parameter' 
			#value: #action: 
			#enablementSelector: #hasTemporaryVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #In_lineParameter 
				#defaultString: 'In&line Parameter' 
				#catalogID: #browser) 
			#nameKey: #'Inline Selected Parameter' 
			#value: #action: 
			#enablementSelector: #hasTemporaryVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #In_lineMethod 
				#defaultString: 'In&line Method' 
				#catalogID: #browser) 
			#nameKey: #'Inline Method' 
			#value: #action: 
			#enablementSelector: #hasMessageNodeSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #_ExtractToTemporary 
				#defaultString: '&Extract to Temporary' 
				#catalogID: #browser) 
			#nameKey: #'Extract to Temporary' 
			#value: #action: 
			#enablementSelector: #hasMessageNodeSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #_InlineAssignedTemporary 
				#defaultString: '&Inline Assigned Temporary' 
				#catalogID: #browser) 
			#nameKey: #'Inline Temporary' 
			#value: #action: 
			#enablementSelector: #hasAssignmentSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #PushVariable_Up 
				#defaultString: 'Push Variable &Up' 
				#catalogID: #browser) 
			#nameKey: #'Push Up Selected Instance Variable' 
			#value: #action: 
			#enablementSelector: #hasInstanceVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #CreateAccessors 
				#defaultString: 'Create Accessors' 
				#catalogID: #browser) 
			#nameKey: #'Create Selected Instance Variable Accessors' 
			#value: #action: 
			#enablementSelector: #hasInstanceVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #MakeVariableA_bstract 
				#defaultString: 'Make Variable A&bstract' 
				#catalogID: #browser) 
			#nameKey: #'Abstract Selected Instance Variable' 
			#value: #action: 
			#enablementSelector: #hasInstanceVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #_ProtectVariable 
				#defaultString: '&Protect Variable' 
				#catalogID: #browser) 
			#nameKey: #'Protect Selected Instance Variable' 
			#value: #action: 
			#enablementSelector: #hasInstanceVariableSelected) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #_ExtractMethod 
				#defaultString: '&Extract Method' 
				#catalogID: #browser) 
			#nameKey: #'Extract Method' 
			#value: #action: 
			#labelImage: #(ResourceRetriever BrowserIcons #extractMethod)) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #ExtractMethodToComponent 
				#defaultString: 'Extract Method to Component' 
				#catalogID: #browser) 
			#nameKey: #'Extract Method to Component' 
			#value: #action:)) #(13 2) nil)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_DoIt 
			#defaultString: '&Do it' 
			#catalogID: #browser) 
		#nameKey: #'Do It' 
		#value: #action: 
		#shortcutKeyCharacter: $d 
		#shortcutModifiers: 2 
		#labelImage: #(ResourceRetriever GeneralIcons #doIt)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Pri_ntIt 
			#defaultString: 'Pri&nt it' 
			#catalogID: #browser) 
		#nameKey: #'Print It' 
		#value: #action: 
		#shortcutKeyCharacter: $p 
		#shortcutModifiers: 2 
		#labelImage: #(ResourceRetriever GeneralIcons #printIt)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_InspectIt 
			#defaultString: '&Inspect it' 
			#catalogID: #browser) 
		#nameKey: #'Inspect It' 
		#value: #action: 
		#shortcutKeyCharacter: $q 
		#shortcutModifiers: 2 
		#labelImage: #(ResourceRetriever GeneralIcons #inspectIt)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_DebugIt 
			#defaultString: '&Debug it' 
			#catalogID: #browser) 
		#nameKey: #'Debug It' 
		#value: #action: 
		#shortcutKeyCharacter: $B 
		#shortcutModifiers: 2 
		#labelImage: #(ResourceRetriever GeneralIcons #debugIt)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Explain 
			#defaultString: 'Explain' 
			#catalogID: #browser) 
		#nameKey: #'Explain Code' 
		#value: #action: 
		#shortcutKeyCharacter: $E 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Cu_t 
			#defaultString: 'Cu&t' 
			#catalogID: #browser) 
		#nameKey: #'Cut Selection' 
		#value: #action: 
		#shortcutKeyCharacter: $X 
		#shortcutModifiers: 2 
		#labelImage: #(ResourceRetriever GeneralIcons #editCut)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_Copy 
			#defaultString: '&Copy' 
			#catalogID: #browser) 
		#nameKey: #'Copy Selection' 
		#value: #action: 
		#shortcutKeyCharacter: $C 
		#shortcutModifiers: 2 
		#labelImage: #(ResourceRetriever GeneralIcons #editCopy)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_Paste 
			#defaultString: '&Paste' 
			#catalogID: #browser) 
		#nameKey: #'Paste Selection' 
		#value: #action: 
		#shortcutKeyCharacter: $V 
		#shortcutModifiers: 2 
		#labelImage: #(ResourceRetriever GeneralIcons #editPaste)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_FindDots 
			#defaultString: '&Find...' 
			#catalogID: #browser) 
		#nameKey: #'Find Text' 
		#value: #action: 
		#shortcutKeyCharacter: $F 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #_ReplaceDots 
			#defaultString: '&Replace...' 
			#catalogID: #browser) 
		#nameKey: #'Replace Text' 
		#value: #action: 
		#shortcutKeyCharacter: $R 
		#shortcutModifiers: 2) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Cancel 
			#defaultString: 'Cancel' 
			#catalogID: #browser) 
		#nameKey: #Cancel 
		#value: #action:)) #(2 9 4 1 3 2 1) nil) decodeAsLiteralArray
]

{ #category : #'instance creation' }
BrowserCodeTool class >> new [
	
	| browser |
	browser := super new.
	PDPManager notifyOnMethodChanged: browser.
	^browser	"Smalltalk Professional Debug Package Version 2.6 (c) 2001 Crafted Smalltalk"
]

{ #category : #'parcel load/unload/save' }
BrowserCodeTool class >> preUnloadActionFor: aParcel [
	
	self allInstances do: [:each | ChangeSet removeDependent: each]
]

{ #category : #autoformat }
BrowserCodeTool class >> saveAutoFormat [
	
	^SaveAutoFormat
]

{ #category : #autoformat }
BrowserCodeTool class >> saveAutoFormat: aBoolean [
	
	SaveAutoFormat := aBoolean
]

{ #category : #'interface specs' }
BrowserCodeTool class >> watchVarSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #watchVarSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #InsertVariableWatch 
				#defaultString: 'Insert Variable Watch' 
				#catalogID: #pdp) 
			#min: #(Point 20 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 720 450 1237 595)) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#layout: #(Rectangle 318 98 407 128) 
				#model: #accept 
				#tabable: false 
				#label: #(UserMessage 
					#key: #OK 
					#defaultString: 'OK' 
					#catalogID: #pdp) 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 419 98 504 128) 
				#model: #cancel 
				#tabable: false 
				#label: #(UserMessage 
					#key: #Cancel 
					#defaultString: 'Cancel' 
					#catalogID: #pdp) 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 143 55 503 82) 
				#model: #wVar 
				#tabable: false 
				#isReadOnly: true) #(ActionButtonSpec 
				#layout: #(Rectangle 9 20 132 49) 
				#model: #TOS 
				#tabable: false 
				#label: #(UserMessage 
					#key: #TopOfStack 
					#defaultString: 'Top of Stack' 
					#catalogID: #pdp) 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 143 19 332 49) 
				#name: #IvarSwitch 
				#model: #iVar 
				#tabable: true 
				#label: #(UserMessage 
					#key: #InstanceVariableDots 
					#defaultString: 'Instance Variable...' 
					#catalogID: #pdp) 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 342 19 503 50) 
				#name: #TempSwitch 
				#model: #tVar 
				#tabable: false 
				#label: #(UserMessage 
					#key: #TempVariableDots 
					#defaultString: 'Temp Variable...' 
					#catalogID: #pdp) 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 14 61) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #WatchC 
					#defaultString: 'Watch:' 
					#catalogID: #pdp)))))
]

{ #category : #accepting }
BrowserCodeTool >> accept: aText from: aController [
	
	modified := nil.
	[self compileMethodText: aText from: aController]
		ensure: [modified := false]
]

{ #category : #menu }
BrowserCodeTool >> addAttribute [
	
	<menuItem: 'attribute' nameKey: #addAttribute enablement:
			#inheritsFromCormasPackage indication: nil menu:
			#(#mainMenu #addAttributeMenu) position: 1.1>
	(AttributeAdder new)
		targetClass: self selectedClass;
		addAttribut
]

{ #category : #menu }
BrowserCodeTool >> addAttributeMenu [
	
	<submenu: 'Add attribute' nameKey: #addAttributeMenu menu: #(#mainMenu)
		position: 1.2>
	
]

{ #category : #probes }
BrowserCodeTool >> addBreakpoint [
	
	self addBreakpoint: CodeProbe new
]

{ #category : #probes }
BrowserCodeTool >> addBreakpoint: aProbe [
	
	| probedMethod unprobedMethod aController |
	aController := self textController.
	unprobedMethod := self selectedMethod.
	probedMethod := unprobedMethod newFullProbedMethod.
	probedMethod ifNil: [^self].
	PDPManager debugActive
		ifFalse:
			[Transcript show: #ProbesAreDisabled << #pdp >> 'Probes are disabled'].
	aProbe record: (probedMethod probeRecordFor: aController selectionRange).
	probedMethod addProbe: aProbe.
	aProbe unconditionallyInsertInto: probedMethod replacing: unprobedMethod
]

{ #category : #probes }
BrowserCodeTool >> addBreakpointItem [
	
	<itemInMenu: #(#mainMenu) position: 25.10>
	^(MenuItem labeled: #InsertBreakpoint << #pdp >> 'Insert Breakpoint')
		enablement: #areProbeCommandsLegal;
		value: [self addBreakpoint];
		labelImage: CodeProbe breakpointGlyph
]

{ #category : #menu }
BrowserCodeTool >> addClassVariable [
	
	<menuItem: 'class variable' nameKey: #addClassVariable enablement:
			#inheritsFromCormasPackage indication: nil menu:
			#(#mainMenu #addAttributeMenu) position: 1.2>
	(AttributeAdder new)
		targetClass: self selectedClass;
		addClassVariable
]

{ #category : #'interface opening' }
BrowserCodeTool >> addCodeHighlighter [
	"(Highlighter Extension - private - not for general use - may be removed at any time)

	 If highlighting is enabled for the receiver, add a code highlighter."
	
	<highlighter>
	self class environment == Browser
		ifTrue:
			[CodeHighlighter
				on: self textController
				for: self]
]

{ #category : #menu }
BrowserCodeTool >> addCormasUtilsToMenuBuilder: mb [
	
	| classes mb2 |
	mb beginSubMenuLabeled: 'Cormas Utils'.
	classes := Array with: Cormas class.
	mb2 := self addPublicMethodsOfClasses: classes toMenuBuilder: mb
		withSuffix: #Cormas.
	mb2 endSubMenu.
	^mb2
]

{ #category : #menu }
BrowserCodeTool >> addEntityClassMethodsToMenuBuilder: mb [
	
	| classes mb2 |
	mb beginSubMenuLabeled: 'Class methods'.
	classes := Array with: CMEntity class.
	mb2 := self addPublicMethodsOfClasses: classes toMenuBuilder: mb
		withSuffix: 'self class'.
	mb2 endSubMenu.
	^mb2
]

{ #category : #menu }
BrowserCodeTool >> addEntityMethodsToMenuBuilder: mb [
	
	| classes mb2 |
	mb beginSubMenuLabeled: 'Entity methods'.
	classes := (self selectedClass superClassesUntil: CMEntity)
		select: [:aClass | aClass environment fullName = 'CormasNS.Kernel'].
	mb2 := self addPublicMethodsOfClasses: classes toMenuBuilder: mb
		withSuffix: 'self'.
	mb2 endSubMenu.
	^mb2
]

{ #category : #menu }
BrowserCodeTool >> addModelClassMethodsToMenuBuilder: mb [
	
	| classes mb2 |
	mb beginSubMenuLabeled: 'Class methods'.
	classes := Array with: CormasModelOld class.
	mb2 := self addPublicMethodsOfClasses: classes toMenuBuilder: mb
		withSuffix: 'self class'.
	mb2 endSubMenu.
	^mb2
]

{ #category : #menu }
BrowserCodeTool >> addModelMethodsToMenuBuilder: mb [
	
	| classes mb2 |
	mb beginSubMenuLabeled: 'Model methods'.
	classes := Array with: CMAbstractModel.
	mb2 := self addPublicMethodsOfClasses: classes toMenuBuilder: mb
		withSuffix: 'self'.
	mb2 endSubMenu.
	^mb2
]

{ #category : #probes }
BrowserCodeTool >> addOneshotBreakpoint [
	
	self addBreakpoint: OneshotProbe new
]

{ #category : #probes }
BrowserCodeTool >> addOneshotBreakpointItem [
	
	<itemInMenu: #(#mainMenu) position: 25.15>
	^(MenuItem
		labeled: #NewOneShotBreakpoint << #pdp >> 'Insert Oneshot Breakpoint')
		value: [self addOneshotBreakpoint];
		enablement: #areProbeCommandsLegal;
		labelImage: OneshotProbe breakpointGlyph
]

{ #category : #probes }
BrowserCodeTool >> addProbe [
	
	<menuItem: #(#InsertProbeDots #pdp 'Insert Probe...') nameKey: nil
		enablement: #areProbeCommandsLegal indication: nil menu: #(#mainMenu)
		position: 25.2>
	| probedMethod unprobedMethod probe probeSpec aController |
	aController := self textController.
	self selector isNil
		ifTrue:
			[^Dialog
				warn:
					#InsertProbeValidWhenMethodSelected << #pdp >>
							'The "insert probe" operation is only
valid when a method is selected.'].
	aController textHasChanged
		ifTrue:
			[^Dialog
				warn:
					(#ProbeCannotBeInsertedSourceChanged << #pdp >>
							'A probe cannot be inserted because<1s>     the source code has changed.'
						expandMacrosWith: (String with: Character cr))].
	probeSpec := CodeProbe selectBrowserProbeType.
	probeSpec == nil ifTrue: [^nil].
	unprobedMethod := self selectedMethod.
	probedMethod := unprobedMethod newFullProbedMethod.
	probedMethod isNil ifTrue: [^self].
	PDPManager debugActive
		ifFalse:
			[PDPTransientWarning
				on: #ProbesAreDisabled << #pdp >> 'Probes are disabled'].
	probe := self
		makeProbeTyped: probeSpec probeClass
		using: nil
		at: aController selectionRange
		method: probedMethod.
	probe isNil ifTrue: [^self].
	probedMethod addProbe: probe.
	probe makeConditional: probeSpec replacing: unprobedMethod with:
			probedMethod
]

{ #category : #menu }
BrowserCodeTool >> addPublicMethodsOfClasses: aSetOfClasses toMenuBuilder: mb withSuffix: aString [
	
	| dicoM protocolExactName |
	dicoM := Dictionary new.
	aSetOfClasses
		do:
			[:aClass | 
			aClass organization categories
				do:
					[:protocolName | 
					((protocolName asString findString: '+ ' startingAt: 1) = 1
						or: [(protocolName asString findString: '* ' startingAt: 1) = 1])
						ifTrue:
							[protocolExactName := protocolName
								copyFrom: 3
								to: protocolName size.
							(dicoM includesKey: protocolExactName)
								ifFalse:
									[dicoM
										at: protocolExactName
										put: Set new].
							(aClass organization listAtCategoryNamed: protocolName)
								do:
									[:aSelector | 
									(dicoM at: protocolExactName)
										add: (Cormas headerOfMethod: aSelector class: aClass)]]]].
	dicoM keys asSortedCollection
		do:
			[:aProtocol | 
			mb beginSubMenuLabeled: aProtocol.
			(dicoM at: aProtocol) asSortedCollection
				do:
					[:aM | 
					mb
						add:
							aM
								->
									[self textController
										insertAndSelect: aString , ' ' , aM asString
										at: self textController selectionStopIndex]].
			mb endSubMenu].
	^mb
]

{ #category : #menu }
BrowserCodeTool >> addUndefinedMethod [
	
	| node newString targetClass |
	self updateRequest ifFalse: [^self].
	node := self findPotentialMNU.
	newString := self newMethodPatternFrom: node.
	targetClass := node receiver
		messageSearchClassFromScope: self selectedClass.
	targetClass == self selectedClass
		ifFalse: [self navigator selectClass: targetClass].
	self text: newString.
	self textController selectAt: newString size + 2
]

{ #category : #menu }
BrowserCodeTool >> addUndefinedMethodItem [
	
	<itemInMenu: #(#mainMenu) position: 20.01>
	^(MenuItem labeled: #AddMethod >> 'Add Method' << #browser)
		value: [self addUndefinedMethod];
		visible: [self findPotentialMNU notNil]
]

{ #category : #probes }
BrowserCodeTool >> allMethodProbes [
	"Return all probes in the current method, regardless of selection status."
	
	| probedMethod probes |
	probedMethod := self selectedMethod.
	probedMethod isProbed ifFalse: [^#()].
	probes := OrderedCollection new.
	probedMethod allProbesDo: [:each | probes add: each].
	^probes
]

{ #category : #probes }
BrowserCodeTool >> areProbeCommandsLegal [
	
	^self selectors size = 1 and: [self textController textHasChanged not]
]

{ #category : #probes }
BrowserCodeTool >> basicReinsertProbesAndIndices: probesAndIndices into: probedMethod [
	
	| probesInError |
	probesInError := OrderedCollection new.
	probesAndIndices
		do:
			[:ac | 
			| probe index newRecord |
			probe := ac key baseParent copy.
			index := ac value.
			newRecord := probedMethod probeRecordFor: (index to: index).
			probe record: newRecord.
			(probe updateTempVarIndexForMethod: probedMethod)
				ifTrue: [probedMethod addProbe: probe]
				ifFalse:
					[newRecord updateMethod: probedMethod.	"update mclass and selector for reporting"
					probesInError add: probe]].
	probesInError addAll: probedMethod recompileProbes.
	ProbedCompiledMethod reportOnFailedProbes: probesInError
]

{ #category : #probes }
BrowserCodeTool >> basicRemoveProbe: aProbe [
	
	| probedMethod replacementMethod |
	probedMethod := self selectedMethod.
	probedMethod totalProbes = 1 ifTrue: [^probedMethod revert].
	replacementMethod := probedMethod newFullProbedMethod.
	replacementMethod removeProbe: aProbe.
	probedMethod mclass
		addSelector: self selector
		withMethod: replacementMethod
]

{ #category : #'temporary variables' }
BrowserCodeTool >> bindTight [
	
	| node |
	node := self findNode.
	(node isNil or: [node isVariable not])
		ifTrue:
			[^self warn: #CouldNotFindTheNode << #browser >> 'Could not find the node'].
	self
		performRefactoring:
			(self
				preloadSourceTree:
					(MoveVariableDefinitionRefactoring
						bindTight: (self convertToSourceInterval: node sourceInterval)
						in: self methodClass
						selector: self selector))
]

{ #category : #'global variables' }
BrowserCodeTool >> browseReferencesToGlobal [
	
	| binding |
	binding := self selectedVariableBinding.
	self navigator browseGlobalReferencesTo: binding
]

{ #category : #testing }
BrowserCodeTool >> canExtractMethod [
	
	^self isEditing not and: [self isTextSelected]
]

{ #category : #testing }
BrowserCodeTool >> canExtractToTemporary [
	
	^self isEditing not
		and:
			[| node |
			node := self findNode.
			node notNil and: [node isValue]]
]

{ #category : #testing }
BrowserCodeTool >> canPerformInlineAssignmentRefactoring [
	
	^self isEditing not and: [self hasAssignmentSelected]
]

{ #category : #testing }
BrowserCodeTool >> canPerformParameterRefactorings [
	
	^self isEditing not and: [self hasParameterSelected]
]

{ #category : #testing }
BrowserCodeTool >> canPerformTemporaryVariableRefactorings [
	
	^self isEditing not and: [self hasTemporaryVariableSelected]
]

{ #category : #probes }
BrowserCodeTool >> changedMethodFrom: oldMethod to: newMethod by: aBrowser [
	"This message notifies the receiver that the method text for
	aSelector has changed and should be updated."
	
	| widget |
	builder isNil ifTrue: [^self].
	widget := builder componentAt: #textEditor.
	widget isNil ifTrue: [^self].
	widget isOpen ifFalse: [^self].
	(newMethod selector == self selector
		and: [newMethod mclass == self methodClass]) ifFalse: [^self].
	(aBrowser ~~ self and: [self isEditing])
		ifTrue: [self textNoChange: self text allItalic]
		ifFalse: [self updateContents]
]

{ #category : #private }
BrowserCodeTool >> convertToSourceInterval: anInterval [
	"Convert the selected interval from our text widget, to the interval in the stored source code.
	For this widget, we don't need to do anything."
	
	^anInterval
]

{ #category : #menu }
BrowserCodeTool >> cormasMethodsMenu [
	
	<computedSubmenu: 'Insert method' nameKey: #cormasMethodsMenu menu:
			#(#mainMenu) position: 1.1>
	| mb |
	mb := MenuBuilder new.
	(codeModel navigator isNil not
		and: [self isActive and: [self selectedClass inheritsFrom: CMEntity]])
		ifTrue:
			[mb := self addEntityMethodsToMenuBuilder: mb.
			mb := self addEntityClassMethodsToMenuBuilder: mb].
	(codeModel navigator isNil not
		and: [self isActive and: [self selectedClass inheritsFrom: CormasModelOld]])
		ifTrue:
			[mb := self addModelMethodsToMenuBuilder: mb.
			mb := self addModelClassMethodsToMenuBuilder: mb].
	mb := self addCormasUtilsToMenuBuilder: mb.
	^mb menu
]

{ #category : #'temporary variables' }
BrowserCodeTool >> createInstVar [
	
	| node |
	node := self findNode.
	(node isNil or: [node isVariable not])
		ifTrue:
			[^self warn: #CouldNotFindTheNode << #browser >> 'Could not find the node'].
	self
		performRefactoring:
			(TemporaryToInstanceVariableRefactoring
				class: self methodClass
				selector: self selector
				variable: node name)
]

{ #category : #refactorings }
BrowserCodeTool >> extractMethod [
	
	self updateRequest ifFalse: [^self].
	self
		performRefactoring:
			(self
				preloadSourceTree:
					(ExtractMethodRefactoring
						extract: (self convertToSourceInterval: self selectedInterval)
						from: self selector
						in: self methodClass))
]

{ #category : #refactorings }
BrowserCodeTool >> extractToComponent [
	
	self updateRequest ifFalse: [^self].
	self
		performRefactoring:
			(self
				preloadSourceTree:
					(ExtractMethodToComponentRefactoring
						extract: (self convertToSourceInterval: self selectedInterval)
						from: self selector
						in: self methodClass))
]

{ #category : #refactorings }
BrowserCodeTool >> extractToTemp [
	
	| newName node |
	self updateRequest ifFalse: [^self].
	node := self findNode.
	(node isNil or: [node isValue not])
		ifTrue:
			[^self warn: #CouldNotFindTheNode << #browser >> 'Could not find the node'].
	newName := self
		request:
			#EnterNameForTemporaryC << #browser >> 'Enter name forTemporary:'.
	newName isEmpty ifTrue: [^self].
	self
		performRefactoring:
			(self
				preloadSourceTree:
					(ExtractToTemporaryRefactoring
						extract: (self convertToSourceInterval: node sourceInterval)
						to: newName
						from: self selector
						in: self methodClass))
]

{ #category : #testing }
BrowserCodeTool >> findPotentialMNU [
	
	| node |
	node := self findNode ifNil: [^nil].
	^node findPotentialMNUFor: self selectedClass
]

{ #category : #probes }
BrowserCodeTool >> findSelectedProbeEmphasisIn: aText from: aController [
	
	^PDPManager
		findSelectedProbeEmphasisIn:
			(aText
				copyFrom: aController selectionStartIndex
				to: aController selectionStopIndex + 1)
]

{ #category : #accepting }
BrowserCodeTool >> format [
	
	| newText node |
	node := RBParser
		parseMethod: self textController text
		onError: [:aString :position | ^self insertError: aString at: position].
	newText := (self formattedNode: node) asText.
	newText makeSelectorBoldIn: self methodClass.
	self textNoChange: newText
]

{ #category : #updating }
BrowserCodeTool >> formatSource: aCharacterArray for: aCompiledMethod [
	
	| text |
	text := aCharacterArray.
	BrowseAutoFormat == true ifTrue: [text := self formattedText: text].
	text := text asText makeSelectorBoldIn: self methodClass.
	aCompiledMethod isProbed ifTrue: [aCompiledMethod highlightProbesIn: text].
	text addHyperlinkEmphases.
	^text
]

{ #category : #updating }
BrowserCodeTool >> formattedNode: anRBProgramNode [
	
	| formatter |
	formatter := anRBProgramNode formatterClass new.
	(self textController notNil and: [formatter respondsTo: #lineLengthLimit:])
		ifTrue:
			[formatter
				lineLengthLimit:
					self textController view bounds width
						// (self textController view graphicsContext widthOfString: 'M')].
	^formatter format: anRBProgramNode
]

{ #category : #updating }
BrowserCodeTool >> formattedText: aText [
	
	| node |
	[node := RBParser parseMethod: aText]
		on: Error
		do:
			[:ex | 
			InputState default altDown ifTrue: [ex pass].
			Transcript
				show: 'Browse auto format errror: ' , ex errorString;
				cr.
			^aText].
	^self formattedNode: node
]

{ #category : #testing }
BrowserCodeTool >> hasInstanceVariableSelected [
	
	^super hasInstanceVariableSelected
		and: [self hasTemporaryVariableSelected not]
]

{ #category : #'interface opening' }
BrowserCodeTool >> highlight: aText from: aHighlighter [
	
	^CodeHighlightingParser
		formatMethod: aText
		forClass: self selectedClass
		namespace: self doItEnvironment
]

{ #category : #menu }
BrowserCodeTool >> inheritsFromCormasPackage [
	
	| aClass |
	aClass := self selectedClass.
	^(aClass inheritsFrom: CMEntity) or: [aClass inheritsFrom: CormasModelOld]
]

{ #category : #'initialize-release' }
BrowserCodeTool >> initialize [
	
	super initialize.
	ChangeSet addDependent: self.
	modified := false
]

{ #category : #messages }
BrowserCodeTool >> inlineMethod [
	
	| node |
	node := self findNode.
	(node isNil or: [node isMessage not])
		ifTrue:
			[^self
				warn:
					#CouldNotFindMessageSend << #browser >> 'Could not find message send'].
	(node receiver isVariable
		and: [#('self' 'super') includes: node receiver name])
		ifTrue:
			[self
				performRefactoring:
					(self
						preloadSourceTree:
							(InlineMethodRefactoring
								inline: (self convertToSourceInterval: node sourceInterval)
								inMethod: self selector
								forClass: self methodClass))]
		ifFalse:
			[self
				performRefactoring:
					(self
						preloadSourceTree:
							(InlineMethodFromComponentRefactoring
								inline: (self convertToSourceInterval: node sourceInterval)
								inMethod: self selector
								forClass: self methodClass))]
]

{ #category : #'temporary variables' }
BrowserCodeTool >> inlineParameter [
	
	| node |
	node := self findNode.
	(node isNil or: [node isVariable not])
		ifTrue:
			[^self warn: #CouldNotFindTheNode << #browser >> 'Could not find the node'].
	self
		handleError:
			[| ref |
			ref := InlineParameterRefactoring
				inlineParameter: node name
				in: self methodClass
				selector: self selector.
			ref execute.
			codeModel setSelector: ref newSelector]
]

{ #category : #refactorings }
BrowserCodeTool >> inlineTemporary [
	
	| node |
	self updateRequest ifFalse: [^self].
	node := self findNode.
	(node isNil or: [node isAssignment not])
		ifTrue:
			[^self warn: #CouldNotFindTheNode << #browser >> 'Could not find the node'].
	self
		performRefactoring:
			(self
				preloadSourceTree:
					(InlineTemporaryRefactoring
						inline: (self convertToSourceInterval: node sourceInterval)
						from: self selector
						in: self methodClass))
]

{ #category : #'autocomplete extension' }
BrowserCodeTool >> instVarSearchFor: aParagraphEditor [
	
	^self classOrNameSpace
		ifNotNil:
			[:targetClass | InstanceVariableSearch targetClass: targetClass]
]

{ #category : #'tab APIs' }
BrowserCodeTool >> isActive [
	
	^codeModel state notNil
		and:
			[codeModel selector notNil
				or: [codeModel protocol notNil and: [codeModel isData not]]]
]

{ #category : #private }
BrowserCodeTool >> isMethod [
	
	^true
]

{ #category : #'autocomplete extension' }
BrowserCodeTool >> knownReceiverSearchFor: aParagraphEditor [
	
	| word browsedClass |
	browsedClass := self classOrNameSpace.
	browsedClass isBehavior ifFalse: [^nil].
	word := self previousWord: aParagraphEditor.
	word = 'self' ifTrue: [^BehaviorSelectorSearch behavior: browsedClass].
	word = 'super'
		ifTrue: [^BehaviorSelectorSearch behavior: browsedClass superclass].	"we pre match nil as a distinguished keyword, rather than get confused in the following branch by a nil return from the compiler evaluate."
	word = 'nil' ifTrue: [^BehaviorSelectorSearch behavior: UndefinedObject].
	^([Compiler
		evaluate: word
		for: browsedClass
		in: browsedClass environment
		notifying: nil
		logged: false]
		on: Error
		do: [nil])
		ifNotNil: [:object | BehaviorSelectorSearch behavior: object class]
]

{ #category : #probes }
BrowserCodeTool >> makeProbeTyped: probeType using: aProbeRecord at: selectionRange method: probedMethod [
	"Prompts the user to select a probe and returns an Association where the key is the probe
	and the value is the conditional flag."
	
	| probe probeRecord |
	probeRecord := aProbeRecord isNil
		ifTrue: [probedMethod probeRecordFor: selectionRange]
		ifFalse: [aProbeRecord].
	probeType == #Breakpoint ifTrue: [probe := CodeProbe new].
	probeType == #Variable
		ifTrue:
			[probe := self
				promptForProbeVariableClass: self selectedClass
				method: probedMethod
				record: probeRecord.
			probe isNil ifTrue: [^nil]].
	probeType == #Expression ifTrue: [probe := DisplayActionProbe new].
	probe record: probeRecord.
	^probe
]

{ #category : #private }
BrowserCodeTool >> modifiedTextColor [
	
	^ColorValue red
]

{ #category : #probes }
BrowserCodeTool >> modifyProbe [
	
	| probedMethod candidates selectedText |
	probedMethod := self selectedMethod.
	selectedText := self textController text
		copyFrom: self textController selectionStartIndex
		to: self textController selectionStopIndex + 1.
	candidates := self probesInText: selectedText.
	candidates isEmpty
		ifTrue: [candidates := self probesInText: self textController text].
	candidates first modifyIn: probedMethod
]

{ #category : #probes }
BrowserCodeTool >> modifyProbeItem [
	
	<itemInMenu: #(#mainMenu) position: 25.3>
	^(MenuItem labeled: #EditProbeDots >> 'Edit Probe...' << #pdp)
		value: [self modifyProbe];
		enablement:
				[self areProbeCommandsLegal and: [self selectedMethod isProbed]]
]

{ #category : #'global variables' }
BrowserCodeTool >> navigateToClass [
	
	| binding |
	binding := self selectedVariableBinding.
	binding ifNil: [^self].
	(self updateRequest and: [self changeRequest]) ifFalse: [^self].
	codeModel setBinding: binding
]

{ #category : #private }
BrowserCodeTool >> newMethodPatternFrom: node [
	
	| argName ws |
	ws := String new writeStream.
	argName := 'anObject'.
	node
		selectorPartsDo: [:selectorPart | ws nextPutAll: selectorPart value]
		argumentsDo:
			[:argument | 
			ws space.
			argument isVariable
				ifTrue: [ws nextPutAll: argument name]
				ifFalse:
					[ws nextPutAll: argName.
					(argName anySatisfy: #isDigit)
						ifTrue:
							[argName := (argName reject: #isDigit)
								, ((argName select: #isDigit) asNumber + 1) printString]
						ifFalse: [argName := 'anObject2']].
			ws space].
	^self formattedText: ws contents
]

{ #category : #'global variables' }
BrowserCodeTool >> openBrowserForClass [
	
	| binding |
	binding := self selectedVariableBinding.
	binding isNil ifTrue: [^self].
	(RefactoringBrowser open navigator)
		setBinding: binding;
		changed
]

{ #category : #'interface opening' }
BrowserCodeTool >> postBuildWith: aBuilder [
	
	super postBuildWith: aBuilder.
	initialLookPrefs := (builder componentAt: #textEditor) lookPreferences.
	self updateTextWidget.
	self textController doNotHandleLocally: #explain
]

{ #category : #refactorings }
BrowserCodeTool >> preloadSourceTree: aRefactoring [
	"Some refactorings which take source intervals may be sensitive to the fact the source in the browser is not the same format as found in the method. When such is the case, we preload the sourceTree into the refactoring, otherwise let the refactorings fetch it at will."
	
	BrowseAutoFormat == true
		ifTrue: [aRefactoring sourceTree: (self parseSource: self text asString)].
	^aRefactoring
]

{ #category : #'autocomplete extension' }
BrowserCodeTool >> previousWord: aParagraphEditor [
	
	| rs mark |
	rs := (aParagraphEditor text
		first: aParagraphEditor selectionStartIndex - 1) asString reverse
		readStream.
	rs skipWhile: [:char | char isAlphaNumeric].
	rs skipWhile: [:char | char isAlphaNumeric not].
	mark := rs position + 1.
	rs skipWhile: [:char | char = $. or: [char isAlphaNumeric]].
	^(rs collection
		copyFrom: mark
		to: rs position) reverse
]

{ #category : #probes }
BrowserCodeTool >> probesInText: aText [
	"Find all the probes embedded in the emphases of aText. Sort them by their distance from the current insertion point since every user of this so far has wanted that."
	
	| probes searchBlock |
	probes := OrderedCollection new.
	searchBlock := [:emphasis | emphasis class == ProbeCharacterStyle ifTrue: [probes add: emphasis value]].
	aText runs values
		do:
			[:value | 
			(value isKindOf: Array)
				ifTrue: [value do: [:obj | searchBlock value: obj]]
				ifFalse: [searchBlock value: value]].
	probes
		sort:
			[:a :b | 
			(a characterIndex - self textController selectionStartIndex) abs
				< (b characterIndex - self textController selectionStartIndex)].
	^probes
]

{ #category : #probes }
BrowserCodeTool >> probesNearCursor [
	"Return all probes that are near the cursor (when nothing is selected), where 'near' is defined as within 7 characters of the position either way. If we have multiple, only return the closest."
	
	| probes nearCursorText |
	self textController hasRangeSelection ifTrue: [^#()].
	nearCursorText := self textController text
		copyFrom: (self textController selectionStartIndex - 7 max: 1)
		to:
			(self textController selectionStopIndex + 7
				min: self textController text size).
	probes := self probesInText: nearCursorText.
	probes
		sort:
			[:a :b | 
			(a characterIndex - self textController selectionStartIndex) abs
				< (b characterIndex - self textController selectionStartIndex)].
	^probes isEmpty
		ifTrue: [probes]
		ifFalse: [probes first: 1]
]

{ #category : #probes }
BrowserCodeTool >> probesToActUpon [
	
	| probedMethod victims |
	probedMethod := self selectedMethod.
	probedMethod isProbed ifFalse: [^#()].	"Give precedence to selected probes"
	victims := self selectedProbes.
	victims isEmpty ifFalse: [^victims].	"If we have no selection, give probes *near* the cursor a chance, choose the closest."
	victims := self probesNearCursor.
	victims isEmpty ifFalse: [^victims].	"OK, just return 'em all then."
	^self allMethodProbes
]

{ #category : #probes }
BrowserCodeTool >> promptForProbeVariableClass: aClass method: probedMethod record: probeRecord [
	"Prompts the user to select a probe and returns an Association where the key is the probe
	and the value is the conditional flag."
	
	| legalTempNames legalTemps ivarNames dialog aBuilder ivar tmpVar windoe wVar varType |
	windoe := self interfaceWindow.
	wVar := ValueHolder newString.
	legalTemps := OrderedCollection new.
	(probedMethod variableMapAt: probeRecord blockMethodIndex) temps
		do:
			[:var | 
			(var key first == $.
				or: [legalTemps contains: [:lvar | lvar key = var key]])
				ifFalse: [legalTemps add: var]].
	legalTempNames := legalTemps collect: [:ac | ac key].
	ivarNames := aClass allInstVarNames.
	dialog := SimpleDialog new.
	dialog initializeBuilderFor: windoe.
	aBuilder := dialog builder.
	aBuilder
		aspectAt: #TOS
		put:
			[varType := #tos.
			wVar value: 'Top of Stack'].
	aBuilder
		aspectAt: #iVar
		put:
			[ivar := (Menu labelArray: ivarNames values: ivarNames) startUp.
			ivar ~~ 0
				ifTrue:
					[wVar value: ivar.
					varType := #inst]].
	aBuilder
		aspectAt: #tVar
		put:
			[tmpVar := (Menu labelArray: legalTempNames values: legalTemps) startUp.
			tmpVar ~~ 0
				ifTrue:
					[wVar value: tmpVar key.
					varType := #tmp]].
	aBuilder aspectAt: #wVar put: wVar.
	dialog builder add: (UISpecification from: self class watchVarSpec).
	dialog initializeWindowFor: windoe.
	ivarNames isEmpty ifTrue: [(aBuilder componentAt: #IvarSwitch) disable].
	legalTemps isEmpty ifTrue: [(aBuilder componentAt: #TempSwitch) disable].
	dialog preOpen.
	dialog builder
		openDialogWithExtent: dialog builder window displayBox extent.
	dialog accept value ifFalse: [^nil].
	varType == nil ifTrue: [^nil].
	varType == #tos ifTrue: [^DisplayTOSProbe new].
	varType == #inst
		ifTrue:
			[^DisplayInstanceVarProbe
				name: ivar
				index: (ivarNames indexOf: ivar)].
	^DisplayMethodVarProbe slot: tmpVar
]

{ #category : #accepting }
BrowserCodeTool >> protocol [
	
	| protocol definition |
	protocol := super protocol.
	^(protocol isNil and: [(definition := self definition) notNil])
		ifTrue: [definition protocol]
		ifFalse: [protocol]
]

{ #category : #probes }
BrowserCodeTool >> rearmOneshotProbes [
	
	self probesToActUpon do: [:each | each isOneshot ifTrue: [each rearm]].
	self updateContents
]

{ #category : #probes }
BrowserCodeTool >> rearmOneshotProbesItem [
	
	<itemInMenu: #(#mainMenu) position: 25.16>
	^(MenuItem labeled: #RearmProbes >> 'Rearm Oneshot Probes' << #pdp)
		value: [self rearmOneshotProbes];
		visible:
				[self areProbeCommandsLegal
						and:
							[self probesToActUpon
								anySatisfy: [:each | each isOneshot and: [each isArmed not]]]]
]

{ #category : #'initialize-release' }
BrowserCodeTool >> release [
	
	ChangeSet removeDependent: self.
	builder := nil.
	super release
]

{ #category : #'temporary variables' }
BrowserCodeTool >> removeParameter [
	
	| node |
	node := self findNode.
	(node isNil or: [node isVariable not])
		ifTrue:
			[^self warn: #CouldNotFindTheNode << #browser >> 'Could not find the node'].
	self
		handleError:
			[| ref |
			ref := RemoveParameterRefactoring
				removeParameter: node name
				in: self methodClass
				selector: self selector.
			ref execute.
			codeModel setSelector: ref newSelector]
]

{ #category : #probes }
BrowserCodeTool >> removeProbe [
	
	| victims probedMethod |
	probedMethod := self selectedMethod.
	victims := self probesToActUpon.
	victims do: [:each | self basicRemoveProbe: each].	"The following is necessary because apparently the method cache is not completely flushed."
	ObjectMemory garbageCollect.
	PDPManager changedMethodFrom: probedMethod to: probedMethod by: self
]

{ #category : #probes }
BrowserCodeTool >> removeProbeItem [
	
	<itemInMenu: #(#mainMenu) position: 25.4>
	^(MenuItem labeled: #RemoveProbe >> 'Remove Probe' << #pdp)
		value: [self removeProbe];
		visible:
				[self areProbeCommandsLegal and: [self probesToActUpon size = 1]]
]

{ #category : #probes }
BrowserCodeTool >> removeProbesItem [
	
	<itemInMenu: #(#mainMenu) position: 25.4>
	^(MenuItem labeled: #RemoveProbes >> 'Remove Probes' << #pdp)
		value: [self removeProbe];
		visible:
				[self areProbeCommandsLegal and: [self probesToActUpon size > 1]]
]

{ #category : #menu }
BrowserCodeTool >> renameInstanceVariableMenuItem [
	
	<itemInMenu: #(#mainMenu #refactorMenu) position: 10>
	^(MenuItem
		labeled: #Re_nameVariableAsDots << #IDE >> 'Re&name Variable As...')
		visible: [self hasInstanceVariableSelected];
		value: #renameInstanceVariable;
		enablement: #hasInstanceVariableSelected;
		shortcutKeyCharacter: $N;
		shortcutModifiers: 3;
		yourself
]

{ #category : #'temporary variables' }
BrowserCodeTool >> renameTemporary [
	
	| newName node |
	node := self findNode.
	(node isNil or: [node isVariable not])
		ifTrue:
			[^self warn: #CouldNotFindTheNode << #browser >> 'Could not find the node'].
	newName := self
		request: #EnterNewNameC << #browser >> 'Enter new name:'
		initialAnswer: node name.
	newName isEmpty ifTrue: [^self].
	self
		performRefactoring:
			(self
				preloadSourceTree:
					(RenameTemporaryRefactoring
						renameTemporaryFrom:
							(self convertToSourceInterval: node sourceInterval)
						to: newName
						in: self methodClass
						selector: self selector))
]

{ #category : #probes }
BrowserCodeTool >> selectedMethod [
	
	^self methodClass compiledMethodAt: self selector
]

{ #category : #probes }
BrowserCodeTool >> selectedProbes [
	"Return all probes in the current selection."
	
	| selectedText |
	self textController hasRangeSelection ifFalse: [^#()].
	selectedText := self textController text
		copyFrom: self textController selectionStartIndex
		to: self textController selectionStopIndex + 1.
	^self probesInText: selectedText
]

{ #category : #'global variables' }
BrowserCodeTool >> selectedVariableBinding [
	
	| name |
	name := self selectedVariableName.
	name isNil ifTrue: [^nil].
	^(name includes: $.)
		ifTrue: [name asQualifiedReference bindingOrNil]
		ifFalse: [self nameSpace bindingFor: name asSymbol]
]

{ #category : #'instance variables' }
BrowserCodeTool >> selectedVariableName [
	
	| node |
	node := self findNode.
	^(node notNil and: [node isVariable])
		ifTrue: [node name]
		ifFalse: [nil]
]

{ #category : #'tab APIs' }
BrowserCodeTool >> tabName [
	
	^#Source << #browser
]

{ #category : #'interface opening' }
BrowserCodeTool >> unhighlight: aText from: aHighlighter [
	
	^aText
		addEmphasis: #()
		removeEmphasis: StyleDescription codeNames
		allowDuplicates: false
]

{ #category : #updating }
BrowserCodeTool >> update: anAspectSymbol with: aParameter from: aSender [
	
	(#(#removeSelector:class: #changeSelector:class: #addSelector:class: #changeSelector:class:attributes: #addSelector:class:attributes:)
		includes: anAspectSymbol)
		ifTrue:
			[modified isNil ifTrue: [^self].	"We're making the modification so don't update the display"
			(aParameter first = self selector
				and: [(aParameter at: 2) = self methodClass])
				ifTrue:
					[modified := true.
					self updateTextWidget]]
		ifFalse: [super update: anAspectSymbol with: aParameter from: aSender]
]

{ #category : #updating }
BrowserCodeTool >> updateContents [
	
	| compiledMethod source text |
	modified := false.
	self updateTextWidget.
	(self selectors size > 1 or: [self selectedClass isNil])
		ifTrue: [^self text: ''].
	self selector isNil
		ifTrue: [^self text: self selectedClass sourceCodeTemplate asText].
	compiledMethod := self methodClass
		compiledMethodAt: self selector
		ifAbsent:
			[self warn: #MethodHasBeenRemoved << #pdp >> 'Method has been removed'.
			^self text: ''].
	source := self methodClass
		sourceCodeForMethod: compiledMethod
		at: self selector.
	text := self formatSource: source for: compiledMethod.
	self text: text.
	self updateSelection
]

{ #category : #updating }
BrowserCodeTool >> updateDisplay [
	
	super updateDisplay.
	self isEditing ifFalse: [self updateSelection]
]

{ #category : #private }
BrowserCodeTool >> updateSelection [
	
	| interval |
	interval := self environment selectionIntervalFor: self text.
	interval isNil ifTrue: [^self].
	self
		selectFrom: interval first
		to: interval last
]

{ #category : #private }
BrowserCodeTool >> updateTextWidget [
	
	| widget prefs |
	builder isNil ifTrue: [^self].
	widget := builder componentAt: #textEditor.
	widget isNil ifTrue: [^self].
	modified
		= (widget lookPreferences foregroundColor = self modifiedTextColor)
		ifTrue: [^self].
	prefs := modified
		ifTrue: [initialLookPrefs copy foregroundColor: self modifiedTextColor]
		ifFalse: [initialLookPrefs].
	widget lookPreferences: prefs
]

{ #category : #'autocomplete extension' }
BrowserCodeTool >> wordCompletionSearchFor: aParagraphEditor [
	
	| composite |
	composite := CompositeWordSearch new.
	composite addSearch: (ParagraphSearch for: aParagraphEditor text asString).
	(self instVarSearchFor: aParagraphEditor)
		ifNotNil: [:search | composite addSearch: search].
	composite
		addSearch:
			((self knownReceiverSearchFor: aParagraphEditor)
				ifNil: [SymbolTableSearch new]).
	^composite
]
