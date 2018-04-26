+ utilities - files
mapsPath: aModelClassName
	"Purpose: Returns a Filename corresponding to the path of the current model 'maps' directory.
Argument: aModelClassName = <String>
Example: (Cormas mapsPath: #FireModel) / 'zone.env' 	"
	
	| modelPath mapsPath |
	modelPath := self modelPath: aModelClassName.
	mapsPath := modelPath / 'maps'.
	mapsPath exists ifFalse: [mapsPath createDirectory].
	^mapsPath