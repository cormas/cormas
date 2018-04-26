- displaying
getSkinE
	"Returns a collection of cells belonging to the 'internal skin' of the aggregate"
	
	| elementaryComponents |
	elementaryComponents := self elementaryComponents.
	^elementaryComponents
		select:
			[:c | 
			(c neighbourhood contains: [:n | (elementaryComponents includes: n) not])
				or: [c edge]]