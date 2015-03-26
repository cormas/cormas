probes - charts
initLocalCharts
	
	self localCharts
		do:
			[:s | 
			self
				perform: (s asString , ':') asSymbol
				with: (self perform: s) class new].
	self updateLocalCharts: 0