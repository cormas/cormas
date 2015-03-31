updating
noticeEntityChange: anEntityChange
	
	| changeType anEntityReference parameter |
	changeType := anEntityChange symbol.
	anEntityReference := anEntityChange entity.
	parameter := anEntityChange parameter.
	changeType = #valueChanged
		ifTrue:
			[^parameter
				ifNil: [self updateEntity: anEntityReference]
				ifNotNil: [:p | self updateEntity: anEntityReference onPatch: p]].
	changeType = #movingOccupant
		ifTrue: [^self moveOccupant: anEntityReference on: parameter].
	changeType = #newOccupant
		ifTrue: [^self displayOccupant: anEntityReference on: parameter].
	changeType = #removeEntity ifTrue: [^self removeEntity: anEntityReference].
	changeType = #leavingOccupant
		ifTrue: [^self removeOccupant: anEntityReference].
	changeType = #newArc
		ifTrue: [^self displayArc: anEntityReference on: parameter].
	changeType = #movingArc
		ifTrue: [^self moveOccupant: anEntityReference on: parameter].
	changeType = #addAggregate
		ifTrue:
			[^self displayCompoundSpatialEntity: anEntityReference withComponents:
					parameter].
	changeType = #compositionChanged
		ifTrue:
			[^self redisplayCompoundSpatialEntity: anEntityReference withComponents:
					parameter].
	changeType = #newStartPosition
		ifTrue: [^self moveArcStart: anEntityReference to: parameter].
	changeType = #newStopPosition
		ifTrue: [^self moveArcStop: anEntityReference to: parameter].
	changeType = #povSymbolChanged
		ifTrue: [^self updateEntity: anEntityReference ifPovNameIs: parameter].
	changeType = #flash
		ifTrue:
			[^self drawing flashColor: parameter entityReference: anEntityReference]