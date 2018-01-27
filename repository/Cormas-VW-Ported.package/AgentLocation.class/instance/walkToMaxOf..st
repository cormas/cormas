+ moving
walkToMaxOf: aSymbol
	"Purpose: moves to the spatial entity in the direct neighbourhood (relative distance = 1) with the higher value for a given magnitude.
In case several destinations share the same maximum value, the tie is randomly broken.
Argument: aSymbol = <Symbol>, most commoly the name of an attribute, it can also be the name of any function returning a magniture
Example: self walkToMaxOf: #sugar"
	
	| destination destinations |
	destinations := self patch neighbourhood
		select: [:c | (c perform: aSymbol) respondsTo: #>].
	destinations isEmpty
		ifFalse:
			[destinations := self patch neighbourhood
				asSortedCollection:
					[:i :j | (i perform: aSymbol) > (j perform: aSymbol)].
			destinations := destinations
				select:
					[:c | (c perform: aSymbol) = (destinations first perform: aSymbol)].
			destination := Cormas selectRandomlyFrom: destinations.
			self moveTo: destination]