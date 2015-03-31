replay-private
simFolder
	"return the appropriate Dump folder = simName"
	
	simFolder
		ifNil:
			[simFolder := (Cormas dumpPath: self cormasModel class name)
				construct: self simName].
	simFolder exists ifFalse: [simFolder makeDirectory].
	^simFolder