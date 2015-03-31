deprecated
dispatchLeavingOccupant: aLeavingOccupant
	
	self halt.	"should not use anymore -> replaced by a registerChangeFor: "
	self
		changed: #changedEntity
		with: #leavingOccupant -> aLeavingOccupant	"dispatch the info to all spaceInterfaces"