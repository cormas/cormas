initialize
postBuildWith: aBuilder
	
	self initBlocks.
	self buildMenuDecisionsSheet.
	self setBlocksInvisible.
	self model playersNames do: [:n | self prepareDecisionsSheet: n].
	super postBuildWith: aBuilder