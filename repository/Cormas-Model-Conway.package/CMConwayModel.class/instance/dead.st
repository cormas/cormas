probes
dead
	^ (self theCMConwayCells count: [ :c | c state = #dead ]) / self theCMConwayCells size