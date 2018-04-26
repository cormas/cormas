ESE initialize-release
stringToFilename: aStringOrFilename
	"Returns a Filename from (aStringOrFilename) located into the current model 'maps' 
	directory (ex: 'cormas.env') "
	

	| aFilename |
	aStringOrFilename isString
		ifTrue:
			[aFilename := (Cormas mapsPath: (((self cormasModelClass name) allButFirst: 2) allButLast:5)) /	aStringOrFilename]
			"Very bad hack to remove CM and Model to a model name ..."
		ifFalse: [aFilename := aStringOrFilename].
	^aFilename