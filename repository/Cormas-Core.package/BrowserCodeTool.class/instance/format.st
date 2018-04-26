accepting
format
	
	| newText node |
	node := RBParser
		parseMethod: self textController text
		onError: [:aString :position | ^self insertError: aString at: position].
	newText := (self formattedNode: node) asText.
	newText makeSelectorBoldIn: self methodClass.
	self textNoChange: newText