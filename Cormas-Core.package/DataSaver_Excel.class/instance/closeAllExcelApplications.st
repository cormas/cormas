release
closeAllExcelApplications
	
	filename := directory
		construct: self getAveragedTimeSeriesFilename asFilename.
	self excel halt	"	filename := directory construct: (self getLastValueFilename asFilename).  
	self excel closeApplication.
	filename := directory construct: (self getPeriodAverageFilename asFilename).  
	self excel closeApplication.
	filename := directory construct: (self getSimAverageFilename asFilename).  
	self excel closeApplication.
	filename := directory construct: (self getTimeSerieFilename asFilename).  
	self excel closeApplication."