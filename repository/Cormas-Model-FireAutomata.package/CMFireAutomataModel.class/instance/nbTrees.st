probes
nbTrees
	^ self theCMFireAutomataCells  count: [ :c | c state = #tree ]