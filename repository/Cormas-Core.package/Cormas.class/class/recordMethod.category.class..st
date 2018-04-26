- printing - documentation
recordMethod: sel category: cat class: aClass
	
	| source parser header endOfHeader thisComment |
	source := aClass sourceCodeAt: sel.
	source isEmpty ifTrue: [^self].
	(parser := self parserClass new) parseSelector: source.
	endOfHeader := parser endOfLastToken.
	[(source at: endOfHeader) isSeparator]
		whileTrue: [endOfHeader := endOfHeader - 1].	"back up over white space"
	header := source
		copyFrom: 1
		to: (endOfHeader min: source size).
	thisComment := parser
		parseMethodComment: source
		setPattern: [:none | none].
	thisComment isEmpty ifFalse: [thisComment := thisComment first].
	^Association
		key:
			(header string , '& [' , aClass name asString , ' >> ' , cat asString , ']')
				asSymbol
		value: thisComment