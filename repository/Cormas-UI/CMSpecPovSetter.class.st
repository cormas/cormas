"
CMSpecPovSetter example.

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	povColor:		<Object>
	povDefinition:		<Object>
	povInfo:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpecPovSetter,
	#superclass : #CMSpecObject,
	#instVars : [
		'povDefinition',
		'povInfo',
		'toolbar',
		'povColorButton',
		'setColorLabel',
		'applyButton',
		'selectedClass',
		'povDefinitionLabel',
		'povInfoLabel'
	],
	#classInstVars : [
		'standardCellBounds'
	],
	#category : #'Cormas-UI-Spec1-PoV'
}

{ #category : #colors }
CMSpecPovSetter class >> colorChooser [
	"open a Color chooser.
	test it : CMSpecPovSetter new colorChooser  "

	^ (UITheme builder newColorChooserFor: World
		getColor: #color
		setColor: #color:
		help: self translator tChooseTokenColor) open.

]

{ #category : #specs }
CMSpecPovSetter class >> defaultSpec [

    <spec>
    ^ SpecLayout composed
		newColumn: [ : d |
			d newRow: [ : r |
					r 
						add: #povDefinitionLabel;
						add: #povInfoLabel
					 ] height: self toolbarHeight.
			d newColumn: [ : c |
				c newRow: [ : r | 
					r
						add: #povDefinition;
						add: #povInfo ] height: 230;
					newRow: [ : r |
					r
						add: #setColorLabel width: 70;
						add: #povColorButton ] height: self toolbarHeight;
					newRow: [ : r |
					r
						add: #applyButton width: 100 ] height: self toolbarHeight ] ]; 
		yourself
]

{ #category : #accessing }
CMSpecPovSetter class >> standardCellBounds [
	
	^Rectangle
		origin: 0 @ 0
		extent: 51 @ 51
]

{ #category : #action }
CMSpecPovSetter >> addInfo [
	"adding a new POV method"
	
	| aName |
	(aName := self
		requestText: self infoName
		initialAnswer: 'info_'
		title: 'CORMAS') 
			ifNil: [ ^ self ]
			ifNotNil: [ self modifyInfo: aName asSymbol ].
	self listInfo list
		addFirst: aName asString , ' (' , selectedClass name asString , ')'.
	self listInfo selectionIndex: 1
]

{ #category : #action }
CMSpecPovSetter >> addPov [
	"adding a new POV method"
	
	| aName |
	
	(aName := self
		requestText: self povName
		title: 'CORMAS') 
			ifNil: [ ^ self ]
			ifNotNil: [ self modifyPov: aName asSymbol ].	
		self listMethods list
		addFirst: aName asString , ' (' , selectedClass name asString , ')'.
	self listMethods selectionIndex: 1
]

{ #category : #action }
CMSpecPovSetter >> addPovOnAttribute [
	| list choice values valuesTextLine |
	list := DefaultAttributesSetter attributsFromClass: selectedClass.
	(choice := UITheme builder
		chooseDropList: self translator tCreatePoVAtt
		title: 'CORMAS'
		list: list) ifNil: [ ^ nil ].
	self createPovOnAttribute: choice.
	self cormasModel
		ifNotNil: [ values := (self cormasModel allTheEntities: selectedClass)
				collect: [ :entity | entity perform: choice asSymbol ] ].
	(values isNil or: [ values size = 1 and: [ values first isNil ] ])
		ifTrue: [ ^ self ].
	valuesTextLine := ''.
	values
		do: [ :v | valuesTextLine := valuesTextLine , v printString , ' ' ].
	(self confirmAttValues: choice for: valuesTextLine)
		ifTrue: [ values
				do: [ :v | 
					v isSymbol
						ifTrue: [ self addSymbolPov: v asString ]
						ifFalse: [ v isString
								ifTrue: [ self addSymbolPov: v ]
								ifFalse: [ v isLiteral
										ifTrue: [ self addSymbolPov: choice , v printString ] ] ] ] ]
]

{ #category : #action }
CMSpecPovSetter >> addSymbolPov [
	
	| aString |
	selectedClass isNil ifTrue: [^nil].
	(aString := (self requestMessage: self translator tNewSymbol) asString)
		ifEmpty: [ ^ nil ].
	[ aString first = $# ]
		whileTrue: [
			(aString := aString allButFirst) 
			 	ifEmpty: [ ^ nil] ].
	^ self addSymbolPov: aString
]

{ #category : #accessing }
CMSpecPovSetter >> applyButton [
	^ applyButton
]

{ #category : #accessing }
CMSpecPovSetter >> applyButton: anObject [
	applyButton := anObject
]

{ #category : #action }
CMSpecPovSetter >> close [
	
	self closeRequest
]

{ #category : #action }
CMSpecPovSetter >> confirmAttValues: choice for: valuesTextLine [

	^ self confirm: (String streamContents: [ : stream |
			stream 
				nextPutAll: self translator tFoundValues;
				nextPutAll: choice;
				nextPutTerminator;
				nextPutAll: valuesTextLine;
				nextPutTerminator;
				nextPutAll: self translator tAddSymbols ])
]

{ #category : #action }
CMSpecPovSetter >> createPovOnAttribute: att [
	
	" self codeGenerator createPovOnAttribute: att.  "

	selectedClass
		compile:
			('pov' , (Cormas upperCaseFirstChar: att) ,
					'\"return the value of the attribute\if the value is a string, converts it to a symbol\if the value is a number, converts it to a symbol, precede by the word '
				, att ,
					'"
	self ' , att , ' isString ifTrue:[^self ' , att ,
					' asSymbol].
	self ' , att , ' isLiteral ifTrue:[^ (''' , att , ''' , self ' , att ,
					' printString) asSymbol].
	^self ' , att , '') withCRs
		classified: 'star pov'
		notifying: nil
]

{ #category : #colors }
CMSpecPovSetter >> defaultColor [
	
	^ Color blue
]

{ #category : #util }
CMSpecPovSetter >> formatItemAt: i from: povItems [

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: (povItems at: i) asString;
			space;
			nextPut: $(;
			nextPutAll: selectedClass name asString;
			nextPut: $) ]
]

{ #category : #'user messages' }
CMSpecPovSetter >> infoName [
	
	^' info name : '
]

{ #category : #util }
CMSpecPovSetter >> inheritedMethodsFrom: aClass category: aCat [
	"Retourne la liste des methodes des superclasses de aClass en s'arr√™tant √† Entity
	On rajoute povID et povClassName"
	
	| aList tmp classes |
	aList := OrderedCollection new.
	classes := aClass allSuperclasses copy.
	classes removeAll: CMEntity allSuperclasses.
	classes do: [ : uneClasse | 
		tmp := uneClasse organization listAtCategoryNamed: aCat.	"specific case of Entity and #pov"	"no need anymore since the generic category has been renamed '* pov'"	"(uneClasse = Entity and: [aCat = #pov]) 
				ifTrue:[tmp := (Entity organization listAtCategoryNamed: aCat) select: [:sel | sel = #povId | (sel = #povClassName)]]."
			1
				to: tmp size
				do:
					[:i | 
					tmp
						at: i
						put: (tmp at: i) asString , ' (' , uneClasse name asString , ')'].
			aList addAll: tmp].
	^aList
]

{ #category : #initialization }
CMSpecPovSetter >> initialExtent [

	^ 850 @ 350
]

{ #category : #initialization }
CMSpecPovSetter >> initializePresenter [
	" Private - See superimplementor's comment "

"	self povColorButton
		action: [ self openColorChooser ]"
	self listSymbols when: #changed send: #listSymbolsChanged to: self.
	self listMethods when: #changed send: #listMethodsChanged to: self.	
]

{ #category : #initialization }
CMSpecPovSetter >> initializeWidgets [
	" Private - See superimplementor's comment "

	self povDefinition: (CMSpecPovDefinition for: self projectManager).
	self povInfo: (CMSpecPovInfo for: self projectManager).
	self instantiateModels: #(
		povDefinitionLabel	 	LabelModel
		povInfoLabel 			LabelModel
		setColorLabel 			LabelModel
		povColorButton 			SpcColorChooserModel
		applyButton				ButtonModel
"		toolbar 				SpcOneButtonToolbar").

	self povDefinitionLabel label: self translator tPoVDefinition.
	self povInfoLabel label: self translator tPoVInfoDisplayed.
	self setColorLabel label: self translator tPoVSetColor.
	self applyButton label: self translator tApply.

]

{ #category : #accessing }
CMSpecPovSetter >> listInfo [
	
	^ self povInfo povInfoList
]

{ #category : #accessing }
CMSpecPovSetter >> listMethods [
	" Answer a <Collection> of receiver's PoV methods "
	
	^ self povDefinition methodsList
]

{ #category : #changed }
CMSpecPovSetter >> listMethodsChanged [
	"propagate the change to cormas"
	
	self cormas listMethodsChanged	
	"cormas spaceInterfaces 
		do: [:sp | sp spaceModel ifNotNil: [sp initMenuPov]]"
]

{ #category : #accessing }
CMSpecPovSetter >> listSymbols [
	" Answer a <Collection> of receiver's PoV methods "
	
	^ self povDefinition symbolsList
]

{ #category : #action }
CMSpecPovSetter >> modifyInfo: infoName [
	
	selectedClass
		compile:
			(infoName asString ,
					'\"return a String "\ ^self id printString\" ^ self class name asString "')
				withCRs
		classified: 'info'
		notifying: nil.
	self editMethod: infoName fromClass: selectedClass	"selectedClass infoDict at: infoName put: OrderedCollection new"
]

{ #category : #action }
CMSpecPovSetter >> modifyPov: povName [
	
	selectedClass
		compile:
			(povName asString ,
					'\"return a symbol or a ColorValue"\^#aSymbol\"^ColorValue white"')
				withCRs
		classified: 'pov'
		notifying: nil.
	self editMethod: povName fromClass: selectedClass
]

{ #category : #'user messages' }
CMSpecPovSetter >> noSelectedEntity [
	
	^'Select an entity first !!! '
]

{ #category : #accessing }
CMSpecPovSetter >> povColorButton [
	^ povColorButton
]

{ #category : #accessing }
CMSpecPovSetter >> povColorButton: anObject [
	povColorButton := anObject
]

{ #category : #accessing }
CMSpecPovSetter >> povDefinition [
	^ povDefinition
]

{ #category : #accessing }
CMSpecPovSetter >> povDefinition: anObject [
	povDefinition := anObject
]

{ #category : #accessing }
CMSpecPovSetter >> povDefinitionLabel [
	^ povDefinitionLabel
]

{ #category : #accessing }
CMSpecPovSetter >> povDefinitionLabel: anObject [
	povDefinitionLabel := anObject
]

{ #category : #accessing }
CMSpecPovSetter >> povInfo [
	^ povInfo
]

{ #category : #accessing }
CMSpecPovSetter >> povInfo: anObject [
	povInfo := anObject
]

{ #category : #accessing }
CMSpecPovSetter >> povInfoLabel [
	^ povInfoLabel
]

{ #category : #accessing }
CMSpecPovSetter >> povInfoLabel: anObject [
	povInfoLabel := anObject
]

{ #category : #'user messages' }
CMSpecPovSetter >> povName [
	
	^' pov name : '
]

{ #category : #util }
CMSpecPovSetter >> removeBrackets: aNom [
	
	| index unNom |
	aNom isNil ifTrue: [^nil].
	index := aNom findFirst: [:aChar | aChar = $(].
	index = 0 ifTrue: [^aNom].
	unNom := aNom
		changeFrom: index - 1
		to: aNom size
		with: ''.
	^unNom
]

{ #category : #util }
CMSpecPovSetter >> removeParentheses: aNom [
	
	| index unNom |
	aNom isNil ifTrue: [^nil].
	index := aNom findFirst: [:aChar | aChar = $(].
	index = 0 ifTrue: [^aNom].
	unNom := aNom
		changeFrom: index - 1
		to: aNom size
		with: ''.
	^unNom
]

{ #category : #action }
CMSpecPovSetter >> removeSymbolPov [
	
	| selectedSymbol |
	self listSymbols selection isNil
		ifFalse:
			[(self cormas
				confirm:
					'Remove this symbol ?' asString)
				ifTrue:
					[selectedSymbol := self listSymbols selection.
					self removeClassMethodForSymbol: selectedSymbol.
					selectedClass colorsDict
						removeKey: selectedSymbol asSymbol
						ifAbsent: [nil].	"selectedClass povDict removeKey: selectedSymbol ifAbsent: [nil].  uniquement pour les agents"
					self removeSymbolPov: selectedSymbol.
					^selectedSymbol]]
]

{ #category : #accessing }
CMSpecPovSetter >> selectedClass [
	
	^selectedClass
]

{ #category : #accessing }
CMSpecPovSetter >> selectedClass: anObject [
	selectedClass := anObject
]

{ #category : #accessing }
CMSpecPovSetter >> selectedMethod [
	
	^self listMethods selection
]

{ #category : #accessing }
CMSpecPovSetter >> setColorLabel [
	^ setColorLabel
]

{ #category : #accessing }
CMSpecPovSetter >> setColorLabel: anObject [
	setColorLabel := anObject
]

{ #category : #initialization }
CMSpecPovSetter >> setListInfo [

	| liste tmp |
	liste := OrderedCollection new.
	liste addAll: (self inheritedMethodsFrom: selectedClass category: #'star info').
	liste addFirst: '----'.
	tmp := (selectedClass organization listAtCategoryNamed: #'star info') asOrderedCollection.
	tmp addAll: (selectedClass organization listAtCategoryNamed: #info). 
	"to ensure compatibility for models implemented with previous Cormas versions" 
	1 to: tmp size do: [ : i | self formatItemAt: i from: tmp ].
	liste addAllFirst: tmp.
	self listInfo items: liste.
	liste isEmpty 
		ifFalse: [ self listInfo selectFirstItem ].
]

{ #category : #initialization }
CMSpecPovSetter >> setListMethods [
	| liste tmp |
	liste := OrderedCollection new.
	liste addAll: (self inheritedMethodsFrom: selectedClass category: #'star pov').
	liste addFirst: '----'.
	tmp := (selectedClass organization listAtCategoryNamed: #'star pov') asOrderedCollection.
	tmp addAll: (selectedClass organization listAtCategoryNamed: #pov).
	"to ensure compatibility for models implemented with previous Cormas versions"
	1 to: tmp size do: [ :i | tmp at: i put: (self formatItemAt: i from: tmp) ].
	liste addAllFirst: tmp.
	self listMethods items: liste.
	liste isEmpty
		ifFalse: [ self listMethods selectFirstItem ]
]

{ #category : #initialization }
CMSpecPovSetter >> setListSymbols [

	| liste |

	liste := OrderedCollection new.
	liste addAll: (selectedClass colorsDict keys collect: #asString).
	(liste includes: selectedClass name asString) 
		ifFalse: [ liste addFirst: selectedClass name asString ].
	self listSymbols items: liste sort.
	liste isEmpty 
		ifFalse: [ self listSymbols selectFirstItem ]
]

{ #category : #accessing }
CMSpecPovSetter >> setModelClass: aClass [
	
	selectedClass := aClass.
	self setListMethods.
	self setListSymbols.
	self setListInfo
]

{ #category : #changed }
CMSpecPovSetter >> updateSlidersFromColor: aCol [
	
	aCol ifNil: [^nil].
	self blueSlider value: aCol blue.
	self greenSlider value: aCol green.
	self redSlider value: aCol red.
	self brightnessSlider value: aCol brightness
]

{ #category : #action }
CMSpecPovSetter >> validate [
	
	self subclassResponsibility
]
