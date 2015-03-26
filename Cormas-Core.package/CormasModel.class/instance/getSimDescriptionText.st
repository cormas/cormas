+ user interface
getSimDescriptionText
	"returns a text describing the information of the current simulation"
	
	| txt |
	txt := 'Model name : ' asText
		,
			((self class name , '\\') asText emphasizeAllWith: #color -> ColorValue red)
				withCRs asText emphasizeAllWith: #(#bold #large).	"txt := txt , 'Simulation duration: ' asText , ((333 printString , 'secondes \') asText emphasizeAllWith: #color -> ColorValue red) withCRs asText."
	txt := txt , 'Initialization: ' , (String with: Character tab)
		, '#' asText
		,
			((self activeInit , '\') asText emphasizeAllWith: #italic) withCRs asText.
	txt := txt , 'Control:        ' , (String with: Character tab)
		, '#' asText
		,
			((self activeControl , '\') asText emphasizeAllWith: #italic) withCRs
				asText.
	txt := txt , 'Random seed: ' , (String with: Character tab)
		,
			((Cormas seed printString , '\') asText emphasizeAllWith: #italic) withCRs
				asText.	"txt := txt , ('Comments\' withCRs asText emphasizeAllWith: #(#bold #large)).
	txt := txt , ((self commentsWithSimpleQuotes , '\') withCRs asText emphasizeAllWith: #(#large))."
	^txt