private - irregular polygons aggregation
setAggregatsBounds: agregat
	
	| origin corner aComponent |
	(self spatialEntities at: agregat name)
		do:
			[:ag | 
			aComponent := ag components asOrderedCollection first.
			origin := aComponent bounds origin.
			corner := aComponent bounds corner.
			ag components
				do:
					[:b | 
					origin := b bounds origin min: origin.
					corner := b bounds corner max: corner].
			ag bounds: (Rectangle origin: origin corner: corner)]