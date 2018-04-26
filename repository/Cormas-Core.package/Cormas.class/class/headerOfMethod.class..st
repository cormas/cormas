- printing - documentation
headerOfMethod: sel class: aClass
	
	| source parser header endOfHeader |
	source := aClass sourceCodeAt: sel.
	source isEmpty ifTrue: [^nil].
	(parser := self parserClass new) parseSelector: source.
	endOfHeader := parser endOfLastToken.
	[(source at: endOfHeader) isSeparator]
		whileTrue: [endOfHeader := endOfHeader - 1].	"back up over white space"
	header := source
		copyFrom: 1
		to: (endOfHeader min: source size).
	^header