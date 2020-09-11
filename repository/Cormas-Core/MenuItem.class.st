"
A menu item is part of a menu (see class Menu).  Each menu item represents an item that can be chosen from the menu.  If a menu item is not enabled then it cannot be chosen from the menu but it will still appear.  A menu item can have a key sequence associated with it that can be used to select the menu item without selecting it with the pointer.

The menu item label may define an access or accelerator key character.  The character after the first ampersand (&) will be the access character for the menu item (for LookPolicy's that have the concept of an access character).  The ampersand will not appear in the label, it just marks the character that should be the access character.  To get an ampersand to appear in the label, use two consecutive ampersands (&&).

The implementation code for any method is private to the class.  Users of any class should not rely on knowledge of implementation of that class or any of its methods.

Instance Variables
	label <CharacterArray | UserMessage> the label string to appear on the menu item.
	enabled <Boolean | ValueModel> is the menu item enabled (selectable) or not.
	adornment <MenuItemAdornment | nil> has any optional adornment information specified.
	helpText	<String | Text | nil> a short explanation of the item for the context help system.
	nameKey	<Symbol | nil>	identifier for programmatic access of this item in a menu.
	position	<Float | nil>	preferred position from top of menu indexed by <group>.<group position>.
	value	<Symbol | BlockClosure>	selector or block to be performed as item selection action.

NOTE:  The fact that a MenuItem uses a MenuItemAdornment is completely PRIVATE to class Menu.  MenuItemAdornment is a PRIVATE implementation class of MenuItem.


Object Reference
A MenuItem is an entry in a Menu, consisting primarily of a string label to be displayed in the menu. The value that is typically associated with a MenuItem is held by the menu and cannot be obtained from the item. 
A MenuItem can be created by sending #labeled: to this class. However, it is typically created indirectly, by sending an item-adding message to a menu, or by using the Menu Editor tool or a MenuBuilder. 
In addition to its inherited abilities, a MenuItem knows how to: 
	-Use a Text as its label instead of a string (labeling-text protocol) 
	-Set and get a graphic image or visual component to be displayed beside or instead of its label (labeling-image) 
	-Set and get a shortcut character (shortcut key) 
	-Set and get the index of the character in its label that is to be underlined as an access character (labeling-access character) 
	-Set and get an on-off indicator beside its label (indication) 
	-Set and get a color to be applied to it (color) 
	-Set and get a Menu to be used as a submenu (submenu) 

"
Class {
	#name : #MenuItem,
	#superclass : #Object,
	#instVars : [
		'enabled',
		'label',
		'adornment',
		'nameKey',
		'value',
		'position',
		'helpText'
	],
	#category : 'Cormas-Core-Interface'
}

