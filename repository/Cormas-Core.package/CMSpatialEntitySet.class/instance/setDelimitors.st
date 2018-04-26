- displaying
setDelimitors
	"outline = external Polyline.
internalLines  = collection of Polylines. nbSegments lineWidth "
	
	| segments duplicates |
	segments := OrderedCollection new.
	self components
		do:
			[:aPov | aPov outline edgesDo: [:i :j | segments add: (LineSegment from: i to: j)]].	"Lines with equal endpoints but opposite directions will be also removed"
	duplicates := Set new.
	segments
		do:
			[:seg1 | 
			segments
				do:
					[:seg2 | 
					seg1 == seg2
						ifFalse:
							[seg1 = seg2
								ifTrue:
									[duplicates
										add: seg1;
										add: seg2].
							seg1
								=
									(LineSegment
										from: seg2 end
										to: seg2 start)
								ifTrue:
									[duplicates
										add: seg1;
										add: seg2]]]].
	segments
		do:
			[:seg1 | 
			segments
				do:
					[:seg2 | 
					seg1 == seg2
						ifFalse:
							[((seg1 start = seg2 start and: [seg1 end = seg2 end])
								or:
									[(seg1 start = seg2 end and: [seg1 end = seg2 start])
										or: [seg1 end = seg2 start and: [seg1 start = seg2 end]]])
								ifTrue:
									[duplicates
										add: seg1;
										add: seg2]]]].
	segments removeAll: duplicates