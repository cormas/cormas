interface opening
unhighlight: aText from: aHighlighter
	
	^aText
		addEmphasis: #()
		removeEmphasis: StyleDescription codeNames
		allowDuplicates: false