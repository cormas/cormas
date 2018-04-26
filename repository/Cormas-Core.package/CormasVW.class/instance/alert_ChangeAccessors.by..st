user messages
alert_ChangeAccessors: oldName by: newName
	
	| oldPop newPop text |
	oldPop := 'the' , oldName , 's'.
	newPop := 'the' , newName , 's'.
	text := 'Does Cormas rename the accessors of your model. \ ' withCRs
		asText.
	text := text , (oldPop asText emphasizeAllWith: #color -> ColorValue red)
		, ' by ' asText.
	text := text , (newPop asText emphasizeAllWith: #color -> ColorValue red)
		, '\' withCRs asText , '    and \ ' withCRs asText.
	text := text
		, ((oldPop , ':') asText emphasizeAllWith: #color -> ColorValue red)
		, ' by ' asText
		,
			((newPop , ':') asText emphasizeAllWith: #color -> ColorValue red) withCRs
				asText.
	^self confirm: text