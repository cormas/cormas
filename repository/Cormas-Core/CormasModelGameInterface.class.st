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
	#category : #'Cormas-Core-Interface'
}

{ #category : #'interface specs' }
CormasModelGameInterface class >> decisionsSheetValidation [
	"UIPainter new openOnClass: self andSelector: #decisionsSheetValidation"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: '' 
			#min: #(#Point 262 53) 
			#max: #(#Point 262 53) 
			#bounds: #(#Rectangle 234 326 496 379) 
			#flags: 4 
			#colors: #(#LookPreferences 
				#setForegroundColor: #(#ColorValue #black) 
				#setBackgroundColor: #(#ColorValue #white)) 
			#isEventDriven: true) 
		#component: #(#SpecCollection 
			#collection: #(#(#ActionButtonSpec 
				#layout: #(#Rectangle 155 5 259 35) 
				#model: #delete 
				#label: 'Effacer la fiche' 
				#style: #pixelDefault 
				#defaultable: true) #(#ActionButtonSpec 
				#layout: #(#Rectangle 4 5 108 35) 
				#model: #validate 
				#label: 'Enregistrer la fiche' 
				#style: #pixelDefault 
				#defaultable: true))))
]

{ #category : #'interface specs' }
CormasModelGameInterface class >> decisionsSheetsControl [
	"UIPainter new openOnClass: self andSelector: #decisionsSheetsControl"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: '' 
			#min: #(#Point 152 312) 
			#max: #(#Point 152 312) 
			#bounds: #(#Rectangle 277 285 429 597) 
			#flags: 4 
			#colors: #(#LookPreferences 
				#setForegroundColor: #(#ColorValue #black) 
				#setBackgroundColor: #(#ColorValue #white)) 
			#isEventDriven: true) 
		#component: #(#SpecCollection 
			#collection: #(#(#ActionButtonSpec 
				#layout: #(#Rectangle 35 259 118 295) 
				#colors: #(#LookPreferences 
					#setForegroundColor: #(#ColorValue #red)) 
				#model: #go 
				#label: 'Go' 
				#style: #large 
				#defaultable: true) #(#LabelSpec 
				#layout: #(#Point 5 -1) 
				#label: 'Ordonnancement des fiches' 
				#style: #pixelDefault) #(#SequenceViewSpec 
				#layout: #(#Rectangle 29 17 124 138) 
				#flags: 12 
				#model: #playersScheduling 
				#useModifierKeys: true 
				#selectionType: #highlight) #(#ActionButtonSpec 
				#layout: #(#Rectangle 3 39 25 61) 
				#model: #moveUp 
				#label: #up 
				#hasCharacterOrientedLabel: false) #(#ActionButtonSpec 
				#layout: #(#Rectangle 3 68 25 90) 
				#model: #moveDown 
				#label: #down 
				#hasCharacterOrientedLabel: false) #(#InputFieldSpec 
				#layout: #(#Rectangle 61 202 91 227) 
				#model: #validity 
				#alignment: #center 
				#type: #number 
				#formatString: '1') #(#LabelSpec 
				#layout: #(#Point 47 182) 
				#label: 'du modele)' 
				#style: #pixelDefault) #(#LabelSpec 
				#layout: #(#Point 8 171) 
				#label: '(nombre de pas de temps' 
				#style: #pixelDefault) #(#CompositeSpecCollection 
				#collection: #(#(#LabelSpec 
					#layout: #(#Point 0 0) 
					#label: 'Duree de validite des fiches' 
					#style: #pixelDefault)) 
				#compositeSpec: #(#CompositeSpec 
					#layout: #(#Rectangle 5 161 147 181))))))
]

{ #category : #resources }
CormasModelGameInterface class >> down [
	"UIMaskEditor new openOnClass: self andSelector: #down"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 32 @ 32
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 252 63 255 255 252 63 255 255 252 63 255 255 252 63 255 255 252 63 255 255 252 63 255 255 252 63 255 255 252 63 255 255 252 63 255 255 224 7 255 255 240 15 255 255 248 31 255 255 252 63 255 255 254 127 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255])
]

{ #category : #resources }
CormasModelGameInterface class >> menuDecisionsSheet [
	"MenuEditor new openOnClass: self andSelector: #menuDecisionsSheet"
	
	<resource: #menu>
	^#(#Menu #(#(#MenuItem 
		#rawLabel: '' 
		#labelImage: #(#ResourceRetriever #UIPalette #selectIconImage)) #(#MenuItem 
		#rawLabel: 'Decisions sheet' 
		#enabled: false 
		#nameKey: #DecisionsSheet 
		#submenu: #(#Menu #(#(#MenuItem 
			#rawLabel: 'Events' 
			#nameKey: #Events 
			#value: #events)) #(1) nil))) #(2) nil) decodeAsLiteralArray
]

{ #category : #resources }
CormasModelGameInterface class >> up [
	"UIMaskEditor new openOnClass: self andSelector: #up"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 32 @ 32
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 127 255 255 252 63 255 255 248 31 255 255 240 15 255 255 224 7 255 255 252 63 255 255 252 63 255 255 252 63 255 255 252 63 255 255 252 63 255 255 252 63 255 255 252 63 255 255 252 63 255 255 252 63 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255])
]

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

{ #category : #menu }
CormasModelGameInterface >> buildMenuDecisionsSheet [
	
	| updatedMenu |
	updatedMenu := ((self builder menuAt: #menuDecisionsSheet) atNameKey:
			#DecisionsSheet) submenu.
	self model playersNames
		do:
			[:pn | 
			updatedMenu
				addItem: (MenuItem labeled: pn asString)
				value: [self resetDecisionsSheet: pn]
				nameKey: pn asSymbol]
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

{ #category : #blocks }
CormasModelGameInterface >> initBlocks [
	
	| inputFields labels |
	self blocks: Dictionary new.
	(self builder namedComponents values
		select: [:x | x widget class = CompositePart])
		do:
			[:x | 
			self blocks
				at: x spec name
				put: Dictionary new.
			inputFields := OrderedCollection new.
			labels := OrderedCollection new.
			x widget components
				do:
					[:i | 
					i spec name notNil
						ifTrue:
							[(i widget class = InputFieldView
								or: [i widget class inheritsFrom: CheckButtonView])
								ifTrue: [inputFields add: i spec name]
								ifFalse: [labels add: i spec name]]].
			(self blocks at: x spec name) at: #inputFields put: inputFields.
			(self blocks at: x spec name) at: #labels put: labels].	"check consistency for blocks names"
	self model playersNames
		do:
			[:pn | 
			(self model playersBlocks at: pn)
				do: [:bn | (self blocks keys includes: bn) ifFalse: [self halt]]]
]

{ #category : #initialize }
CormasModelGameInterface >> initPlayersBlocks [
	
	self subclassResponsibility
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

{ #category : #actions }
CormasModelGameInterface >> open [
	
	accept := false asValue.
	cancel := false asValue.
	close := false asValue.
	super open
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

{ #category : #initialize }
CormasModelGameInterface >> postBuildWith: aBuilder [
	
	self initBlocks.
	self buildMenuDecisionsSheet.
	self setBlocksInvisible.
	self model playersNames do: [:n | self prepareDecisionsSheet: n].
	super postBuildWith: aBuilder
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

{ #category : #actions }
CormasModelGameInterface >> quit [
	
	self accept value: true
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
