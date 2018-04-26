star testing
noOccupantType: locatedEntityName
"Purpose: tests if there is no occupant of given type.
Argument: locatedEntityName = <Symbol | AgentLocation | ObjectLocation>
Return value: <Boolean>
Example: self noOccupantType: #Tree"
	
	^(self occupantsAt: locatedEntityName) isEmpty