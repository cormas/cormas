files
getLastValueFilenameOfProbe: aProbeName
	"Returne a LastValue Filename of aProbeName.
	aProbeName = <String>"
	
	^'LastValue_' , aProbeName asString , self class extension