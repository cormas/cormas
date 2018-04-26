private - irregular polygons aggregation
outlineAggregatedFrom: listPolygons
	
	| newOutline voisinsConcernes listeNoeuds newSegment listeSegments followingSegment |
	listeSegments := OrderedCollection new.
	newOutline := OrderedCollection new.
	listPolygons
		do:
			[:poly1 | 
			listeNoeuds := OrderedCollection new.
			voisinsConcernes := poly1 neighbourhood
				select: [:v | listPolygons includes: v].
			voisinsConcernes isEmpty ifTrue: [self halt].
			voisinsConcernes
				do:
					[:v | 
					listeNoeuds
						add: (poly1 nodes at: v) first;
						add: (poly1 nodes at: v) last].
			listeNoeuds := listeNoeuds asSortedCollection asOrderedCollection.
			listeNoeuds
				addLast: listeNoeuds first;
				remove: listeNoeuds first.
			1
				to: listeNoeuds size
				by: 2
				do:
					[:i | 
					newSegment := OrderedCollection new.
					((listeNoeuds at: i + 1) < (listeNoeuds at: i)
						and:
							[(listeNoeuds at: i) ~= poly1 outline size | ((listeNoeuds at: i + 1) ~= 1)])
						ifTrue:
							[(listeNoeuds at: i)
								to: poly1 outline size - 1
								do: [:ii | newSegment add: (poly1 outline at: ii)].
							1
								to: (listeNoeuds at: i + 1)
								do: [:ii | newSegment add: (poly1 outline at: ii)]].
					(listeNoeuds at: i + 1) > (listeNoeuds at: i)
						ifTrue:
							[(listeNoeuds at: i)
								to: (listeNoeuds at: i + 1)
								do: [:ii | newSegment add: (poly1 outline at: ii)]].
					newSegment isEmpty ifFalse: [listeSegments add: newSegment]]].
	newOutline := listeSegments first.
	[newOutline first = newOutline last]
		whileFalse:
			[followingSegment := listeSegments
				detect: [:s | s first = newOutline last]
				ifNone: [nil].
			followingSegment isNil
				ifTrue: [self halt]
				ifFalse:
					[followingSegment removeFirst.
					newOutline addAll: followingSegment]].
	^newOutline