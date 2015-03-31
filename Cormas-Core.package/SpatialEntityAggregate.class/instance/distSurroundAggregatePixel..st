- deprecated
distSurroundAggregatePixel: anAg
	"Deprecated"
	
	| distMin dist |
	distMin := (self at: 1) distCenter: (anAg at: 1).
	self surround
		do:
			[:a | 
			anAg surround
				do:
					[:b | 
					dist := a distCenter: b.
					dist < distMin ifFalse: [distMin := dist]]].
	^distMin