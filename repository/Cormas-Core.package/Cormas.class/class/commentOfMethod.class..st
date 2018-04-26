- printing - documentation
commentOfMethod: sel class: aClass
	"Answer a String with the comment of the method"
	
	| source parser thisComment |
	source := (aClass findSelector: sel) first sourceCodeAt: sel.
	source isEmpty ifTrue: [^self].
	(parser := self parserClass new) parseSelector: source.
	thisComment := parser
		parseMethodComment: source
		setPattern: [:none | none].
	thisComment isEmpty
		ifTrue: [^'']
		ifFalse: [^thisComment first]