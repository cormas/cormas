private - regular cells - instance creation
initNeighbourhood6
	
	| v i |
	1
		to: cardinal
		do:
			[:k | 
			(self elementaryEntities at: k) isNil
				ifFalse:
					[v := Array new: 6 withAll: nil.
					(i := self westCellHexa: (self northCell: k)) > 0
						ifTrue:
							[v
								at: 1
								put: (self elementaryEntities at: i)].
					(i := self westCell: k) > 0
						ifTrue:
							[v
								at: 2
								put: (self elementaryEntities at: i)].
					(i := self westCellHexa: (self southCell: k)) > 0
						ifTrue:
							[v
								at: 3
								put: (self elementaryEntities at: i)].
					(i := self eastCellHexa: (self southCell: k)) > 0
						ifTrue:
							[v
								at: 4
								put: (self elementaryEntities at: i)].
					(i := self eastCell: k) > 0
						ifTrue:
							[v
								at: 5
								put: (self elementaryEntities at: i)].
					(i := self eastCellHexa: (self northCell: k)) > 0
						ifTrue:
							[v
								at: 6
								put: (self elementaryEntities at: i)].
					(self elementaryEntities at: k) orderedNeighbourhood: v]]