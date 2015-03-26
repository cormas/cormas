probes - charts
updateGlobalCharts: t
	
	self globalCharts
		do:
			[:s | (self perform: s) add: (self perform: (s asString , 'Data') asSymbol)]