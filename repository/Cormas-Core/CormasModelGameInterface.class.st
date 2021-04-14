Class {
	#name : #CormasModelGameInterface,
	#superclass : #Object,
	#instVars : [
		'blocks',
		'validity',
		'model',
		'selectedPlayer',
		'playersScheduling'
	],
	#category : #'Cormas-Core-Legacy'
}

{ #category : #accessing }
CormasModelGameInterface >> blocks [
	
	^blocks isNil
		ifTrue: [Dictionary new]
		ifFalse: [blocks]
]

{ #category : #accessing }
CormasModelGameInterface >> blocks: anObject [
	
	blocks := anObject
]

{ #category : #actions }
CormasModelGameInterface >> delete [
	
	| newList |
	self selectedPlayer notNil
		ifTrue:
			[self prepareDecisionsSheet: self selectedPlayer.
			(self playersScheduling list includes: self selectedPlayer)
				ifTrue:
					[newList := self playersScheduling list.
					newList remove: self selectedPlayer.
					self selectedPlayer = 'Events'
						ifTrue:
							[(newList includes: self lineSep)
								ifTrue: [newList remove: self lineSep]
							].
					self playersScheduling list: newList.
					(((self builder menuAt: #menuDecisionsSheet) atNameKey:
							#DecisionsSheet) submenu atNameKey: self selectedPlayer asSymbol)
						enable.
					self selectedPlayer: nil]]
]

{ #category : #'decisions sheets' }
CormasModelGameInterface >> eraseDecisionsSheet [
	
	self model updateName.
	self blocks keys
		do:
			[:bn | 
			self setInvisibleBlock: bn.
			self mazBlock: bn]
]

{ #category : #'decisions sheets' }
CormasModelGameInterface >> events [
	
	(self blocks includesKey: #Events)
		ifTrue:
			[self model updateName: 'Events'.
			self blocks keys do: [:bn | self setInvisibleBlock: bn].
			self setVisibleBlock: #Events.
			self resetBlock: #Events]
		
]

{ #category : #actions }
CormasModelGameInterface >> go [
	
	self model decisionsSheetsReport add: self model decisionsSheets.
	self model runDecisionsSheets.
	self model repetitionDecisionsSheets: self validity value - 1.
	self accept value: true
]

{ #category : #initialize }
CormasModelGameInterface >> initialize [
	
	super initialize.
	self playersScheduling selectionIndexHolder onChangeSend:
			#resetDecisionsSheet to: self
]

{ #category : #aspects }
CormasModelGameInterface >> lineSep [
	
	^'-----------'
]

{ #category : #blocks }
CormasModelGameInterface >> majBlock: aBlockName [
	
	((self blocks at: aBlockName) at: #inputFields)
		do:
			[:aSpecName | 
			(self model decisionsSheets at: self selectedPlayer)
				at: aSpecName
				put: (self perform: aSpecName) value]
]

{ #category : #blocks }
CormasModelGameInterface >> mazBlock: aBlockName [
	
	| nullValue |
	((self blocks at: aBlockName) at: #inputFields)
		do:
			[:aSpecName | 
			nullValue := self nullValueForSpec: aSpecName.
			(self perform: aSpecName) value: nullValue]
]

{ #category : #accessing }
CormasModelGameInterface >> model [
	
	^model
]

{ #category : #accessing }
CormasModelGameInterface >> model: anObject [
	
	model := anObject
]

{ #category : #actions }
CormasModelGameInterface >> moveDown [
	
	| selection orderedList indice itemSuiv extra |
	selection := self playersScheduling selection.
	(selection = 'Events' or: [selection = self lineSep])
		ifFalse:
			[indice := self playersScheduling selectionIndexHolder value.
			extra := (self playersScheduling list includes: self lineSep)
				ifTrue: [2]
				ifFalse: [0].
			(selection notNil
				and: [indice < (self playersScheduling list size - extra)])
				ifTrue:
					[orderedList := self playersScheduling list asOrderedCollection.
					itemSuiv := orderedList at: indice + 1.
					orderedList remove: selection.
					orderedList add: selection after: itemSuiv.
					self playersScheduling list: orderedList.
					self playersScheduling selection: selection]]
]

{ #category : #actions }
CormasModelGameInterface >> moveUp [
	
	| selection orderedList indice itemPrec |
	selection := self playersScheduling selection.
	(selection = 'Events' or: [selection = self lineSep])
		ifFalse:
			[indice := self playersScheduling selectionIndexHolder value.
			(selection notNil and: [indice ~= 1])
				ifTrue:
					[orderedList := self playersScheduling list asOrderedCollection.
					itemPrec := orderedList at: indice - 1.
					orderedList remove: selection.
					orderedList add: selection before: itemPrec.
					self playersScheduling list: orderedList.
					self playersScheduling selection: selection]]
]

{ #category : #menu }
CormasModelGameInterface >> noEvents [
	
	| updatedMenu |
	updatedMenu := ((self builder menuAt: #menuDecisionsSheet) atNameKey:
			#DecisionsSheet) submenu.
	updatedMenu removeItem: (updatedMenu atNameKey: #Events)
]

{ #category : #'decisions sheets' }
CormasModelGameInterface >> nullDecisionsSheet: playerName [
	
	(self model playersBlocks at: playerName)
		do:
			[:aBlockName | 
			((self blocks at: aBlockName) at: #inputFields)
				do:
					[:aSpecName | 
					(self model decisionsSheets at: playerName)
						at: aSpecName
						put: (self nullValueForSpec: aSpecName)]]
]

{ #category : #blocks }
CormasModelGameInterface >> nullValueForSpec: aSpecName [
	
	^(self perform: aSpecName) value cormasHelper nullValue ifNil: [self halt]
]

{ #category : #aspects }
CormasModelGameInterface >> playersScheduling [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^playersScheduling isNil
		ifTrue: [playersScheduling := SelectionInList new]
		ifFalse: [playersScheduling]
]

{ #category : #'decisions sheets' }
CormasModelGameInterface >> prepareDecisionsSheet: playerName [
	
	self model gameStep > 1
		ifFalse: [self nullDecisionsSheet: playerName]
		ifTrue:
			[self model decisionsSheets
				at: playerName
				put:
					((self model decisionsSheetsReport at: self model gameStep - 1) at:
							playerName)]
]

{ #category : #blocks }
CormasModelGameInterface >> resetBlock: aBlockName [
	
	(self model decisionsSheets at: self selectedPlayer) isEmpty
		ifFalse:
			[((self blocks at: aBlockName) at: #inputFields)
				do:
					[:aSpecName | 
					(self perform: aSpecName)
						value:
							((self model decisionsSheets at: self selectedPlayer) at: aSpecName)]]
]

{ #category : #'decisions sheets' }
CormasModelGameInterface >> resetDecisionsSheet [
	
	self playersScheduling selection = self lineSep
		ifTrue: [^self playersScheduling selection: nil].
	self playersScheduling selection isNil
		ifTrue: [self setBlocksInvisible]
		ifFalse: [self resetDecisionsSheet: self playersScheduling selection]
]

{ #category : #'decisions sheets' }
CormasModelGameInterface >> resetDecisionsSheet: aName [
	
	self model updateName: aName.
	(self model playersBlocks includesKey: aName)
		ifTrue:
			[(self blocks includesKey: 'Events')
				ifTrue: [self setInvisibleBlock: 'Events'].
			self blocks keys
				do:
					[:bn | 
					((self model playersBlocks at: aName) includes: bn)
						ifTrue:
							[self setVisibleBlock: bn.
							self resetBlock: bn]
						ifFalse: [self setInvisibleBlock: bn]]]
		ifFalse:
			[aName = 'Events'
				ifTrue:
					[self setVisibleBlock: #Events.
					self resetBlock: #Events]
				ifFalse: [self halt]]
]

{ #category : #accessing }
CormasModelGameInterface >> selectedPlayer [
	
	^selectedPlayer
]

{ #category : #accessing }
CormasModelGameInterface >> selectedPlayer: anObject [
	
	selectedPlayer := anObject
]

{ #category : #'decisions sheets' }
CormasModelGameInterface >> setBlocksInvisible [
	
	self model updateName.
	self blocks keys do: [:bn | self setInvisibleBlock: bn]
]

{ #category : #blocks }
CormasModelGameInterface >> setInvisibleBlock: aBlockName [
	
	(self blocks at: aBlockName)
		do:
			[:list | 
			list
				do:
					[:specName | (self builder namedComponents at: specName) beInvisible]]
]

{ #category : #blocks }
CormasModelGameInterface >> setVisibleBlock: aBlockName [
	
	aBlockName ~= #Events
		ifTrue:
			[(self blocks at: aBlockName)
				do:
					[:list | 
					list
						do:
							[:specName | (self builder namedComponents at: specName) beVisible]]]
		ifFalse:
			[self blocks
				keysAndValuesDo:
					[:k :v | 
					k = #Events
						ifTrue:
							[v
								do:
									[:list | 
									list
										do:
											[:specName | (self builder namedComponents at: specName) beVisible]]]
						ifFalse:
							[v
								do:
									[:list | 
									list
										do:
											[:specName | (self builder namedComponents at: specName) beInvisible]]]]]
]

{ #category : #'decisions sheets' }
CormasModelGameInterface >> updateDecisionsSheet: playerName [
	
	playerName = 'Events'
		ifTrue: [self majBlock: #Events]
		ifFalse:
			[(self model playersBlocks at: playerName)
				do: [:b | self majBlock: b asSymbol]]
]

{ #category : #actions }
CormasModelGameInterface >> validate [
	
	| newList sp |
	self selectedPlayer notNil
		ifTrue:
			[sp := self selectedPlayer.
			self updateDecisionsSheet: sp.
			(self playersScheduling list includes: self selectedPlayer)
				ifFalse:
					[newList := self playersScheduling list.
					self selectedPlayer = 'Events'
						ifTrue:
							[newList add: self lineSep.
							newList add: sp]
						ifFalse: [newList addFirst: sp].
					self playersScheduling list: newList.
					self selectedPlayer: sp.
					self playersScheduling selection: self selectedPlayer.
					(((self builder menuAt: #menuDecisionsSheet) atNameKey:
							#DecisionsSheet) submenu atNameKey: self selectedPlayer asSymbol)
						disable]]
]

{ #category : #aspects }
CormasModelGameInterface >> validity [
	
	^validity isNil
		ifTrue: [validity := 1 asValue]
		ifFalse: [validity]
]
