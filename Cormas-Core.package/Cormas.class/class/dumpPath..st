paths
dumpPath: aModelClassName
	"Returns a Filename corresponding to the path of the current model 'dump' directory.
	aModelClassName = <String>"
	
	| modelPath mapsPath |
	modelPath := self modelPath: aModelClassName.
	mapsPath := modelPath construct: 'dump'.
	mapsPath asFilename exists ifFalse: [mapsPath asFilename makeDirectory].
	^mapsPath