autocomplete extension
knownReceiverSearchFor: aParagraphEditor
	
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