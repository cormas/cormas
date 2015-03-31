deprecated
dispatchMovingOccupant: anOccupant
	
	self halt.	"should not use anymore -> replaced by a registerChangeFor: "
	self changed: #movingOccupant with: anOccupant	"dispatch the info to all spaceInterfaces"