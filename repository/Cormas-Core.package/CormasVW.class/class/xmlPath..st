paths
xmlPath: aModelClassName
	"Returns a Filename corresponding to the path of the current model 'xml' directory.
	aModelClassName = <String>"
	
	| modelPath xmlPath |
	modelPath := self modelPath: aModelClassName.
	xmlPath := modelPath construct: 'xml'.
	xmlPath asFilename exists ifFalse: [xmlPath asFilename makeDirectory].
	^xmlPath