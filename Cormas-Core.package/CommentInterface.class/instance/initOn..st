initialize-release
initOn: aModelClass
	"modelName creationDate eMailList authorList modelComments"
	
	modelName := aModelClass name asString asValue.
	aModelClass creationDate = ' '
		ifTrue: [creationDate := Date today printString asValue]
		ifFalse: [creationDate := aModelClass creationDate asValue].
	aModelClass getAuthors
		do: [:author | self authorMailList list add: author].
	aModelClass comments = 'Not yet commented...'
		ifFalse: [modelComments := aModelClass comments asValue]