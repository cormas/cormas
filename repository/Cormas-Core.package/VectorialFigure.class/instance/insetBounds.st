bounds accessing
insetBounds
	"return the bounds of the figure's points, without the extension"
	
	| rect |
	rect := points
		inject: (points first extent: 0 @ 0)
		into:
			[:sum :point | 
			sum
				origin: (sum origin min: point);
				corner: (sum corner max: point)].
	^rect