- environment - sensing - space
nciAbout: aCSE
	"Purpose: returns the proportion of neighbours belonging to a given compound spatial entity, a kind of neighbourhood coherence index
Argument: aCSE = <SpatialEntitySet>
Return value: <Fraction>
Example: self nciAbout: (self myCSE: #Forest)"
	
	^(self neighbourhood select: [:c | aCSE components includes: c]) size
		/ self neighbourhood size