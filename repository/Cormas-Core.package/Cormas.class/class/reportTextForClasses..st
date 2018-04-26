- printing - documentation
reportTextForClasses: aCollec
	"Answer a Text containing a list ordered in alphabetic order of all the method definitions of a given collection of classes."
	
	| stream dictionaries methodName classProt comment dict dictClass dictAll i |
	stream := TextStream on: (String new: 100).
	dict := Dictionary new.
	dictClass := Dictionary new.
	dictAll := Dictionary new.
	aCollec
		do:
			[:aClass | 
			dictionaries := self recordDictClass: aClass.
			dictionaries first
				keysAndValuesDo:
					[:k :v | 
					"dict at: k put: v. "
					dictAll at: k put: v].
			dictionaries last
				keysAndValuesDo:
					[:k :v | 
					"dictClass at: k put: v. "
					dictAll at: k put: v]].
	dictAll keys asSortedCollection
		do:
			[:k | 
			methodName := (k tokensBasedOn: $&) first.
			classProt := (k tokensBasedOn: $&) last.
			comment := dictAll at: k.
			i := 0.
			(methodName tokensBasedOn: Character space)
				do:
					[:s | 
					i := i + 1.
					stream
						emphasis:
							((i \\ 2) isZero
								ifTrue: [self emphasisForMethodHeaderArg]
								ifFalse: [self emphasisForMethodHeader]).
					stream
						nextPutAll: s;
						space].
			stream emphasis: self emphasisForProtocol.
			stream
				nextPutAll: classProt;
				cr.
			stream emphasis: self emphasisForMethodComment.
			stream
				nextPutAll: comment;
				cr;
				cr].
	^stream contents