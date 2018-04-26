private - regular polygons
setGivenSizes: dis toAggregates: compoundEntity
	"dis is an array of pair-values: #(#(X1 GS1) #(X2 GS2) ... #(Xi GSi))"
	"Xi and GSi are integers, respectively a number of aggregates and the givenSize for these aggregates"
	"Ex: you want to generate 3 aggregates size 1, 5 size 2, and 2 size 3. dis should be #(#(3 1) #(5 2) #(2 3))"
	"The sum of all Xi should be the same than aCollec size"
	
	| aCollec counter subsetIndice |
	aCollec := self spatialEntities at: compoundEntity name.
	((dis collect: [:pair | pair first])
		inject: 0
		into: [:sum :i | sum + i]) ~= aCollec size
		ifTrue: [self error: 'Inconsistency in the number of aggregates !!!'].
	counter := 0.
	subsetIndice := 1.
	aCollec
		do:
			[:s | 
			s givenSize: (dis at: subsetIndice) last.
			counter := counter + 1.
			counter = (dis at: subsetIndice) first
				ifTrue:
					[counter := 0.
					subsetIndice := subsetIndice + 1]]