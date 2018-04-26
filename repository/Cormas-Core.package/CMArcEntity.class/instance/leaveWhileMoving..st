+ procedures
leaveWhileMoving: isBeingMoved
	"The situated Arc is not located any more. But it is still 'alive'  "
	
	patch isNil ifTrue: [^self].
	patch := nil.
	startNode isNil
		ifFalse:
			[startNode patch isNil
				ifFalse:
					[(startNode patch occupants: self class name)
						remove: self
						ifAbsent: []].
			startNode removeArc: self].
	stopNode isNil
		ifFalse:
			[stopNode patch isNil
				ifFalse:
					[(stopNode patch occupants: self class name)
						remove: self
						ifAbsent: []].
			stopNode removeArc: self].
	isBeingMoved
		ifFalse:
			[self currentSimulation
				registerEntityChange: #leavingOccupant
				from: (EntityReference on: self)]