Class {
	#name : #TransitionEditor,
	#superclass : #Object,
	#instVars : [
		'transition',
		'eventType',
		'figureList',
		'charactersHolder',
		'characterList',
		'conditionList'
	],
	#category : 'Cormas-Core-HotDraw'
}

{ #category : #resources }
TransitionEditor class >> eventMenu [
	"MenuEditor new openOnClass: self andSelector: #eventMenu"
	
	<resource: #menu>
	^#(#Menu #(#(#MenuItem 
		#rawLabel: 'mouseMove' 
		#value: #mouseMove) #(#MenuItem 
		#rawLabel: 'redButtonPress' 
		#value: #redButtonPress) #(#MenuItem 
		#rawLabel: 'redButtonRelease' 
		#value: #redButtonRelease) #(#MenuItem 
		#rawLabel: 'keyPress' 
		#value: #keyPress) #(#MenuItem 
		#rawLabel: 'keyRelease' 
		#value: #keyRelease) #(#MenuItem 
		#rawLabel: 'doubleClick' 
		#value: #doubleClick) #(#MenuItem 
		#rawLabel: 'yellowButtonPress' 
		#value: #yellowButtonPress) #(#MenuItem 
		#rawLabel: 'yellowButtonRelease' 
		#value: #yellowButtonRelease) #(#MenuItem 
		#rawLabel: 'immediate' 
		#nameKey: #immediate 
		#value: #immediate)) #(1 2 2 1 2 1) nil) decodeAsLiteralArray
]

{ #category : #'instance creation' }
TransitionEditor class >> onType: aTransitionType [
	
	^(self new)
		type: aTransitionType;
		yourself
]

{ #category : #'interface specs' }
TransitionEditor class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Transition Editor' 
			#bounds: #(Rectangle 840 552 1206 809) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(MenuButtonSpec 
				#layout: #(LayoutFrame 50 0 5 0 -5 1 35 0) 
				#name: #event 
				#model: #eventType 
				#menu: #eventMenu) #(LabelSpec 
				#layout: #(Point 5 10) 
				#label: 'Event:') #(DividerSpec 
				#layout: #(LayoutFrame 0 0 40 0 0 1 42 0)) #(RadioButtonSpec 
				#layout: #(Point 5 50) 
				#name: #always 
				#model: #transition 
				#label: 'Always' 
				#select: #always) #(RadioButtonSpec 
				#layout: #(Point 5 80) 
				#name: #figure 
				#model: #transition 
				#label: 'Figure' 
				#select: #figure) #(RadioButtonSpec 
				#layout: #(Point 5 110) 
				#name: #character 
				#model: #transition 
				#label: 'Character' 
				#select: #character) #(SequenceViewSpec 
				#layout: #(LayoutFrame 100 0 49 0 0 0.986339 -51 1) 
				#name: #figureList 
				#flags: 61 
				#model: #figureList 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #highlight) #(ActionButtonSpec 
				#layout: #(AlignmentOrigin 0 0.666666 -5 1 0.5 1) 
				#name: #cancel 
				#model: #cancel 
				#label: 'Cancel' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(AlignmentOrigin 0 0.333333 -5 1 0.5 1) 
				#name: #accept 
				#model: #accept 
				#label: 'OK' 
				#isDefault: true 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(LayoutFrame 175 0 -95 1 -5 1 -65 1) 
				#name: #characters 
				#flags: 56 
				#model: #charactersHolder) #(LabelSpec 
				#layout: #(LayoutOrigin 100 0 -90 1) 
				#name: #label 
				#flags: 48 
				#label: 'Characters:') #(SequenceViewSpec 
				#layout: #(LayoutFrame 100 0 50 0 -5 1 -100 1) 
				#name: #characterList 
				#flags: 61 
				#model: #characterList 
				#multipleSelections: true 
				#useModifierKeys: true 
				#selectionType: #highlight) #(RadioButtonSpec 
				#layout: #(Point 5 143) 
				#name: #toolCondition 
				#model: #transition 
				#label: 'Tool condition' 
				#select: #toolCondition) #(SequenceViewSpec 
				#layout: #(Rectangle 100 81 205 157) 
				#name: #conditionList 
				#flags: 61 
				#model: #conditionList 
				#multipleSelections: false 
				#useModifierKeys: true 
				#selectionType: #highlight))))
]

{ #category : #'initialize-release' }
TransitionEditor >> buildCharacterList [
	
	| characters |
	characters := OrderedCollection new.
	self symbolKeys
		do: [:each | characters add: each asString -> (Array with: each)].
	self specialCharacters
		do: [:each | characters add: each printString -> (Array with: each)].
	characters add: 'Printable' -> self printableCharacters.
	self characterList list: characters
]

{ #category : #'initialize-release' }
TransitionEditor >> buildConditionList [
	
	self conditionList list: #(true false) asList
]

{ #category : #'initialize-release' }
TransitionEditor >> buildFigureList [
	
	self figureList
		list:
			(Figure withAllSubclasses asSortedCollection: [:a :b | a name < b name])
				asList
]

{ #category : #changing }
TransitionEditor >> changedEvent [
	
	(#(#keyPress #keyRelease) includes: self eventType value)
		ifTrue:
			[self
				disableAll: #(#figure);
				enableAll: #(#toolCondition);
				enableAll: #(#character)]
		ifFalse:
			[self
				enableAll: #(#figure);
				enableAll: #(#toolCondition);
				disableAll: #(#character)]
]

{ #category : #changing }
TransitionEditor >> changedTransition [
	
	self transition value == #figure
		ifTrue: [self enableAll: #(#figureList)]
		ifFalse: [self disableAll: #(#figureList)].
	self transition value == #character
		ifTrue: [self enableAll: #(#characterList #characters #label)]
		ifFalse: [self disableAll: #(#characterList #characters #label)].
	self transition value == #toolCondition
		ifTrue: [self enableAll: #(#conditionList)]
		ifFalse: [self disableAll: #(#conditionList)]
]

{ #category : #aspects }
TransitionEditor >> characterList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^characterList isNil
		ifTrue: [characterList := MultiSelectionInList new]
		ifFalse: [characterList]
]

{ #category : #private }
TransitionEditor >> charactersForType [
	
	| characters |
	characters := OrderedCollection new.
	self characterList selections do: [:each | characters addAll: each value].
	characters addAll: self charactersHolder value.
	^characters asArray
]

{ #category : #aspects }
TransitionEditor >> charactersHolder [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^charactersHolder isNil
		ifTrue: [charactersHolder := String new asValue]
		ifFalse: [charactersHolder]
]

{ #category : #aspects }
TransitionEditor >> conditionList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^conditionList isNil
		ifTrue: [conditionList := SelectionInList new]
		ifFalse: [conditionList]
]

{ #category : #private }
TransitionEditor >> disableAll: aSymbolList [
	
	builder isNil ifTrue: [^self].
	aSymbolList
		do:
			[:each | 
			| widget |
			widget := builder componentAt: each.
			widget notNil
				ifTrue:
					[widget
						disable;
						beInvisible]]
]

{ #category : #private }
TransitionEditor >> enableAll: aSymbolList [
	
	builder isNil ifTrue: [^self].
	aSymbolList
		do:
			[:each | 
			| widget |
			widget := builder componentAt: each.
			widget notNil
				ifTrue:
					[widget
						beVisible;
						enable]]
]

{ #category : #aspects }
TransitionEditor >> eventType [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^eventType isNil
		ifTrue: [eventType := nil asValue]
		ifFalse: [eventType]
]

{ #category : #aspects }
TransitionEditor >> figureList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^figureList isNil
		ifTrue: [figureList := MultiSelectionInList new]
		ifFalse: [figureList]
]

{ #category : #'initialize-release' }
TransitionEditor >> initialize [
	
	super initialize.
	self
		buildCharacterList;
		buildFigureList;
		buildConditionList
]

{ #category : #'interface opening' }
TransitionEditor >> postBuildWith: aBuilder [
	
	super postBuildWith: aBuilder.
	self eventType onChangeSend: #changedEvent to: self.
	self transition onChangeSend: #changedTransition to: self.
	self
		changedEvent;
		changedTransition
]

{ #category : #private }
TransitionEditor >> printableCharacters [
	
	^String withAll: ((32 to: 127) collect: [:each | Character value: each])
]

{ #category : #private }
TransitionEditor >> selectCharacters: characters [
	
	| newSelections charsLeft |
	newSelections := self characterList list
		reject:
			[:each | each value contains: [:char | (characters includes: char) not]].
	self characterList selections: newSelections.
	self charactersHolder value: ''.
	charsLeft := characters asOrderedCollection.
	self charactersForType
		do:
			[:each | 
			charsLeft
				remove: each
				ifAbsent: []].
	self charactersHolder
		value: (String withAll: (charsLeft reject: [:each | each isSymbol]))
]

{ #category : #private }
TransitionEditor >> specialCharacters [
	
	^#(#tab #del #backspace #esc #cr #newPage #lf)
		collect: [:each | Character perform: each]
]

{ #category : #private }
TransitionEditor >> symbolKeys [
	
	^#(#F1 #F2 #F3 #F4 #F5 #F6 #F7 #F8 #F9 #F10 #F11 #F12 #Insert #Home #End #PageUp #PageDown #Up #Down #Left #Right #NumLock)
]

{ #category : #aspects }
TransitionEditor >> transition [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^transition isNil
		ifTrue: [transition := nil asValue]
		ifFalse: [transition]
]

{ #category : #accessing }
TransitionEditor >> type [
	
	| newType |
	newType := (TransitionType withAllSubclasses
		detect: [:each | each transition == self transition value]) new.
	newType event: self eventType value.
	newType figureClasses: self figureList selections asArray.
	newType characters: self charactersForType.
	(newType isKindOf: ToolConditionType)
		ifTrue: [newType toolConditionResult: self conditionList selection].
	^newType
]

{ #category : #accessing }
TransitionEditor >> type: aType [
	
	self eventType value: aType event.
	self transition value: aType class transition.
	self figureList selections: aType figureClasses.
	self conditionList selection: (Array with: true).
	self selectCharacters: aType characters
]
