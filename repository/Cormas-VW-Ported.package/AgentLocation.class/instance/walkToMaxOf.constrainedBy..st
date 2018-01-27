+ moving
walkToMaxOf: aSymbol constrainedBy: aBlock
	"Purpose: moves to the spatial entity in the direct neighbourhood (relative distance = 1) with the higher value for a given magnitude and fulfilling the constraint specified in aBlock.
In case several possible destinations share the same maximum value, the tie is randomly broken.
Arguments:	aSymbol = <Symbol>, most commoly the name of an attribute, it can also be the name of any function returning a magniture
			aBlock = <BlockClosure>
Example: self walkToMaxOf: #sugar constrainedBy: [:c | c noOccupant]"
	
	| destination destinations |
	destinations := self patch neighbourhood
		select:
			[:c | ((c perform: aSymbol) respondsTo: #>) and: [aBlock value: c]].
	destinations isEmpty
		ifFalse:
			[destinations := destinations
				asSortedCollection:
					[:i :j | (i perform: aSymbol) > (j perform: aSymbol)].
			destinations := destinations
				select:
					[:c | (c perform: aSymbol) = (destinations first perform: aSymbol)].
			destination := Cormas selectRandomlyFrom: destinations.
			self moveTo: destination]