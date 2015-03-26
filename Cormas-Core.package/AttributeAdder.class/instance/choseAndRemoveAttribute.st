actions_butons
choseAndRemoveAttribute
	
	| aCAV list answer |
	list := self classAttribValue_List listHolder value.
	list := list select: [:cav | cav targetClass isMeta not].
	list := list collect: [:cav | cav targetAttribute asString].
	answer := Dialog
		choose: 'Which attribute do you want to remove?'
		fromList: list
		values: list
		lines: (list size min: 10)
		cancel: [#cancel].
	answer = #cancel ifTrue: [^nil].
	aCAV := self classAttribValue_List listHolder value
		detect: [:cav | cav targetAttribute = answer asSymbol].
	^self removeAttributeOf: aCAV