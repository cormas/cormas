star testing
noOccupantBut: anAgent
	"Purpose: tests if there is no occupant of any kind, excepted anAgent.
Useful from an agent perspective, to test if there are other agents on the cell: self patch noOccupantBut: self.
Return value: <Boolean>"
	
	| test |
	test := true.
	self theOccupants notNil
		ifTrue:
			[self theOccupants values
				do:
					[:list | list isEmpty ifFalse: [(list includes: anAgent) ifFalse: [test := false]]]].
	^test