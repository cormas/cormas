actions
pingClient
	
	self clients selection
		ifNotNil:
			[:c | 
			self
				updateStatus: #pingClientStatus
				toColor: (self statusColorFor: (self ping: c distributionControl))]