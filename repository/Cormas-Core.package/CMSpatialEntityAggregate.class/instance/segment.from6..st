- displaying
segment: direction from6: segments
	"Selon la m√©thode de fabrication d'une image hexagonale (cf createTopLeftHexagonalCellImage), on a l'ordre suivant:
			    #
	  3       #         #      4
		#                  #	
	2	#                  #    5
		#                  #
		1    #         #   6  
			     #      
"
	
	(direction = #N or: [direction = #S]) ifTrue: [^nil].
	direction = #SW ifTrue: [^segments first].
	direction = #W ifTrue: [^segments at: 2].
	direction = #NW ifTrue: [^segments at: 3].
	direction = #NE ifTrue: [^segments at: 4].
	direction = #E ifTrue: [^segments at: 5].
	direction = #SE ifTrue: [^segments last]