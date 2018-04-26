probes - charts
initGlobalCharts
	
	self globalCharts
		do:
			[:s | 
			self
				perform: (s asString , ':') asSymbol
				with: (self perform: s) class new].
	self updateGlobalCharts: 0