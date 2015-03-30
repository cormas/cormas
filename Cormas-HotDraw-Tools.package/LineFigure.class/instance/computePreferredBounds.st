private
computePreferredBounds
	
	^annotations
		inject: super computePreferredBounds
		into: [:sum :each | sum merge: each bounds]