ESE initialize-release
stringToFilename: aStringOrFilename
	"Returns a Filename from (aStringOrFilename) located into the current model 'maps' 
	directory (ex: 'cormas.env') "

	| aFilename modelFolderName |
	aStringOrFilename isString
		ifTrue: [ "Very bad hack to remove CM and Model to a model name ..."
			
	self flag: #shouldBeRevised.
			modelFolderName := self cormasModelClass name.
			(modelFolderName beginsWith: 'CM')
				ifTrue: [ modelFolderName := modelFolderName allButFirst: 2 ].
			(modelFolderName endsWith: 'Model')
				ifTrue: [ modelFolderName := modelFolderName allButLast: 5 ].
			aFilename := (Cormas mapsPath: modelFolderName) / aStringOrFilename ]
		ifFalse: [ aFilename := aStringOrFilename ].
	^ aFilename