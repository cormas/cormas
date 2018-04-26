replay-private
simFolder
	"return the appropriate Dump folder = simName"
	
	simFolder
		ifNil: [ simFolder := (Cormas dumpPath: self cormasModel class name) / self simName ].
	simFolder ensureCreateDirectory. 
	^ simFolder