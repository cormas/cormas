description - primitives
commentsWithSimpleQuotes
	"Get the comments where the stored double quotes are changed as simple quotes"
	
	^self comments copyReplaceAll: #($") with: #($')	"embedded quotes get simple"