model saving&loading
checkDirectoryName: aName
	"Check if the directory name starts with an Uppercase (and if it contains blanks). If no, renames the directory and returns the new name"
	
	| modelsDirectory targetDirectory nameWithoutBlank |
	aName isEmpty
		ifTrue:
			[self warn: 'Directory name is empty ! '.
			^nil].
	nameWithoutBlank := Cormas checkIfNameContainsBlank: aName.
	(nameWithoutBlank first isUppercase and: [nameWithoutBlank = aName])
		ifTrue: [^nameWithoutBlank].
	modelsDirectory := self class modelsPath asFilename.
	modelsDirectory directoryContents
		do:
			[:aDir | 
			aDir = aName
				ifTrue:
					[(modelsDirectory construct: aDir) isDirectory
						ifTrue: [targetDirectory := modelsDirectory construct: aDir]]].
	nameWithoutBlank
		at: 1
		put: nameWithoutBlank first asUppercase.
	targetDirectory
		renameTo: (modelsDirectory construct: nameWithoutBlank) asFilename.
	self
		alert_renameDirectory:
			(modelsDirectory construct: nameWithoutBlank) asString.
	^nameWithoutBlank