{ #category : #private }
MenuItem class >> decodeFromLiteralArray: anArray [
	"Answer a new instance of the receiver decoded from the given literal array."
	
	^self basicNew enable fromLiteralArrayEncoding: anArray
]

{ #category : #'instance creation' }
MenuItem class >> labeled: aString [
	"Answer a new MenuItem with the given string as its label with a specified access character.
	The character after the first ampersand (&) will be the access character for the menu item (for LookPolicy's that have the concept of an access character).  The ampersand will not appear in the label, it just marks the character that should be the access character.  To get an ampersand to appear in the label, use two consecutive ampersands (&&).
	Labels ending in an ellipsis (...) (three consecutive periods) denote that the menu item initiates the beginning of an action (rather than the whole action).  When displayed, a LookPolicy may modify the ending ellipsis if another convention is used for that meaning."
	
	^(super new)
		initializeWithRawLabel: aString;
		yourself
]

{ #category : #'instance creation' }
MenuItem class >> new [
	"Message 'new' is not a valid instantiation message for objects of this class.  Use labeled: instead."
	
	self shouldNotImplement
]

{ #category : #'labeling-access character' }
MenuItem >> accessCharacterPosition [
	"Answer the index position of the access character in the label (or labelText if there is one).  Answer nil if undefined."
	
	| str i |
	str := self rawLabel asString readStream.
	i := 0.
	[str atEnd]
		whileFalse:
			[i := i + 1.
			str next = $&
				ifTrue:
					[str atEnd ifTrue: [^nil].
					(str peekFor: $&) ifFalse: [^i]]].
	^nil
]

{ #category : #'labeling-access character' }
MenuItem >> accessCharacterPosition: anIndex [
	"Set the index position of the access character in the label (or labelText if there is one).  The access character is the character that is underlined in the windows look & feel.
	Note:  If no access characters are specified in the MenuItems in a menu, then the UILookPolicy can (and will if appropriate) choose its own access characters for the MenuItems in the Menu."
	
	| str s1 s2 |
	str := self filteredLabel.
	anIndex == nil ifTrue: [^self label: str].
	s1 := str
		copyFrom: 1
		to: anIndex - 1.
	(s1 includes: $&) ifTrue: [s1 := s1 copyReplaceAll: '&' with: '&&'].
	s2 := str
		copyFrom: anIndex
		to: str size.
	(s2 includes: $&) ifTrue: [s2 := s2 copyReplaceAll: '&' with: '&&'].
	self rawLabel: s1 , '&' , s2
]

{ #category : #private }
MenuItem >> addButtonAsDependent: aSpecWrapper for: aToolbar [
	"If my indication, enablement, hidden, or labelImage is a ValueModel add a button view spec or toolbar as a dependent.  Answer the action required to remove this dependency"
	
	^(self addEnablementDependent: aSpecWrapper)
		, (self realAdornment addIndicationDependent: aSpecWrapper)
		, (self realAdornment addLabelImageDependent: aSpecWrapper)
		, (self addHiddenDependent: aToolbar)
]

{ #category : #private }
MenuItem >> addDependent: anObject [
	"Add anObject as one of the receiver's dependents."
	"MenuItems are not Models, will not support change notification, and will not support dependents."
	
	
]

{ #category : #private }
MenuItem >> addEnablementDependent: aSpecWrapper [
	"If enablement is a ValueModel add a BlockValue as a dependent to set enablement of aSpecWrapper. Answer the action required to later remove the dependency."
	
	^(enabled isKindOf: ValueModel)
		ifTrue:
			[| blockValue |
			blockValue := enabled compute: [:e | aSpecWrapper isEnabled: e].
			ActionSequence
				with:
					(MessageSend receiver: enabled selector: #removeDependent: argument:
							blockValue)]
		ifFalse: [ActionSequence new]
]

{ #category : #private }
MenuItem >> addHiddenDependent: aToolbar [
	
	^self realAdornment addHiddenDependent: aToolbar
]

{ #category : #'indication (on/off)' }
MenuItem >> beOff [
	"Make the receiver indicate itself as being 'off'."
	
	self isIndicationOfGroup
		ifTrue: [self realAdornment indicationValue: #AsYetUndefined]
		ifFalse: [self indication: false]
]

{ #category : #'indication (on/off)' }
MenuItem >> beOn [
	"Make the receiver indicate itself as being 'on'."
	
	self isIndicationOfGroup
		ifTrue: [self realAdornment indicationValue: nameKey]
		ifFalse: [self indication: true]
]

{ #category : #color }
MenuItem >> color [
	"Answer the color (ColorValue or Image) to use when displaying the receiver on a menu.  If none is specified answer nil."
	
	adornment == nil
		ifTrue: [^nil]
		ifFalse: [^adornment color]
]

{ #category : #color }
MenuItem >> color: aColor [
	"Set the color (a ColorValue or Image) to use when displaying this menu item on a menu."
	
	self realAdornment color: aColor
]

{ #category : #cormas }
MenuItem >> cormasHelper [
	"return the helper class for this object"
	
	^ValueHolderCormasHelper
]

{ #category : #'enabled/disabled' }
MenuItem >> disable [
	"Disable (make unselectable) the receiver.  When disabled it can't
	 be selected on a menu (but it will still appear if its visible)."
	
	(enabled isKindOf: ValueModel)
		ifTrue: [enabled value: false]
		ifFalse: [self enabled: false]
]

{ #category : #'enabled/disabled' }
MenuItem >> enable [
	"Enable the receiver (make is selectable).  When enabled it
	 can be selected on the menu (if its visible)."
	
	(enabled isKindOf: ValueModel)
		ifTrue: [enabled value: true]
		ifFalse: [self enabled: true]
]

{ #category : #'shortcut key' }
MenuItem >> enable: aBoolean shortcutModifier: aSymbol [
	
	self realAdornment enable: aBoolean shortcutModifier: aSymbol
]

{ #category : #'enabled/disabled' }
MenuItem >> enabled: enabledBoolean [
	"Make the receiver be enabled on the menu (if enabledBoolean's value is true)
	 otherwise invisible.  When enabled it can be selected on the menu (if it's visible)."
	
	enabled := enabledBoolean
]

{ #category : #'enabled/disabled' }
MenuItem >> enablement: enablement [
	
	enablement isSymbol
		ifTrue: [self enablementSelector: enablement]
		ifFalse:
			[enablement == nil
				ifTrue: [self enabled: true]
				ifFalse: [self enabled: enablement]]
]

{ #category : #'enabled/disabled' }
MenuItem >> enablementSelector [
	
	^adornment == nil
		ifTrue: [nil]
		ifFalse: [adornment enablementSelector]
]

{ #category : #'enabled/disabled' }
MenuItem >> enablementSelector: aSymbol [
	
	self realAdornment enablementSelector: aSymbol
]

{ #category : #labeling }
MenuItem >> filteredLabel [
	"Answer the true 'visual' label as a CharacterArray (Text or String, depending on what was set originally) instance, which is the label minus any accelerator key indicators (&'s)."
	
	| source index |
	source := self rawLabel asCharacterArray.
	source isEmpty ifTrue: [^source].
	index := 1.
	[index := source
		nextIndexOf: $&
		from: index
		to: source size - 1.
	index isNil]
		whileFalse:
			[source := source copyReplaceFrom: index to: index with: ''.
			[index < source size and: [(source at: index) = $&]]
				whileTrue: [index := index + 1]].
	^source
]

{ #category : #private }
MenuItem >> findGuiResourcesIn: aResourceContainer [
	
	| im labelObject menu |
	im := self realLabelImage.
	im findGuiResourcesIn: aResourceContainer.
	labelObject := self rawLabel.
	labelObject findGuiResourcesIn: aResourceContainer.
	menu := self submenu.
	menu findGuiResourcesIn: aResourceContainer
]

{ #category : #private }
MenuItem >> fromLiteralArrayEncoding: anArray [
	"Initialize the receiver with the information in the literalArray (see literalArrayEncoding).

	The perform: argument is checked for #value: to allow the value of the
 	MenuItem to be an array, i.e. not decoded."
	
	2
		to: anArray size
		by: 2
		do:
			[:i | 
			| symbol |
			symbol := anArray at: i.
			symbol == #value:
				ifTrue: [self value: (anArray at: i + 1)]
				ifFalse:
					[self
						perform: symbol
						with: (anArray at: i + 1) decodeAsLiteralArray]]
]

{ #category : #'indication (on/off)' }
MenuItem >> hasIndication [
	"Answer if the receiver has some indication (either in the 'on' state or 'off' state)."
	
	adornment == nil
		ifTrue: [^false]
		ifFalse: [^adornment indication ~~ nil]
]

{ #category : #submenu }
MenuItem >> hasSubmenu [
	"Answer whether there is a submenu to appear when the receiver is being selected."
	
	^self submenu ~~ nil
]

{ #category : #accessing }
MenuItem >> helpText [
	"A String or Text providing a quick help information, used by fly-by help
	or other quick contextual help means."
	
	^helpText
]

{ #category : #accessing }
MenuItem >> helpText: aStringOrText [
	
	helpText := aStringOrText
]

{ #category : #hidden }
MenuItem >> hidden [
	
	^adornment == nil
		ifTrue: [false]
		ifFalse: [adornment hidden]
]

{ #category : #hidden }
MenuItem >> hidden: aValue [
	
	self realAdornment hidden: aValue
]

{ #category : #'indication (on/off)' }
MenuItem >> indication [
	"Answer whether the menu item is to be indicated 'on' or 'off' (nil if not specified)."
	
	^self realAdornment indication
]

{ #category : #'indication (on/off)' }
MenuItem >> indication: aBooleanSymbolValueOrNil [
	"Set whether the menu item is to be indicated 'on' or 'off' (nil if not specified) by the Symbol or Boolean value of aBooleanSymbolValueOrNil, which may also be a ValueModel with the content."
	
	self realAdornment indication: aBooleanSymbolValueOrNil
]

{ #category : #'indication (on/off)' }
MenuItem >> indicationSelector [
	
	^adornment == nil
		ifTrue: [nil]
		ifFalse: [adornment indicationSelector]
]

{ #category : #'indication (on/off)' }
MenuItem >> indicationSelector: aSymbol [
	
	self realAdornment indicationSelector: aSymbol
]

{ #category : #'indication (on/off)' }
MenuItem >> indicator: indicator [
	
	indicator isSymbol
		ifTrue: [self indicationSelector: indicator]
		ifFalse: [self indication: indicator]
]

{ #category : #'private-initialization' }
MenuItem >> initializeWithRawLabel: aString [
	"Initialize the receiver and give it the given label."
	
	self enable.
	self rawLabel: aString
]

{ #category : #'enabled/disabled' }
MenuItem >> isEnabled [
	"Answer whether the menu item should be enabled on the menu.  If its not enabled it can't be selected."
	
	| result im |
	result := enabled evaluate.
	(result isKindOf: Boolean)
		ifFalse:
			[Transcript
				cr;
				show:
						(#MenuEnablementNotBoolean << #dialogs >>
									'Menu enablement for <1s> answers <2s> instead of a Boolean.'
								expandMacrosWith: label printString
								with: result printString);
				cr;
				show: #AnsweringTrue << #dialogs >> 'Answering true'.
			result := true].
	im := self labelImage.
	im isNil ifFalse: [im downcastEvent: #enablement with: result from: self].
	^result
]

{ #category : #'indication (on/off)' }
MenuItem >> isIndicationOfGroup [
	
	^self indication value isSymbol
]

{ #category : #'indication (on/off)' }
MenuItem >> isOff [
	"Answer if the receiver is in the 'off' state."
	
	adornment == nil
		ifTrue: [^false]
		ifFalse: [^adornment indication == false]
]

{ #category : #'indication (on/off)' }
MenuItem >> isOn [
	"Answer if the receiver is in the 'on' state."
	
	^adornment == nil
		ifTrue: [false]
		ifFalse:
			[| indicationValue |
			indicationValue := adornment indication value.
			indicationValue == true
				or: [nameKey notNil and: [nameKey = indicationValue]]]
]

{ #category : #labeling }
MenuItem >> label [
	
	^self filteredLabel
]

{ #category : #labeling }
MenuItem >> label: aString [
	"Set the label to be a String.  Labels ending in an ellipsis (...) (three consecutive periods) denote that the menu item initiates the beginning of an action (rather than the whole action).  A particular LookPolicy may modify the ending ellipsis (when the label is displayed) if another convention is used for that meaning."
	
	| readStream writeStream |
	readStream := aString readStream.
	writeStream := (String new: aString size) writeStream.
	[readStream atEnd]
		whileFalse:
			[| thisCharacter |
			thisCharacter := readStream next.
			(thisCharacter = $& and: [readStream atEnd not])
				ifTrue: [writeStream nextPut: $&].
			writeStream nextPut: thisCharacter].
	self rawLabel: writeStream contents
]

{ #category : #'labeling-image' }
MenuItem >> labelImage [
	"Answer the image (if any) to appear on the menu item (can be any VisualComponent).  Answer nil if there isn't an image."
	
	| im |
	im := self realLabelImage.
	^[im value]
		on: Object messageNotUnderstoodSignal
		from: im
		do: [:ex | ex return: im]
]

{ #category : #'labeling-image' }
MenuItem >> labelImage: anImage [
	"Set an image (can be any VisualComponent) to appear on the menu item.  The size of the image should be small (16@16 or less) for the best effect."
	
	self realAdornment labelImage: anImage
]

{ #category : #'labeling-text' }
MenuItem >> labelText [
	"Answer any specific label Text specified for the receiver (answer nil if none)."
	
	adornment == nil
		ifTrue: [^nil]
		ifFalse: [^adornment labelText]
]

{ #category : #'labeling-text' }
MenuItem >> labelText: aText [
	"Set a specific Text object to use when displaying the menu item.  This is optional, since the regular label String will be used if no specific label Text object is specified with the method.  
	Typically it is not desirable to set a specific labelText object because the MenuItemView will choose an appropriate one based on the regular label string.
	Labels ending in an ellipsis (...) (three consecutive periods) denote that the menu item initiates the beginning of an action (rather than the whole action).  A particular LookPolicy may modify the ending ellipsis (when the label is displayed) if another convention is used for that meaning."
	
	self realAdornment labelText: aText
]

{ #category : #literalArrayEncoding }
MenuItem >> literalArrayEncoding [
	"Answer a literal array encoding of the receiver."
	
	| oc key m im |
	oc := OrderedCollection new.
	oc add: self class fullyQualifiedReference.
	oc add: #rawLabel:.
	oc add: self rawLabel literalArrayEncoding.
	self isEnabled
		ifFalse:
			[oc
				add: #enabled:;
				add: false].
	self nameKey notNil
		ifTrue:
			[oc
				add: #nameKey:;
				add: self nameKey].
	self value notNil
		ifTrue:
			[oc
				add: #value:;
				add: self value].
	self color notNil
		ifTrue:
			[oc
				add: #color:;
				add: self color literalArrayEncoding].
	self hasIndication
		ifTrue:
			[oc
				add: #indication:;
				add: self isOn].
	self enablementSelector notNil
		ifTrue:
			[oc
				add: #enablementSelector:;
				add: self enablementSelector].
	self indicationSelector notNil
		ifTrue:
			[oc
				add: #indicationSelector:;
				add: self indicationSelector].
	self hidden == true
		ifTrue:
			[oc
				add: #hidden:;
				add: true].
	(key := self shortcutKeyCharacter) == nil
		ifFalse:
			[oc
				add: #shortcutKeyCharacter:;
				add: key.
			oc
				add: #shortcutModifiers:;
				add: self shortcutModifiers].
	(im := self realLabelImage) notNil
		ifTrue:
			[oc
				add: #labelImage:;
				add: im literalArrayEncoding].
	(m := self submenu) notNil
		ifTrue:
			[oc
				add: #submenu:;
				add: m literalArrayEncoding].
	(helpText isNil or: [helpText isString and: [helpText isEmpty]])
		ifFalse:
			[oc
				add: #helpText:;
				add: helpText literalArrayEncoding].
	^oc asArray
]

{ #category : #'shortcut key' }
MenuItem >> makeShortcutDisplayOnly [
	
	self
		shortcutModifiers:
			(self shortcutModifiers bitOr: MenuItemAdornment displayOnlyShortcutMask)
]

{ #category : #'name keys' }
MenuItem >> nameKey [
	
	^nameKey
]

{ #category : #'name keys' }
MenuItem >> nameKey: aSymbol [
	
	nameKey := aSymbol
]

{ #category : #'name keys' }
MenuItem >> position [
	
	^position
]

{ #category : #'name keys' }
MenuItem >> position: aPosition [
	
	position := aPosition
]

{ #category : #copying }
MenuItem >> postCopy [
	"Finish doing whatever is required, beyond a shallowCopy, to implement 'copy'. Answer the receiver."
	
	super postCopy.
	adornment := adornment copy.
	^self
]

{ #category : #printing }
MenuItem >> printOn: aStream [
	"Append to the argument aStream a sequence of characters that identifies the receiver."
	
	super printOn: aStream.
	aStream space.
	self label printOn: aStream
]

{ #category : #labeling }
MenuItem >> rawLabel [
	
	^[label evaluate]
		on: Error
		do: [:ex | ex return: label printString]
]

{ #category : #labeling }
MenuItem >> rawLabel: aCharacterArraySource [
	
	label := aCharacterArraySource
]

{ #category : #'private-adornment' }
MenuItem >> realAdornment [
	"Answer a MenuItemAdornment object for the receiver.  If one doesn't already exist, make one."
	
	adornment == nil ifTrue: [adornment := MenuItemAdornment new].
	^adornment
]

{ #category : #'labeling-image' }
MenuItem >> realLabelImage [
	"Answer the image (if any) to appear on the menu item (can be any 
	VisualComponent, or something that evaluates to one). Answer nil if 
	there isn't an image."
	
	adornment == nil
		ifTrue: [^nil]
		ifFalse: [^adornment labelImage]
]

{ #category : #'shortcut key' }
MenuItem >> shortcutKeyCharacter [
	"Answer the Character that is the shortcut key for this menu item.  Answer nil if none."
	
	adornment == nil
		ifTrue: [^nil]
		ifFalse: [^adornment shortcutKeyCharacter]
]

{ #category : #'shortcut key' }
MenuItem >> shortcutKeyCharacter: aCharacter [
	"Set the Character for the shortcut key for the receiver.  When displayed,
	 the capitalization may be changed in order to conform to the look&feel."
	
	self realAdornment shortcutKeyCharacter: aCharacter
]

{ #category : #'shortcut key' }
MenuItem >> shortcutKeyValue [
	"Answer the Character value that is the shortcut key for this menu item.  Answer nil if none."
	
	^adornment == nil
		ifTrue: [nil]
		ifFalse: [adornment shortcutKeyValue]
]

{ #category : #'shortcut key' }
MenuItem >> shortcutModifierSymbols [
	
	^self realAdornment shortcutModifierSymbols
]

{ #category : #'shortcut key' }
MenuItem >> shortcutModifiers [
	
	^self realAdornment shortcutModifiers
]

{ #category : #'shortcut key' }
MenuItem >> shortcutModifiers: anInteger [
	
	^self realAdornment shortcutModifiers: anInteger
]

{ #category : #'shortcut key' }
MenuItem >> shortcutString [
	"Answer the String representing the shortcut key combination for this menu item."
	
	^self realAdornment shortcutModifierString
		expandMacrosWith: self realAdornment shortcutKeyString asUppercase
]

{ #category : #submenu }
MenuItem >> submenu [
	"Answer the submenu (or nil if none) to appear with items to be choosen if the receiver is going to be chosen."
	
	adornment == nil
		ifTrue: [^nil]
		ifFalse: [^adornment submenu]
]

{ #category : #submenu }
MenuItem >> submenu: aMenuOrNil [
	"<aMenuOrNil> is either nil or an object (e.g., a Menu
	 or BlockClosure) that returns a Menu in response to
	 being sent the message #value."
	
	self realAdornment submenu: aMenuOrNil
]

{ #category : #submenu }
MenuItem >> submenuHolder [
	"Answer the submenuHolder (or nil if none) to appear with items to be choosen if the receiver is going to be chosen."
	
	adornment == nil
		ifTrue: [^nil]
		ifFalse: [^adornment submenuHolder]
]

{ #category : #accessing }
MenuItem >> truePerformerBlock: aOneArgBlock [
	
	self realAdornment truePerformerBlock: aOneArgBlock
]

{ #category : #accessing }
MenuItem >> truePerformerFor: aController [
	
	^(adornment == nil or: [adornment truePerformerBlock == nil])
		ifTrue: [nil]
		ifFalse: [adornment truePerformerBlock value: aController]
]

{ #category : #'shortcut key' }
MenuItem >> usesShortcutModifier: aSymbol [
	
	^self realAdornment usesShortcutModifier: aSymbol
]

{ #category : #value }
MenuItem >> value [
	
	^value
]

{ #category : #value }
MenuItem >> value: aValue [
	
	value := aValue
]

{ #category : #hidden }
MenuItem >> visible: aValue [
	"Invert of hidden:. Restricted to arguments which respond to value such as Booleans and Blocks."
	
	self hidden: [aValue value not]
]
