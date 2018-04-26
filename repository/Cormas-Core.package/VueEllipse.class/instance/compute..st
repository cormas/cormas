private
compute: abPoint
	
	| angle x y tmp |
	tmp := OrderedCollection new.
	0
		to: 360
		do:
			[:i | 
			angle := i degreesToRadians.
			x := abPoint x * angle cos.
			y := abPoint y * angle sin.
			tmp add: x @ y].
	^Polyline vertices: tmp