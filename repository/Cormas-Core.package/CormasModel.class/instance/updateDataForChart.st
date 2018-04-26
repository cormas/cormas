probes - recording
updateDataForChart
	"Update the global and local data and refresh the charts"
	
	self
		updateGlobalData;
		updateLocalData.
	self cormas refreshCharts