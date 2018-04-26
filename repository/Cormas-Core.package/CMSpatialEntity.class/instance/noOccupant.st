star testing
noOccupant
"Purpose: tests if there is no occupant of any kind.
Return value: <Boolean>"

	| test |
	test := true.
	self theOccupants notNil ifTrue: [self theOccupants values do: [:list | list isEmpty ifFalse: [test := false]]].
	^test