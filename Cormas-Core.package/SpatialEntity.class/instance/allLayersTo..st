- environment - sensing - space
allLayersTo: radius
	"returns a collection (collResult) of layers :
		- index of collResult is the distance to this layer, 
		- each sub collection is a layer of cells.
radius = integer >= 0.
ex: collResult =	
		[1 ->#(self)
		2 ->#(self neighbourhood)
		3 -> #(layer 2)
		4 -> #(layer 3)  ...]"
	
	| layer1 layer2 collResult |
	collResult := OrderedCollection new: radius.
	layer1 := Array with: self.
	collResult add: layer1.
	radius = 0 ifTrue: [^collResult].
	layer2 := self neighbourhood.
	collResult add: layer2.
	[collResult size < (radius + 1)]
		whileTrue:
			[collResult add: (self layer3FromLayer2: layer2 andLayer1: layer1) first.
			layer2 := collResult last.
			layer1 := collResult at: collResult size - 1].
	^collResult