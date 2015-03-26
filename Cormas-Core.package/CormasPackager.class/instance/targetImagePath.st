accessing
targetImagePath
	"the path to the generated image (directory + imageName without extension) as a Filename.
	this path give all informations about the directory and the filenames for the image and the vm.
	take the actual choosen targetFile without its extension (.exe)"
	
	| s |
	s := self targetFileVM value asString.
	s size <= 4 ifTrue: [self error: 'Problem with the targetFile'].
	^(s
		copyFrom: 1
		to: s size - 4) asFilename