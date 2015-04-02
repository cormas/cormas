- dispatch
newStartPosition: aCell
	
	self currentSimulation
		registerEntityChange: #newStartPosition
		with: (EntityReference on: aCell)
		from: (EntityReference on: self)