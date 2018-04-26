star testing
hasOccupantType: locatedEntityName
"Purpose: test if there is an occupant of a given type.
Argument: locatedEntityName = <Symbol | AgentLocation | ObjectLocation>
Return value: <Boolean>
Example: self hasOccupantType: #Tree"
	
	^(self occupantsAt: locatedEntityName) isEmpty not