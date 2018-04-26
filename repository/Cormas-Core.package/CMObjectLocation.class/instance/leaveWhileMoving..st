- moving
leaveWhileMoving: isBeingMoved
	"The situated object is not located any more. But it is still 'alive'  "
	
	self patch isNil ifTrue: [^self].
	isBeingMoved
		ifFalse:
			["The situated agent doesn't move; it is not located any more. But it is still 'alive'  "
			self currentSimulation spaceModel ifNil: [^nil].
			self currentSimulation spaceModel logLeaveOf: self from: patch.
			self currentSimulation
				registerEntityChange: #leavingOccupant
				from: (EntityReference on: self)].
	(self patch theOccupants at: self class name)
		remove: self
		ifAbsent: [].
	self patch: nil