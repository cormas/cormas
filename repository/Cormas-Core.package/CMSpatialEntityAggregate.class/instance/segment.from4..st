- displaying
segment: direction from4: segments
	"Selon la m√©thode de fabrication d'une image rectangulaire (cf createTopLeftRectangularCellImage), on a l'ordre suivant:
                 1
		#######
	4	#         #   2
		#######
		     3
"
	
	(direction = #NE
		or: [direction = #NW or: [direction = #SW or: [direction = #SE]]])
		ifTrue: [^nil].
	direction = #N ifTrue: [^segments first].
	direction = #E ifTrue: [^segments at: 2].
	direction = #S ifTrue: [^segments at: 3].
	direction = #W ifTrue: [^segments last]