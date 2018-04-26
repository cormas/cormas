simulation
run
	"Run the current  simulation. Threaded process"
	
	self cormasModelClass isNil ifTrue: [^nil].
	self cormasModel activeControl isNil ifTrue: [^self alert_NoDynamic].
	self stepCounter value = self cycle value ifTrue: [^nil].	"for old cormas versions"
	(self cormasModel activeControl asString tokensBasedOn: $:) size = 3
		ifTrue: [^self runNSimulations_old].	"*******  RUN  threaded *******"
	self simManager runSimulationThreaded