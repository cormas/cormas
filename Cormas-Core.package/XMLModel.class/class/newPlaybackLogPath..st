paths
newPlaybackLogPath: aModel
	"From a model, return a new path for a partie.xml file"
	
	| xmlBase index |
	xmlBase := Cormas xmlPath: aModel class name.
	index := 1.
	[| path |
	path := xmlBase construct: 'partie-' , index printString , '.xml'.
	path exists ifFalse: [^path].
	index := index + 1] repeat