private_aleat
selectSimpleRandomlyFrom: aCollection
	"Returns an item at randomly position of the collection 'aCollection'. 
ex: Cormas selectSimpleRandomlyFrom: (Set withAll: #(1 2 3 4 5))"
	
	^aCollection
		at:
			(self
				simpleRandomFrom: 1
				to: aCollection size)