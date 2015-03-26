files
getTimeSerieFilenameOfProbe: aProbeName
	"Returne a time Series Filename of aProbeName.
	aProbeName = <String>"
	
	^'TimeSeries_' , aProbeName asString , self class extension