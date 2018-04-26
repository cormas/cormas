bounds accessing
insetBounds
	"return the bounds of the figure's points, without the extension"
	
	| rect |
	components isEmpty ifTrue: [^0 @ 0 extent: 0 @ 0].
	rect := components first insetBounds.
	2
		to: components size
		do: [:i | rect := rect merge: (components at: i) insetBounds].
	^rect	"	| rect |
	rect := points inject: (points first extent: 0 @ 0)
				into: 
					[:sum :point | 
					sum
						origin: (sum origin min: point);
						corner: (sum corner max: point)].
	^rect"	"^self bounds"