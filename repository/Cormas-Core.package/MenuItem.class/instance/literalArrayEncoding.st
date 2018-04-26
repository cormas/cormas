literalArrayEncoding
literalArrayEncoding
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