- testing
isCrossedByArc: anArc
	"answer if the Aggregate is crossed by anArc"
	
	| arcLine |
	self halt.	"does not work anymore. an ESE does not know directly it bounds."
	arcLine := LineSegment
		from: anArc startCell center
		to: anArc stopCell center.
	self components
		do: [:c | (arcLine outlineIntersects: c bounds) ifTrue: [^true]].
	^false