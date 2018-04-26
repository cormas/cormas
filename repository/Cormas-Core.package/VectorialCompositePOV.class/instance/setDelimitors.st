delimitors
setDelimitors
	"outline = external Polyline.
internalLines  = collection of Polylines. nbSegments lineWidth "
	
	| allSegments duplicates |
	allSegments := OrderedCollection new.	"roundedOutline, car 2 points qui semblent identiques (m√™me valeur de x et y) ne sont pas √©gaux: x et y sont convertis en Double avant d'etre compar√©s"
	self components
		do:
			[:aPov | 
			aPov roundedOutline
				edgesDo: [:i :j | allSegments add: (LineSegment from: i to: j)]].	"Lines with equal endpoints but opposite directions will be also removed"
	duplicates := Set new.
	allSegments
		do:
			[:seg1 | 
			allSegments
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
	allSegments removeAll: duplicates.	"outline = contour externe. on prend les points successifs en partant du 1er point"
	outline := Polyline vertices: (self getPointsFromSegments: allSegments).	"internalLines = les contours internes d'un agregat de type anneau. on prend les points successifs en partant du 1er point"
	[allSegments isEmpty]
		whileFalse:
			[self internalLines
				add: (Polyline vertices: (self getPointsFromSegments: allSegments))]