files
getSimAverageFilenameOfProbe: aProbeName
	"Returne a Sim Average Filename of aProbeName.
	aProbeName = <String>"
	
	^'SimAverage_' , aProbeName asString , self class extension