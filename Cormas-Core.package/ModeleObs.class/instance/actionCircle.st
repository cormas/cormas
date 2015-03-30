action
actionCircle
	
	| angle a |
	angle := (360 / agents size) asFloat degreesToRadians.
	1
		to: agents size
		do:
			[:i | 
			a := agents at: i.
			a Cadre: self vue bounds.
			a emplacementCircle: angle * i].
	fonction goFirstLevel