actions
verify
	
	| outTransitions |
	(self drawing components contains: [:fig | fig class = StartFigure])
		ifFalse:
			[self cormas warn: 'Error: there is no Start Point'.
			^false].
	(self drawing components select: [:fig | fig class = StartFigure]) size >
			1
		ifTrue:
			[self cormas warn: 'Error: there is more than one Start Point'.
			^false].
	(self drawing components contains: [:fig | fig class = EndFigure])
		ifFalse:
			[self cormas warn: 'Error: there is no End Point'.
			^false].
	outTransitions := (self drawing components
		detect: [:fig | fig class = StartFigure]) model outgoing.
	outTransitions isEmpty
		ifTrue:
			[self cormas warn: 'Error: the Start Point has no outgoing transition'.
			^false].
	outTransitions size > 1
		ifTrue:
			[self cormas warn:
					'Error: the Start Point has more than one outgoing transition'.
			^false].
	(self drawing components select: [:fig | fig class = ActivityFigure])
		do:
			[:act | 
			| s |
			s := act model selectedActivity value.
			s = ActivityModel defaultName
				ifTrue:
					[self cormas warn: 'Error: an activity has no name << ?? >>'.
					^false].
			act model incoming isEmpty
				ifTrue:
					[self cormas warn:
							'Error: the activity %<%<<1s>>> has no incoming transition' with: s.
					^false].
			act model outgoing isEmpty
				ifTrue:
					[self cormas warn:
							'Error: the activity %<%<<1s>>> has no outgoing transition' with: s.
					^false]].
	(self drawing components select: [:fig | fig class = DiamondFigure])
		do:
			[:act | 
			| s |
			s := act model selectedActivity value.
			s = DecisionPointModel defaultName
				ifTrue:
					[self cormas warn: 'Error: a Decision Point has no name << ?? >>'.
					^false].
			act model incoming isEmpty
				ifTrue:
					[self cormas
						warn:
							'Error: the Decision Point %<%<<1s>' , act model selectedActivity value ,
									'>> has no incoming transition'
						with: s.
					^false].
			act model outgoingTrue isNil
				ifTrue:
					[self cormas warn:
							'Error: the Decision Point %<%<<1s>>> has no outgoing transition for [TRUE]'
						with: s.
					^false].
			act model outgoingFalse isNil
				ifTrue:
					[self cormas warn:
							'Error: the Decision Point %<%<<1s>>> has no outgoing transition for [FALSE]'
						with: s.
					^false]].
	^true