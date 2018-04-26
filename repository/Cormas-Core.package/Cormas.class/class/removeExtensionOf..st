util_files
removeExtensionOf: aFilename
	"convert and return the filename titi.ext as 'titi'"
	
	| aString index |
	aString := aFilename asString.
	index := aString
		indexOfSubCollection: aFilename extension
		startingAt: 1.
	index = 0 ifTrue: [^aFilename].
	^(aString
		copyReplaceFrom: index
		to: aString size
		with: '') asFilename