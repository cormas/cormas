user messages
confirm_IsAbstractClass: aClass
	
	| text |
	Dev todo: 'Il y a TextStream pour faire √ßa'.
	text := '                                           Is ' asText
		emphasizeAllWith: #bold.
	text := text , (aClass name asText emphasizeAllWith: #(#bold #italic)).
	text := text
		,
			((' an Abstract class?' , '\' withCRs) asText emphasizeAllWith: #(#bold)).
	text := text
		,
			' (an abstract class does not have instance and must have subclasses, while \'
				withCRs asText.
	text := text , ' a concret class will have instances and '
		, self cormasModelClass name , ' will define an attribut called ' asText.
	text := text
		,
			(('the' , aClass name , 's') asText
				emphasizeAllWith: #color -> ColorValue red) asText.
	text := text , ').' asText.
	^self confirm: text asText