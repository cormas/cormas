deplacement
distance: aPoint fromEllipse: abPoint
	
	| alpha E |
	E := aPoint - centre.
	E y = 0 ifTrue: [^abPoint].
	alpha := (E x / E y * abPoint y / abPoint x) arcTan.
	^((abPoint x * alpha sin) @ (abPoint y * alpha cos)) rrr