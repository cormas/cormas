probes
nbFires
	^ self theCMFireAutomataCells count: [ :c | c state = #fire ]