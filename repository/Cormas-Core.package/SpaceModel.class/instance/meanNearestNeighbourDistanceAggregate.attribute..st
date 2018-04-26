landscape indices
meanNearestNeighbourDistanceAggregate: aClass attribute: anAttribute
	"loop on the aggregates with same attribute and select the minimum distance. If the attribute is nil it means that there is only one type of aggregates"

	| classes n sum collec distMin dist aggregates a b |
	aggregates := self cormasModel
		perform: ('the' , aClass name asString , 's') asSymbol.
	classes := anAttribute isNil
		ifFalse: [ (aggregates collect: [ :ag | ag perform: anAttribute ]) asSet ]
		ifTrue: [ aggregates ].
	n := classes size.
	n < 2
		ifTrue: [ ^ 0 ].
	sum := 0.
	classes
		do: [ :i | 
			collec := anAttribute isNil
				ifFalse: [ aggregates select: [ :ag | (ag perform: anAttribute) = i ] ]
				ifTrue: [ aggregates ].
			distMin := 10000000.
			1 to: collec size do: [ :k | 
				a := collec at: k.
				k + 1 to: collec size do: [ :j | 
					b := collec at: j.
					b ~= a
						ifTrue: [ dist := a distSurroundAggregatePixel: b.
							distMin := distMin min: dist ] ] ].
			sum := sum + distMin ].
	^ sum / n