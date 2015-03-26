actions
loadAddOnsAndClose
	
	self loadAddOns.
	self closeAndUnschedule.
	self class isWinOpen: false