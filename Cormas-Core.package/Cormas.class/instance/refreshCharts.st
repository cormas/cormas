visualisation
refreshCharts
	
	self displayChartsWin do: [:aChart | aChart refreshAfterStep].
	Dev todo: 'change this system with a dependence to timestepvalue'.
	HistogramsInterface allInstances do: [:aChart | aChart refreshAfterStep]