menu
menuInspect
	
	| mb |
	mb := MenuBuilder new.
	mb add: 'show Code' -> #inspectCode.
	^mb menu