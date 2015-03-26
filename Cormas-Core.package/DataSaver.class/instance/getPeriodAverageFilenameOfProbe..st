files
getPeriodAverageFilenameOfProbe: aProbeName
	"Returne a Period Average Filename of aProbeName.
	aProbeName = <String>"
	
	^'PeriodAverage_' , aProbeName asString , self class extension