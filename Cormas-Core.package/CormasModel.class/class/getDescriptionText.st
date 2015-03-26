description - primitives
getDescriptionText
	"returns a text describing the model, its version, its compatibility and the authors"
	
	| txt |
	txt := 'Model name : ' asText
		,
			((self name , '\') asText emphasizeAllWith: #color -> ColorValue red)
				withCRs asText emphasizeAllWith: #(#bold #large).
	txt := txt , 'Current version : ' asText
		,
			((self version , '\') asText emphasizeAllWith: #color -> ColorValue red)
				withCRs asText.
	txt := txt , 'Creation date : ' asText
		,
			((self creationDate , '\') asText
				emphasizeAllWith: #color -> ColorValue red) withCRs asText.
	txt := txt , 'Last update : ' asText
		,
			((self lastUpdate , '\') asText emphasizeAllWith: #color -> ColorValue red)
				withCRs asText.
	txt := txt , 'Cormas compatibility : ' asText
		,
			(((Cormas versionAsString: self cormasCompatibleVersion) , '\') asText
				emphasizeAllWith: #color -> ColorValue red) withCRs asText.
	txt := txt , 'VW compatibility : ' asText
		,
			((Cormas vwCompatibleVersion printString , '\') asText
				emphasizeAllWith: #color -> ColorValue red) withCRs asText.
	(Cormas textAsList: self authors) size > 1
		ifTrue:
			[txt := txt , ('Authors\' withCRs asText emphasizeAllWith: #(#bold #large))]
		ifFalse:
			[txt := txt , ('Author\' withCRs asText emphasizeAllWith: #(#bold #large))].
	(Cormas textAsList: self authors)
		with: (Cormas textAsList: self emails)
		do:
			[:a :e | 
			txt := txt , a , ' ' asText
				, (('   ' , e , '\') asText emphasizeAllWith: #italic) withCRs asText].
	txt := txt
		, ('Comments\' withCRs asText emphasizeAllWith: #(#bold #large)).
	txt := txt
		,
			((self commentsWithSimpleQuotes , '\') withCRs asText emphasizeAllWith:
					#(#large)).
	^txt