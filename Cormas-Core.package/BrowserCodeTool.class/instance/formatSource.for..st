updating
formatSource: aCharacterArray for: aCompiledMethod
	
	| text |
	text := aCharacterArray.
	BrowseAutoFormat == true ifTrue: [text := self formattedText: text].
	text := text asText makeSelectorBoldIn: self methodClass.
	aCompiledMethod isProbed ifTrue: [aCompiledMethod highlightProbesIn: text].
	text addHyperlinkEmphases.
	^text