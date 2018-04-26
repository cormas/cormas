private - regular cells - instance creation
initNeighbourhood8
	
	| v i |
	1
		to: cardinal
		do:
			[:k | 
			(self elementaryEntities at: k) isNil
				ifFalse:
					[v := Array new: 8 withAll: nil.
					(i := self northCell: k) > 0
						ifTrue:
							[v
								at: 1
								put: (self elementaryEntities at: i)].
					(i := self northCell: (self westCell: k)) > 0
						ifTrue:
							[v
								at: 2
								put: (self elementaryEntities at: i)].
					(i := self westCell: k) > 0
						ifTrue:
							[v
								at: 3
								put: (self elementaryEntities at: i)].
					(i := self southCell: (self westCell: k)) > 0
						ifTrue:
							[v
								at: 4
								put: (self elementaryEntities at: i)].
					(i := self southCell: k) > 0
						ifTrue:
							[v
								at: 5
								put: (self elementaryEntities at: i)].
					(i := self southCell: (self eastCell: k)) > 0
						ifTrue:
							[v
								at: 6
								put: (self elementaryEntities at: i)].
					(i := self eastCell: k) > 0
						ifTrue:
							[v
								at: 7
								put: (self elementaryEntities at: i)].
					(i := self northCell: (self eastCell: k)) > 0
						ifTrue:
							[v
								at: 8
								put: (self elementaryEntities at: i)].
					(self elementaryEntities at: k) orderedNeighbourhood: v]]