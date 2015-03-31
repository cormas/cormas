private - regular cells - instance creation
initNeighbourhood4
	
	| v i |
	1
		to: cardinal
		do:
			[:k | 
			(self elementaryEntities at: k) isNil
				ifFalse:
					[v := Array new: 4 withAll: nil.
					(i := self northCell: k) > 0
						ifTrue:
							[v
								at: 1
								put: (self elementaryEntities at: i)].
					(i := self westCell: k) > 0
						ifTrue:
							[v
								at: 2
								put: (self elementaryEntities at: i)].
					(i := self southCell: k) > 0
						ifTrue:
							[v
								at: 3
								put: (self elementaryEntities at: i)].
					(i := self eastCell: k) > 0
						ifTrue:
							[v
								at: 4
								put: (self elementaryEntities at: i)].
					(self elementaryEntities at: k) orderedNeighbourhood: v]]