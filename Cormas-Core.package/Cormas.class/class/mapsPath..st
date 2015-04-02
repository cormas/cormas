+ utilities - files
mapsPath: aModelClassName
	"Purpose: Returns a Filename corresponding to the path of the current model 'maps' directory.
Argument: aModelClassName = <String>
Example: (Cormas mapsPath: #FireModel) construct: 'zone.env' 	"
	
	| modelPath mapsPath |
	modelPath := self modelPath: aModelClassName.
	mapsPath := modelPath construct: 'maps'.
	mapsPath asFilename exists ifFalse: [mapsPath asFilename makeDirectory].
	^mapsPath