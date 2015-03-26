probes - charts
updateLocalCharts: t
	
	| classAndSelector res collec className selector |
	self localCharts
		do:
			[:s | 
			classAndSelector := self perform: (s asString , 'Data') asSymbol.
			className := classAndSelector first.
			selector := classAndSelector last.
			res := OrderedCollection new.
			(self perform: ('the' , className asString , 's') asSymbol)
				do:
					[:c | 
					res
						add:
							(Array
								with: (c perform: selector)
								with: c id)].
			res
				do:
					[:x | 
					((self perform: s) keys includes: x last)
						ifFalse:
							[collec := OrderedCollection new.
							t timesRepeat: [collec add: 0]]
						ifTrue: [collec := (self perform: s) at: x last].
					collec add: x first.
					(self perform: s)
						at: x last
						put: collec]]