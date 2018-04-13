probes
alive
	^ (self theCMConwayCells count: [ :c | c state = #alive ]) / self theCMConwayCells size