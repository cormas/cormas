deprecated
initCollec: aListOfEntities
	
	| accessW |
	aListOfEntities
		do:
			[:e | 
			e new perform: #CurrentId: with: 0.
			accessW := ('the' , e name asString , 's:') asSymbol.
			self
				perform: accessW
				with: OrderedCollection new]