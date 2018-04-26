description - primitives
addClassComment
	"Set the comment of the class"
	
	| noComment index classComment |
	self comments = 'Not yet commented...' ifTrue: [^nil].	"self comment = '' ifTrue:[(Refactory.Browser.BrowserCommentTool codeModel: ((Refactory.Browser.CodeModel navigator: (Refactory.Browser.Navigator new)) setClass: self)) defaultClassComment]. "	"pour que les commentaires par defaut soient g√©n√©r√©s, avec les attributs etc... mais bon..."
	self comment = '' ifTrue: [^nil].
	noComment := 'has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.'.
	classComment := self comment.
	index := classComment indexOfSubCollection: noComment startingAt: 1.
	index = 0
		ifTrue:
			[classComment = ''
				ifTrue: [classComment := self comments]
				ifFalse:
					[index := classComment indexOfSubCollection: '***' startingAt: 1.
					classComment := classComment
						copyReplaceFrom: 1
						to: index - 2
						with: self comments withCRs]]
		ifFalse:
			[classComment := classComment
				copyReplaceFrom: 1
				to: index + noComment size
				with: self comments , '\ ***' withCRs].
	self comment: classComment	"replaceElementsFrom: start to: stop withByteEncodedString: replacement startingAt: repStart 
startingAt: repStart replaceElementsIn: collection from: start to: stop
copyReplaceFrom: start to: stop with: replacement
containsSubstring: aString

stDocumentation:
comment:"