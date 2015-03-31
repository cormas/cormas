ESE initialize-release
stringToFilename: aStringOrFilename
	"Returns a Filename from (aStringOrFilename) located into the current model 'maps' 
	directory (ex: 'cormas.env') "
	
	| aFilename |
	aStringOrFilename isString
		ifTrue:
			[aFilename := (Cormas mapsPath: self cormasModelClass name) construct:
					aStringOrFilename]
		ifFalse: [aFilename := aStringOrFilename].
	^aFilename