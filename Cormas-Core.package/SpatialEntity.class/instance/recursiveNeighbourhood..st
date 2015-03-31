+ environment - sensing - space
recursiveNeighbourhood: radius
	"Purpose: returns a collection of receiver-like spatial entities within a given radius of the receiver.
The receiver itself is included in the collection, which is ordered from the center (self) to the perimeter of the radius.
Argument: radius = <Integer>
Return value: <OrderedCollection>
Example: self recursiveNeighbourhood: 0 (== OrderedCollection with: self)
Example: self recursiveNeighbourhood: 1 (== self neighbourhoodAndSelf)"
	
	| allCells layers |
	allCells := OrderedCollection new.
	layers := self allLayersTo: radius.
	layers do: [:layer | allCells addAll: layer].
	^allCells