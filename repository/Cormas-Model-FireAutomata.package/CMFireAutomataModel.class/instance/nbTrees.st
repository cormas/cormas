probes
nbTrees
	^ self theCMConwayCells count: [ :c | c state = #tree ]