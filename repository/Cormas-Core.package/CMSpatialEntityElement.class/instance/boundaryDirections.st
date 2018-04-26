- environment - sensing - space
boundaryDirections
	"Returns a collection of direction (ex: (#E #SE #NE)) of the cell, without cell => the edge of the grid"
	
	| collec |
	collec := Set new.
	self spaceModel nbNeighbours = #four
		ifTrue:
			[self neighbourN isNil ifTrue: [collec add: #N].
			self neighbourW isNil ifTrue: [collec add: #W].
			self neighbourS isNil ifTrue: [collec add: #S].
			self neighbourE isNil ifTrue: [collec add: #E]].
	self spaceModel nbNeighbours = #eight
		ifTrue:
			[self neighbourN isNil ifTrue: [collec add: #N].
			self neighbourW isNil ifTrue: [collec add: #W].
			self neighbourS isNil ifTrue: [collec add: #S].
			self neighbourE isNil ifTrue: [collec add: #E].
			self neighbourNE isNil ifTrue: [collec add: #NE].
			self neighbourSE isNil ifTrue: [collec add: #SE].
			self neighbourNW isNil ifTrue: [collec add: #NW].
			self neighbourSW isNil ifTrue: [collec add: #SW]].
	self spaceModel nbNeighbours = #six
		ifTrue:
			[self neighbourW isNil ifTrue: [collec add: #W].
			self neighbourE isNil ifTrue: [collec add: #E].
			self neighbourNE isNil ifTrue: [collec add: #NE].
			self neighbourSE isNil ifTrue: [collec add: #SE].
			self neighbourNW isNil ifTrue: [collec add: #NW].
			self neighbourSW isNil ifTrue: [collec add: #SW]].
	^collec