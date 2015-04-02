- dispatch
newStopPosition: aCell
	
	self currentSimulation
		registerEntityChange: #newStopPosition
		with: (EntityReference on: aCell)
		from: (EntityReference on: self)