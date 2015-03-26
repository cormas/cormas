confirm
confirmRedefine
	" 'Getter accessor for 'XXX already defined. 
	Overwrite it  ?"
	
	| text |
	" 'Getter accessor for ', getterMethod asString, ' already defined. \Overwrite it  ?' withCRs"
	text := 'Getter accessor for ' asText.
	text := text
		, (self targetAttribute asString asText emphasizeAllWith: #bold).
	text := text , ' (defaultValue: ' asText.
	text := text
		, (self currentValue asString asText emphasizeAllWith: #(#italic)).
	text := text , ') is already defined. \Overwrite it  ?' asText withCRs.	"	(defAttrib currentValueAsString asText
						emphasizeAllWith: #color -> ColorValue red) asText."
	^Dialog confirm: text asText