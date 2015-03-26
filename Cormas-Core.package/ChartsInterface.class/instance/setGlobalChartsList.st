menus
setGlobalChartsList
	
	self levelClassName: cormasModel class name.
	self chartsList list: cormasModel globalCharts asSortedCollection asList.
	(self builder componentAt: #chartsNames) beVisible.
	(self builder componentAt: #chartsList) beVisible.
	(self builder componentAt: #id) beInvisible.
	(self builder componentAt: #idList) beInvisible.
	self builder window
		label: 'Charts - Global Level' , '     ' , self name value