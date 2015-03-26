description - primitives
descriptionTextFromFirstDate: firstDate lastDate: lastDate authors: list1 emails: list2 comments: additionalText
	
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
			((firstDate , '\') asText emphasizeAllWith: #color -> ColorValue red)
				withCRs asText.
	txt := txt , 'Last update : ' asText
		,
			((lastDate , '\') asText emphasizeAllWith: #color -> ColorValue red)
				withCRs asText.
	list1 size > 1
		ifTrue:
			[txt := txt , ('Authors\' withCRs asText emphasizeAllWith: #(#bold #large))]
		ifFalse:
			[txt := txt , ('Author\' withCRs asText emphasizeAllWith: #(#bold #large))].
	list1
		with: list2
		do:
			[:a :e | 
			txt := txt , a , ' ' asText
				, (('   ' , e , '\') asText emphasizeAllWith: #italic) withCRs asText].
	txt := txt
		, ('Comments\' withCRs asText emphasizeAllWith: #(#bold #large)).
	txt := txt , (additionalText , '\') withCRs asText.
	^txt