remoting
openDistributionControl
	
	self cormasModel
		ifNil:
			[^Dialog warn:
					'A model must be loaded to open the Distribution window manager'].
	^self distributionControl reopen