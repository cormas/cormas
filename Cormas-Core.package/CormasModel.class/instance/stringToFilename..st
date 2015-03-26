utilities - files
stringToFilename: aStringOrFilename
	"Returns a Filename from (aStringOrFilename) located into the current model 'data' 
	directory (ex: 'cormas.env') "
	
	| aFilename |
	aStringOrFilename isString
		ifTrue:
			[aFilename := (Cormas dataPath: self class name) construct:
					aStringOrFilename]
		ifFalse: [aFilename := aStringOrFilename].
	^aFilename