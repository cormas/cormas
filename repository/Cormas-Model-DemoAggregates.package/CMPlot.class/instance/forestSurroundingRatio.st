control
forestSurroundingRatio
"Returns the number of neighbour cells that belong to an Aggregate, divided by the size of the neighbourhood"
	^(self neighbourhood select: [:n | n belongToAggregate]) size
		/ self neighbourhood size