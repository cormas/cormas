interface opening
addCodeHighlighter
	"(Highlighter Extension - private - not for general use - may be removed at any time)

	 If highlighting is enabled for the receiver, add a code highlighter."
	
	<highlighter>
	self class environment == Browser
		ifTrue:
			[CodeHighlighter
				on: self textController
				for: self]