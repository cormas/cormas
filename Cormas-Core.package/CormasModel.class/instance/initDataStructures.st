probes - recording
initDataStructures
	
	self resetDataStructures.
	self setDataStructures.
	self cormas ifNil: [^nil].
	self cormas refreshCharts