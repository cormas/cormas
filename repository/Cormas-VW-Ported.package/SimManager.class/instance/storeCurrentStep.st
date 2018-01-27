replay-store/restore
storeCurrentStep
	"store the current step into the appropriate Dump folder (store After the step execution)"
	
	| finename |
	finename := self simFolder
		construct: (self stepFileNameAtStep: self currentTime).
	finename exists
		ifTrue:
			[self simFolder: self class newFolder.
			^self storeCurrentStep].
	self cormasModel dumpOrganizationOnFile: finename.
	self traceSize < self currentTime ifTrue: [traceSize := self currentTime]