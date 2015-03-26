actions_buttons
confirmContinue: listCAVs
	
	| text |
	text := 'Some parameters won''t be analysed! \OK to continue? \' withCRs
		asText emphasizeAllWith: #bold.
	listCAVs
		do:
			[:defAttrib | 
			text := text
				, (defAttrib targetClass name asText emphasizeAllWith: #(#italic)).
			text := text , ' - ' asText.
			text := text
				,
					(defAttrib targetAttribute asString asText emphasizeAllWith: #(#italic)).
			text := text , '    --> ' asText.
			text := text
				,
					(defAttrib currentValueAsString asText
						emphasizeAllWith: #color -> ColorValue red) asText.
			text := text , '\' withCRs asText].
	^Dialog confirm: text asText