interface opening
highlight: aText from: aHighlighter
	
	^CodeHighlightingParser
		formatMethod: aText
		forClass: self selectedClass
		namespace: self doItEnvironment