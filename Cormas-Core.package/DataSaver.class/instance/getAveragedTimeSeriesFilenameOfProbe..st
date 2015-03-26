files
getAveragedTimeSeriesFilenameOfProbe: aProbeName
	"Returne an Averaged time Series Filename of aProbeName.
	aProbeName = <String>"
	
	^'AveragedTimeSeries_' , aProbeName asString , self class extension