paths
videoPath: aModelClassName
	"Returns a Filename corresponding to the path of the current model 'video' directory.
	aModelClassName = <String>"
	
	| modelPath videoPath |
	modelPath := self modelPath: aModelClassName.
	videoPath := modelPath construct: 'video'.
	videoPath asFilename exists ifFalse: [videoPath asFilename makeDirectory].
	^videoPath