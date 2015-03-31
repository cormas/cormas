testing
hasAlreadySavedTheFiles
	"answer if saved files of a previous analysis exists"
	
	| desiredFiles |
	desiredFiles := self getFileNames.
	desiredFiles isEmpty ifTrue: [^false].
	^desiredFiles
		allSatisfy:
			[:selector | self dataSaver directory directoryContents includes: selector]