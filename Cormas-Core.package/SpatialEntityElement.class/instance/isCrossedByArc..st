- testing
isCrossedByArc: anArc
	"answer if the cell is crossed by anArc"
	
	| arcLine |
	self halt.	"does not work anymore. an ESE does not know directly it bounds."
	Dev todo:
			'Il faudrait justement que √ßa fonctionne !
L idee initiale √©tait d avoir un espace par d√©faut (non affich√©) sur lequel on pourrait plus facilement faire ce genre de calcul'.
	arcLine := LineSegment
		from: anArc startCell center
		to: anArc stopCell center.
	^arcLine outlineIntersects: self bounds