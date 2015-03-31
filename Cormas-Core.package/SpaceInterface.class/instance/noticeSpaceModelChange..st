updating
noticeSpaceModelChange: aChange
	"the spaceModel has change"
	
	self
		update: aChange symbol
		with: aChange parameter
		from: self